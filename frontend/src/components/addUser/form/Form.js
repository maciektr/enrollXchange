import React, {useState} from "react";
import FormSignup from "./FormSignup";
import FormSuccess from "./FormSuccess";
import '../../../styles/Form.css'

const Form = () => {
    const [isSubmitted, setIsSubmitted] = useState(false)

    function submitForm() {
        setIsSubmitted(true)
    }

    return (
        <>
        <div className={"form-container"}>
            <span className={"close-btn"}>x</span>
            <div className={"form-content-left"}/>
            {!isSubmitted ? (
                <FormSignup submitForm={submitForm} />
            ) : (
                <FormSuccess />
            )}
        </div>
        </>
    )
}

export default Form;