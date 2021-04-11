import React, {useState} from "react";
import FormSuccess from "./FormSuccess";
import '../../styles/Form.css'
import FormSignUp from "./FormSignUp";
import {Link} from "react-router-dom";

const AddUserForm = () => {
    const [isSubmitted, setIsSubmitted] = useState(false)

    function submitForm() {
        setIsSubmitted(true)
    }

    return (
        <>
        <div className={"form-container"}>

                <span className={"close-btn"}>
                    <Link to="/">x</Link>
                </span>

            <div className={"form-content-left"}/>
            {!isSubmitted ? (
                <FormSignUp submitForm={submitForm} />
            ) : (
                <FormSuccess />
            )}
        </div>
        </>
    )
}

export default AddUserForm;
