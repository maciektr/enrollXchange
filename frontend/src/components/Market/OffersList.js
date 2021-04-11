import React, {useEffect, useState} from "react";
import '../../styles/offer.css'
import OfferElement from "./OfferElement";

import apollo_client from "../../components/ApolloClient";
import offersQuery from '../../queries/offers.graphql';
import {data} from './Data';


const OffersList = () => {
    const [offers, setOffers] = useState([]);

    const parseOffers = (queryResult) => {
        const parseNode = (node) => {
            const week_day = (day) => {
                if(day === 'MONDAY')
                    return 'Poniedziałek';
            }
            node = node['node'];
            node['title'] = node['enrollment']['classTime']['course']['fullName'];
            node['lecturer'] = node['enrollment']['classTime']['lecturer']['fullName'];
            node['day'] = week_day(node['enrollment']['classTime']['day']);
            node['time'] = node['enrollment']['classTime']['start'].substr(0,5);
            return node;
        };
        const result = queryResult['offers']['edges'].map(parseNode);
      return result;
    };

    useEffect(() => {
        // apollo_client
        // .query({query: offersQuery})
        // .then(result => setOffers(parseOffers(result.data)));
        setOffers(data);

    }, [])

    const htmlList = offers.map((offer) => <OfferElement key={offer.id} props={offer} />);

    return (
        <>
            <div className="row-cols-1 text-center mt-4">
                <h2>Offers</h2>
            </div>
            <div className="row mt-3">
                {htmlList}
            </div>
        </>

    )
}

export default OffersList;
