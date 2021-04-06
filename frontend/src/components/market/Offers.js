import React, {useEffect, useState} from "react";
import '../../styles/offer.css'
import {Button} from "react-bootstrap";
import {data} from './Data'

//col-lg offset-3 offer-element d-flex justify-content-between align-items-center
/*
                        <div className="mr-4">
                            <Button variant="info" className="mr-3">Więcej</Button>
                            <Button variant="success">Zaakceptuj</Button>
                        </div> */

const Offer = () => {
    return (
        <div className="row mt-3 w-75">
                {data.map((elem) => (
                    <div key={elem['id']} className="col-xl offset-3 offer-element d-flex justify-content-between align-items-center"> 
                        {Object.keys(elem).filter((col) => col != 'id' && col != 'comment').map((col) =>
                            <div key={col} className="ml-4">
                                {elem[col]}
                            </div>)}
                    <div className="mr-4">
                        <Button variant="info" className="mr-3">Więcej</Button>
                        <Button variant="success">Zaakceptuj</Button>
                    </div>
                    
                    </div>))}
        </div>
    )
}

export default Offer;