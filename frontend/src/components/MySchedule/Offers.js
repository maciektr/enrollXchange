import React, {useEffect, useState} from "react";
import OfferElement from "./OfferElement";
import {myOffers} from "./MockData";

const Offers = () => {
    const [offers, setOffers] = useState([]);

    useEffect(() => {
        //TODO Replace with fetch
        setOffers(myOffers);
    }, []);

    const htmlList = offers.map(offer => <OfferElement props={offer} key={offer.id}/>)

    return (
        <div>
            <div className="row-cols-1 text-center mt-4">
                <h2>Moje oferty</h2>
            </div>
            {htmlList}
        </div>
    )
}

export default Offers;
