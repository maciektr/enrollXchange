import React, {useEffect, useState} from "react";
import FullCalendar from "@fullcalendar/react";
import timeGridPlugin from "@fullcalendar/timegrid";
import {classes} from './MockData'

import 'bootstrap/dist/css/bootstrap.min.css'
import AddOfferForm from "./AddOfferForm";


const GridFullcalendar = () => {
    const [events, setEvents] = useState([]);
    const [isInfoWindowOpen, setIsInfoWindowOpen] = useState(false);
    const [highlightedEvent, setHighLightedEvent] = useState(null);

    useEffect(() => {
        setEvents(classes);
    }, [])

    const handleEventClick= (props) => {
        setHighLightedEvent(props.event)
        setIsInfoWindowOpen(true);
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

            {isInfoWindowOpen ?
                <AddOfferForm
                    show={isInfoWindowOpen}
                    onHide={() => setIsInfoWindowOpen(false)}
                    event={highlightedEvent}
                />
            : null}
        </div>
    )
}

export default GridFullcalendar;
