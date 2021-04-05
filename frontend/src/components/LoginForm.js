import React from 'react'
import { Button, Form } from 'react-bootstrap';

const LoginForm = () => {
    return (
        <div>
            <Form>
                <Form.Group controlId="formBasicIndex">
                    <Form.Label>Numer indeksu</Form.Label>
                    <Form.Control type="text" placeholder="Wpisz swój numer indeksu" />
                </Form.Group>

                <Form.Group controlId="formBasicPassword">
                    <Form.Label>Hasło</Form.Label>
                    <Form.Control type="password" placeholder="Hasło" />
                </Form.Group>
                <Form.Group controlId="formBasicCheckbox">
                    <Form.Check type="checkbox" label="Check me out" />
                </Form.Group>
                <Button variant="primary" type="submit"> Zaloguj </Button>
            </Form>
        </div>
    );
}

export default LoginForm;