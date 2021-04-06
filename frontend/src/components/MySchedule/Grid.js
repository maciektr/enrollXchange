import React, {useEffect, useState} from "react";
import FullCalendar from "@fullcalendar/react";
import timeGridPlugin from "@fullcalendar/timegrid";
import {classes} from './MockData'

const GridFullcalendar = () => {
    const [events, setEvents] = useState([]);

    useEffect(() => {
        //TODO fetch data from real api
        setEvents(classes);
    }, [])

    const handleEventClick= (props) => {
        alert(props.event.title);
    }

    return (
        <div>
            <FullCalendar
                plugins={[ timeGridPlugin ]}
                initialView="timeGridWeek"
                weekends={false}
                validRange={{
                    start: '2021-03-01',
                    end: '2021-03-07'
                }}
                headerToolbar={{
                    start: '',
                    center: '',
                    end: ''
                }}
                allDaySlot={false}
                dayHeaderFormat={{weekday: 'short'}}
                slotMinTime='08:00:00'
                slotMaxTime='20:00:00'
                eventClick={handleEventClick}
                slotEventOverlap={false}
                expandRows={true}
                events={events}
            />
        </div>
    )
}

export default GridFullcalendar;
