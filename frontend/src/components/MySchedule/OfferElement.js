import React, {useState} from "react";
import '../../styles/offer.css'
import {Button} from "react-bootstrap";
import {SlideDown} from 'react-slidedown'
import 'react-slidedown/lib/slidedown.css'

const OfferElement = ({props}) => {
    console.log(props);

    return (
        <>
            <div className="row mt-3">
                <div className="col-8 offset-2 offer-element d-flex justify-content-between align-items-center">
                    <div className="ml-4">
                        {props.currentClass.title}
                    </div>

                    <div className="mr-4">
                        <span>
                            {props.currentClass.day}{' '}
                            {new Date(props.currentClass.start).getHours()}:{new Date(props.currentClass.start).getMinutes()} - {' '}
                            {new Date(props.currentClass.end).getHours()}:{new Date(props.currentClass.end).getMinutes()}
                        </span>
                        <span className="ml-5">
                            <Button variant="success" className="mr-3">Więcej</Button>
                            <Button variant="danger">Usuń</Button>
                        </span>
                    </div>
                </div>
            </div>
            <div className="row">
                <div className="col-8 offset-2 slider">
                    <SlideDown className={'my-dropdown-slidedown'}>
                        <ul>
                            <li>kasdasd</li>
                            <li>kasdasd</li>
                            <li>kasdasd</li>
                            <li>kasdasd</li>
                            <li>kasdasd</li>
                            <li>kasdasd</li>

                        </ul>
                    </SlideDown>
                </div>
            </div>
        </>
    )
}

export default OfferElement;
