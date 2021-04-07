import React from "react";
import Grid from "./Grid";
import Offers from "./MyOffers/Offers";

const MySchedule = () => {
    return (
        <div className="container mt-4">
            <div className="row-cols-1 text-center">
                <h2>Mój podział</h2>
            </div>
            <div className="row-cols-1">
                <Grid />
            </div>
            <Offers />
        </div>
    )
}

export default MySchedule;
