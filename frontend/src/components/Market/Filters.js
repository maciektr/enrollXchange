import React, {useState} from "react";
import FilterElement from "./FilterElement";

const Filters = () => {
    return (
        <>
            <FilterElement name={"Kurs"} d_key={"course"}/>
            <FilterElement name={"Prowadzący"} d_key={"lecturer"}/>
        </>
    )
};

export default Filters;
