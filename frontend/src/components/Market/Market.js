import React from "react";
import OffersList from "./OffersList";
import {Dropdown} from "react-bootstrap";
import Filters from "./Filters";


const Market = () => {

    return (
        <div className="container mt-4">
            <div className="row-cols-1 text-center">
                <h2>Filter</h2>
            </div>
            <div className="row-cols-1">
                <div className="d-flex justify-content-center">
                    <Filters />
                </div>
            </div>
            <OffersList />
        </div>
    )
}

export default Market;
