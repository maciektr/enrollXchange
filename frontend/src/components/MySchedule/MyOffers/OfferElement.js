import React, {useState} from "react";
import '../../../styles/my-offers.css'
import {Button} from "react-bootstrap";
import {SlideDown} from 'react-slidedown'
import 'react-slidedown/lib/slidedown.css'
import TargetClassElement from "./TargetClassElement";

const OfferElement = ({props}) => {
    const [closed, setClosed] = useState(true);
    const handleClick = () => setClosed(prevState => !prevState)

    const htmlList = props.exchangeTo.map(element => <TargetClassElement props={element} key={element.id} />);
    return (
        <>
            <div className="row mt-3">
                <div className="col-8 offset-2 offer-element d-flex justify-content-between align-items-center">
                    <div className="ml-4">
                        {props.title} {props.lecturer}
                    </div>

                    <div className="mr-4">
                        <span>
                            {props.day} {props.time}</span>
                        <span className="ml-5">
                            <Button variant="success" className="mr-3" onClick={handleClick}>
                                {closed ? "Więcej" : "Zamknij"}
                            </Button>
                            <Button variant="danger">Usuń</Button>
                        </span>
                    </div>
                </div>
            </div>
            <div className="row">
                <div className="col-8 offset-2 slider">
                    <SlideDown className={'my-dropdown-slidedown'} closed={closed}>
                        <ul className="list-group list-group-mine list-group-flush">
                            {htmlList}
                        </ul>
                    </SlideDown>
                </div>
            </div>
        </>
    )
}

export default OfferElement;
