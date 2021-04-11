import React from "react";
import { Container, Row, Col } from "react-bootstrap";
import LoginForm from './LoginForm'
import '../../styles/login-page.css'
import '../../styles/common.css'

const LoginPage = () => {
    return (
        <div className="bg-image">
        <Container className="image-container" >
            <Row className="row-login">
                <Col className="col-6 offset-3 col-login">
                    <div className="text-center" id="title">enrollXchange</div>
                    <LoginForm/>
                </Col>
            </Row>
        </Container>
        </div>

    );
}

export default LoginPage;
