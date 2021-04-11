import React from 'react'
import '../../styles/add-user-form.css';
import {Link} from "react-router-dom";
import {Button} from "react-bootstrap";


const FormSuccess = () => {
    return (
        <div className={"form-content-right"}>
            <h1 className={"form-success"}>Użytkownik dodany</h1>
            <div className="row-cols-1 text-center mt-5">
                <Link to="/login">
                    <Button variant="secondary">Zaloguj</Button>
                </Link>
            </div>
        </div>
    )
}

export default FormSuccess;
