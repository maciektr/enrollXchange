import React from "react";
import OffersList from "./OffersList";
import Filter from "./Filter";


const Market = () => {
    return (
        <div className="container mt-4">
            <div className="row-cols-1 text-center">
                <h2>Filter</h2>
            </div>
            <div className="row-cols-1">
                <Filter />
            </div>
            <OffersList />
        </div>
    )
}

export default Market;
