import React, {useEffect, useState} from "react";
import {ButtonGroup, Dropdown, DropdownButton} from "react-bootstrap";
import '../../styles/styles.css'
import {data} from './Data'

const Market = () => {
    const [offers, setOffers] = useState([]);
    const [subject, setSubject] = useState([]);
    const [lecturer, setLecturer] = useState([]);
    const [day, setDay] = useState([]);
    const [time, setTime] = useState([]);

    useEffect(() => {
        //TODO Replace with fetch
        setOffers(data);
        setSubject('clear');
        setLecturer('clear');
        setDay('clear');
        setTime('clear');
    }, []);

    const types = ['Przedmioty', 'Prowadzący', 'Dzień', 'Godzina'];
    const subjects = offers.map((elem) => (elem['title'])).filter((v,i,a) => a.indexOf(v) === i);
    const lecturers = offers.map((elem) => (elem['lecturer'])).filter((v,i,a) => a.indexOf(v) === i);
    const days = offers.map((elem) => (elem['day'])).filter((v,i,a) => a.indexOf(v) === i);
    const times = offers.map((elem) => (elem['time'])).filter((v,i,a) => a.indexOf(v) === i);
    const alls = [subjects, lecturers, days, times];
    const all = [subject, lecturer, day, time];


    return (
        <>
            {types.map((type, ix) => (
                <DropdownButton as={ButtonGroup} key={type} variant='primary' title={type}>
                    {(all[ix]=='clear' ? <Dropdown.Item key='clear' active>clear</Dropdown.Item> : <Dropdown.Item key='clear'>clear</Dropdown.Item>)}
                    <Dropdown.Divider />
                    {alls[ix].map((el, ix) => (
                        (all[ix]=={el} ? (<Dropdown.Item key={el} eventKey={ix} active>{el}</Dropdown.Item>) : (<Dropdown.Item key={el} eventKey={ix}>{el}</Dropdown.Item>))
                    ))}
                </DropdownButton>
            ))}
        </>
    )
}

export default Market;