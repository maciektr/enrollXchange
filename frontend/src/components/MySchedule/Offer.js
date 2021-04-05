import React, {useEffect, useState} from "react";
import '../../styles/offer.css'
import {Button} from "react-bootstrap";

const Offer = () => {
    return (
        <div className="row mt-3">
                <div className="col-6 offset-3 offer-element d-flex justify-content-between align-items-center">
                    <div className="ml-4">
                        Logika Wt 11:15
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor"
                         className="bi bi-arrow-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                              d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                    </svg>

                    <div>
                        Logika Wt 11:15
                    </div>


                    <div className="mr-4">
                        <Button variant="success" className="mr-3">Więcej</Button>
                        <Button variant="danger">Usuń</Button>
                    </div>

                </div>
        </div>
    )
}

export default Offer;
