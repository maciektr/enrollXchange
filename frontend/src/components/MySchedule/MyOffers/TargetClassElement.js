import React from "react";
import {Button} from "react-bootstrap";

const TargetClassElement = ({props}) => {
    return (
        <>
            <li className="list-group-item">
                <div className="d-flex justify-content-between align-items-center">
                    <div className="ml-4">
                        {props.title}
                    </div>

                    <div className="mr-4">
                        <span>
                            {props.day}{' '}
                            {new Date(props.start).getHours()}:{new Date(props.start).getMinutes()} - {' '}
                            {new Date(props.end).getHours()}:{new Date(props.end).getMinutes()}
                        </span>
                        <span className="ml-5">
                            <Button variant="danger">Usuń</Button>
                        </span>
                    </div>
                </div>
            </li>
        </>
    )
}

export default TargetClassElement;
