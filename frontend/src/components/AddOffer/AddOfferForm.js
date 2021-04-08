import React, {useEffect, useState} from "react";
import 'bootstrap/dist/css/bootstrap.min.css'
import Modal from 'react-bootstrap/Modal'
import {Button, Form, Row, Container} from "react-bootstrap";

const weekdays = [
    "Niedziela",
    "Poniedziałek",
    "Wtorek",
    "Środa",
    "Czwartek",
    "Piątek",
    "Sobota",
]

function getDateString(date) {
    let d = new Date(date);
    return d.getHours() + ":" + d.getMinutes()
}

function getDay(date) {
    let d = new Date(date);
    return weekdays[d.getDay()]
}


const AddOfferForm = (props) => {
    // TODO: add loading data (can be even mock) and show in dropdowns
    // TODO: actively validate form so that user can not pick non-existent class
    // TODO: make it look better :)
    return (
        <Modal show={props.show} onHide={props.onHide}>
            <Modal.Header closeButton>
                <Modal.Title>Szczegóły terminu</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Row><b>Twój termin:</b></Row>
                <Container className="offset-0.3">
                    <Row>{getDay(props.event.start)} </Row>
                    <Row>{getDateString(props.event.start)} - {getDateString(props.event.end)}</Row>
                    <Row>{props.event.title}</Row>
                </Container>

                <Row><b>Zamień swój termin:</b></Row>
                <Form>
                    <Form.Group controlId="AddOfferForm.daySelect">
                        <Form.Label>Preferowany dzień zajęć</Form.Label>
                        <Form.Control as='select' custom>
                            <option>dowolny</option>
                            <option>Piątek</option>
                        </Form.Control>
                    </Form.Group>
                    <Form.Group controlId="AddOfferForm.timeSelect">
                        <Form.Label>Preferowany czas zajęć</Form.Label>
                        <Form.Control as='select' custom>
                            <option>dowolny</option>
                            <option>8:00 - 9:30</option>
                        </Form.Control>
                    </Form.Group>
                    <Form.Group controlId="AddOfferForm.teacherSelect">
                        <Form.Label>Preferowany prowadzący</Form.Label>
                        <Form.Control as='select' custom>
                            <option>dowolny</option>
                            <option>Piotr Faliszewski</option>
                        </Form.Control>
                    </Form.Group>
                    <Form.Group controlId="AddOfferForm.commentTextArea">
                        <Form.Label>Komentarz</Form.Label>
                        <Form.Control as="textarea" rows={2} />
                    </Form.Group>
                </Form>
                
            </Modal.Body>
            <Modal.Footer>
                <Button variant="danger">Złóż ofertę zamiany</Button>
            </Modal.Footer>
        </Modal>
    )
}

export default AddOfferForm;