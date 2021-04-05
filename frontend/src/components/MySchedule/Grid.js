import React, {useEffect} from "react";
import FullCalendar from "@fullcalendar/react";
import timeGridPlugin from "@fullcalendar/timegrid";
import {data} from './MockData'

const GridFullcalendar = () => {
    const handleEventClick= (props) => {
        // console.log(props.event.extendedProps);
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
                slotMaxTime='21:00:00'
                eventClick={handleEventClick}
                slotEventOverlap={false}
                expandRows={true}
                events={data}
            />
        </div>
    )
}

export default GridFullcalendar;
