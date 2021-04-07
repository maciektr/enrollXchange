import React from 'react'
import { Button, Form } from 'react-bootstrap';
import '../styles/LoginForm.css'

const LoginForm = () => {
    return (
        <div id="box-form">
            <Form>
                <Form.Group controlId="formBasicIndex">
                    <Form.Label>Email</Form.Label>
                    <Form.Control type="text" placeholder="Wpisz swój email w domenie AGH" />
                </Form.Group>

                <Form.Group controlId="formBasicPassword">
                    <Form.Label>Hasło</Form.Label>
                    <Form.Control type="password" placeholder="Hasło" />
                </Form.Group>
                <Form.Group controlId="formBasicCheckbox">
                </Form.Group>
                <div className="text-center">
                    <Button  variant="primary" type="submit"> Zaloguj </Button>
                </div>
            </Form>
        </div>
    );
}

export default LoginForm;