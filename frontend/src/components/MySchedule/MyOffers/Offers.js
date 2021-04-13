import React, {useEffect, useState} from "react";
import OfferElement from "./OfferElement";
import apollo_client from "../../../util/apollo";
import myOffersQuery from "../../../queries/myoffers.graphql";
import {parseMyOffers} from "../../../util/offer/offerParser";

const Offers = () => {
    const [offers, setOffers] = useState([]);

    useEffect(() => {
        apollo_client
            .query({query: myOffersQuery})
            .then(result => parseMyOffers(result.data))
            .then(offers => setOffers(offers))
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
