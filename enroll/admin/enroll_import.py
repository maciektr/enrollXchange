from django.contrib import admin

import tablib
import datetime
from import_export.admin import ImportMixin
from import_export.formats import base_formats
from import_export.forms import ConfirmImportForm
from import_export import resources

from enroll.models import Enrollment
from enroll.fields import DayOfTheWeek


class EnrollImporter:
    def __init__(self, in_stream):
        lines = EnrollImporter.parse_file(in_stream)
        print(lines)

    @staticmethod
    def clear_list(array):
        return list(filter(lambda el: el, array))

    @staticmethod
    def split_list(array, condition):
        if not array:
            return array
        res = []
        subarray = [array[0]]
        array = array[1:]
        for el in array:
            if condition(el):
                res.append(subarray)
                subarray = [el]
            else:
                subarray.append(el)
        res.append(subarray)
        return res

    @staticmethod
    def parse_file(in_stream):
        def split_courses(lines):
            return EnrollImporter.split_list(
                lines, lambda line: line and line[-1] == ";" and line != ";"
            )

        def parse_courses(lines):
            def parse_course(course_lines):
                course = {"name": course_lines[0].rstrip(";")}
                course_lines = course_lines[1:]
                times = EnrollImporter.split_list(
                    course_lines, lambda line: line == ";"
                )
                course["times"] = list(map(parse_time, times))
                return course

            return list(map(parse_course, lines))

        def parse_time(time_lines):
            def get_day(day):
                if day == 'poniedzialek':
                    return DayOfTheWeek.MONDAY
                if day == 'wtorek':
                    return DayOfTheWeek.TUESDAY
                if day == 'sroda':
                    return DayOfTheWeek.WEDNESDAY
                if day == 'czwartek':
                    return DayOfTheWeek.THURSDAY
                if day == 'piatek':
                    return DayOfTheWeek.FRIDAY
                if day == 'sobota':
                    return DayOfTheWeek.SATURDAY
                if day == 'niedziela':
                    return DayOfTheWeek.SUNDAY

            def parse_time_entry(entry):
                day, start = entry.split(' - ', 1)[0].split(' ', 1)
                hour, minute = start.split(':', 1)
                return {'day': get_day(day), 'start': datetime.time(int(hour), int(minute), 0)}

            time_lines = time_lines[1:]
            time = {
                "time": parse_time_entry(time_lines[0].split("; ", 1)[0]),
                "lecturer": time_lines[0].split("; ", 1)[1],
            }
            time_lines = list(
                filter(
                    lambda line: len(line) > 0,
                    map(
                        lambda line: {
                            "id": line.split(";")[0],
                            "name": line.split(";")[1],
                        },
                        time_lines,
                    ),
                )
            )
            time["students"] = time_lines
            return time

        file = EnrollImporter.clear_list(
            map(lambda line: line.strip(), in_stream.split("\n"))
        )
        file = split_courses(file)
        file = parse_courses(file)
        return file

    def save_models(self, parsed):
        pass


class CustomConfirmImportForm(ConfirmImportForm):
    pass


class EnrollImportFormat(base_formats.CSV):
    def get_title(self):
        return "enroll"

    def create_dataset(self, in_stream, **kwargs):
        EnrollImporter(in_stream)
        return tablib.Dataset()


class EnrollmentAdmin(ImportMixin, admin.ModelAdmin):
    resource_class = resources.modelresource_factory(model=Enrollment)

    def get_import_formats(self):
        return [EnrollImportFormat]

    def get_confirm_import_form(self):
        return CustomConfirmImportForm
