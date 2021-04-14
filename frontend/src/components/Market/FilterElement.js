import React, {useContext} from "react";
import {FiltersContext} from "../../context/Filters";
import {Form} from "react-bootstrap";

const FilterElement = ({name, d_key}) => {
    const { filters, setFilters } = useContext(FiltersContext);

    const options = [{code: "ASD", fullName: "Algorytmy i Struktury Danych"}]
        .map(option => <option value={option.fullName} key={option.code}>{option.code}</option>)

    const handleChange = (event) => {
        const updatedValue = {};
        updatedValue[d_key] = event.target.value;
        setFilters(prev => ({
            ...prev,
            ...updatedValue,
        }))
    }

    return (
        <div className="m-2">
            <Form>
                <Form.Control size="sm" as="select" onChange={handleChange}>
                    <option value={""}>{name}</option>
                    {options}
                </Form.Control>
            </Form>
        </div>
    )
}

export default FilterElement;
