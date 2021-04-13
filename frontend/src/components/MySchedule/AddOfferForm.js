import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css'
import Modal from 'react-bootstrap/Modal'
import {Button, Form, Col} from "react-bootstrap";

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
    return (
        <Modal show={props.show} onHide={props.onHide}>
            <Modal.Header closeButton>
                <Modal.Title>Szczegóły terminu</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Col>
                    <b>Twój termin:</b>
                    <div>{getDay(props.event.start)} </div>
                    <div>{getDateString(props.event.start)} - {getDateString(props.event.end)}</div>
                    <div>{props.event.title}</div>
                </Col>
                <hr/>
                <Col>
                    <b>Zamień swój termin:</b>
                    <Form>
                        <Form.Group controlId="AddOfferForm.daySelect">
                            <Form.Label><span style={{color: 'black'}}>Preferowany dzień zajęć</span></Form.Label>
                            <Form.Control as='select' custom>
                                <option>dowolny</option>
                                <option>Piątek</option>
                            </Form.Control>
                        </Form.Group>
                        <Form.Group controlId="AddOfferForm.timeSelect">
                            <Form.Label><span style={{color: 'black'}}>Preferowany czas zajęć</span></Form.Label>
                            <Form.Control as='select' custom>
                                <option>dowolny</option>
                                <option>8:00 - 9:30</option>
                            </Form.Control>
                        </Form.Group>
                        <Form.Group controlId="AddOfferForm.teacherSelect">
                            <Form.Label><span style={{color: 'black'}}>Preferowany prowadzący</span></Form.Label>
                            <Form.Control as='select' custom>
                                <option>dowolny</option>
                                <option>Piotr Faliszewski</option>
                            </Form.Control>
                        </Form.Group>
                        <Form.Group controlId="AddOfferForm.commentTextArea">
                            <Form.Label><span style={{color: 'black'}}>Komentarz</span></Form.Label>
                            <Form.Control as="textarea" rows={2} />
                        </Form.Group>
                    </Form>
                </Col>

            </Modal.Body>
            <Modal.Footer>
                <Button variant="danger">Złóż ofertę zamiany</Button>
            </Modal.Footer>
        </Modal>
    )
}

export default AddOfferForm;
