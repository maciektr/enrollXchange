import React from "react";
import { Container, Row, Col } from "react-bootstrap";
import LoginForm from './LoginForm'

const LoginPage = () => {
    return (
        // <div>
            <Container style={{height: '100vh'}}>
                <Row  style={{height: '100vh'}}>
                    <Col ></Col>
                    <Col style={{top: '25vh'}}><LoginForm/></Col>
                    <Col ></Col>
                </Row>
            </Container>
        // </div>
    );
}

export default LoginPage;