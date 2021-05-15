from django.contrib import admin

import tablib
import datetime
from import_export.admin import ImportMixin
from import_export.formats import base_formats
from import_export.forms import ConfirmImportForm
from import_export import resources

from enroll.models import Student, Lecturer, Enrollment, ClassTime, Course
from enroll.fields import DayOfTheWeek


class EnrollImporter:
    def __init__(self, in_stream):
        self.students = dict()
        lines = self.parse_file(in_stream)
        self.save_models(lines)

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

    def parse_file(self, in_stream):
        def parse_name(name):
            return {
                "first_name": name.split(" ", 1)[0],
                "last_name": name.split(" ", 1)[1],
            }

        def parse_student(line):
            student = {
                "id": line.split(";", 1)[0],
                "name": parse_name(line.split(";", 1)[1]),
            }
            student["id"] = student["id"] if student["id"] else None
            self.students[line] = student
            return student

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
                if day == "poniedziałek":
                    return DayOfTheWeek.MONDAY
                if day == "wtorek":
                    return DayOfTheWeek.TUESDAY
                if day == "środa":
                    return DayOfTheWeek.WEDNESDAY
                if day == "czwartek":
                    return DayOfTheWeek.THURSDAY
                if day == "piątek":
                    return DayOfTheWeek.FRIDAY
                if day == "sobota":
                    return DayOfTheWeek.SATURDAY
                if day == "niedziela":
                    return DayOfTheWeek.SUNDAY

            def parse_time_entry(entry):
                day, start = entry.split(" - ", 1)[0].split(" ", 1)
                hour, minute = start.split(":", 1)
                return {
                    "day": get_day(day),
                    "start": datetime.time(int(hour), int(minute), 0),
                }

            time_lines = time_lines[1:]
            time_entry, lecturer_entry = time_lines[0].split("; ", 1)
            time = {
                "time": parse_time_entry(time_entry),
                "lecturer": parse_name(lecturer_entry),
            }
            time_lines = time_lines[1:]
            time_lines = list(map(parse_student, time_lines))
            time["students"] = time_lines
            return time

        file = EnrollImporter.clear_list(
            map(lambda line: line.strip(), in_stream.split("\n"))
        )
        file = split_courses(file)
        file = parse_courses(file)
        return file

    def save_models(self, parsed):
        for student in self.students.values():
            Student.objects.update_or_create(
                student_id=student["id"],
                defaults={
                    "last_name": student["name"]["last_name"],
                    "first_name": student["name"]["first_name"],
                },
            )

        def create_course():
            pass

        def create_time():
            pass

        for course in parsed:
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
