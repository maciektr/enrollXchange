import React from "react";
import Grid from "./Grid";
import Offer from "./Offer";

const MySchedule = () => {
    return (
        <div className="container mt-4">
            <div className="row-cols-1 text-center">
                <h2>Mój podział</h2>
            </div>
            <div className="row-cols-1">
                <Grid />
            </div>
            <div className="row-cols-1 text-center mt-4">
                <h2>Moje oferty</h2>
            </div>
            <Offer />

        </div>
    )
}

export default MySchedule;
