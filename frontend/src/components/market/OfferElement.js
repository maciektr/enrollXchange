import React, {useState} from 'react';
import {Button, Modal} from "react-bootstrap";

const OfferElement = ({props}) => {
    const [showInfo, setShowInfo] = useState(false);
    const [showConfirmation, setShowConfirmation] = useState(false);

    const handleConfirmation = () => {
        //TODO handle exchange
        setShowConfirmation(false)
        alert("DONE")
    }

    return (
        <div className="offset-2 col-8 offer-element d-flex justify-content-between align-items-center mt-4">
            <div className="ml-4">
                {props.title + ' - ' + props.lecturer}
            </div>

            <div className="mr-4">
                <span>
                    {props.day + ' ' + props.time}
                </span>
                <span className="ml-5">
                    <Button variant="info" className="mr-3" onClick = {() => setShowInfo(true)}>Info</Button>

                    <Modal
                    show={showInfo}
                    onHide={() => setShowInfo(false)}
                    size="lg"
                    aria-labelledby="contained-modal-title-vcenter"
                    centered>
                    <Modal.Header closeButton>
                        <Modal.Title id="contained-modal-title-vcenter">
                        {props.title + ' - ' + props.lecturer + '\t' + props.day + ' '+props.time}
                        </Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <p>
                        {props.comment}
                        </p>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button onClick={() => setShowInfo(false)}>Zamknij</Button>
                    </Modal.Footer>
                    </Modal>


                    <Button variant="success" onClick = {() => setShowConfirmation(true)}>Zaakceptuj</Button>

                    <Modal
                    show={showConfirmation}
                    onHide={() => setShowConfirmation(false)}
                    size="lg"
                    aria-labelledby="contained-modal-title-vcenter"
                    centered>
                    <Modal.Header closeButton>
                        <Modal.Title id="contained-modal-title-vcenter">
                        {props.title + ' - ' + props.lecturer + '\t' + props.day + ' '+props.time}
                        </Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                        <h5>
                        Czy potwierdzasz zamianę?
                        </h5>
                    </Modal.Body>
                    <Modal.Footer>
                        <Button variant='success' onClick={() => handleConfirmation()}>Zaakceptuj</Button>
                        <Button variant='danger' onClick={() => setShowConfirmation(false)}>Odrzuć</Button>
                    </Modal.Footer>
                    </Modal>
                </span>
            </div>

        </div>
    )
}

export default OfferElement;
