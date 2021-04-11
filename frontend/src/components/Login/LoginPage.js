import React from "react";
import { Container, Row, Col } from "react-bootstrap";
import LoginForm from './LoginForm'
import '../../styles/login-page.css'

const LoginPage = () => {
    return (
        <div id="bg">
        <Container id="login-container" >
            <Row id="row-login">
                <Col className="col-6 offset-3" id="col-login">
                    <div className="text-center" id="title">enrollXchange</div>
                    <LoginForm/>
                </Col>
            </Row>
        </Container>
        </div>

    );
}

export default LoginPage;
