import React from 'react';
import {Button} from "react-bootstrap";

const OfferElement = ({props}) => {
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
                    <Button variant="info" className="mr-3">Info</Button>
                    <Button variant="success">Zaakceptuj</Button>
                </span>
            </div>

        </div>
    )
}

export default OfferElement;
