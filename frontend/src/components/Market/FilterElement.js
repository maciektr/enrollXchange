import React from "react";
import {Dropdown} from "react-bootstrap";

const FilterElement = ({name}) => {
    return (
        <>
            <Dropdown className="m-2">
                <Dropdown.Toggle variant="success">
                    {name}
                </Dropdown.Toggle>

                <Dropdown.Menu>
                    <Dropdown.Item>Action</Dropdown.Item>
                    <Dropdown.Item>Another action</Dropdown.Item>
                    <Dropdown.Item>Something else</Dropdown.Item>
                </Dropdown.Menu>
            </Dropdown>
        </>
    )
}

export default FilterElement;
