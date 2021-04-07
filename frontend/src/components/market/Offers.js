import React, {useEffect, useState} from "react";
import '../../styles/offer.css'
import {Button} from "react-bootstrap";
import {data} from './Data'


const Offer = () => {
    const [offers, setOffers] = useState([]);

    useEffect(() => {
        // TODO Replace with fetch
        setOffers(data)
    })


    return (
        <div className="row mt-3">
                {offers.map((elem) => (
                <div key={elem['id']} className="row mt-3">
                    <div className="col-8 offset-2 offer-element d-flex justify-content-between align-items-center">
                        <div className="ml-4">
                            {elem['title'] + ' - ' + elem['lecturer']}
                        </div>

                        <div className="mr-4">
                            <span>
                                {elem['day'] + ' ' + elem['time']}
                            </span>
                            <span className="ml-5">
                                <Button variant="info" className="mr-3">Info</Button>
                                <Button variant="success">Zaakceptuj</Button>
                            </span>
                        </div>
                    </div>
                </div>
                ))}
        </div>
    )
}

export default Offer;