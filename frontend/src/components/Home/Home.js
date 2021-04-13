import React from "react";
import {Button, Col, Container, Row} from "react-bootstrap";
import {Link} from "react-router-dom";
import '../../styles/common.css'
const Home = () => {
    return (
        <div className="bg-image">
            <Container className="image-container" >
                <Row className="row-login">
                    <Col className="col-6 offset-3 col-login">
                        <div className="text-center" id="title">enrollXchange</div>
                        <div className="mt-5 d-flex flex-column justify-content-around">
                                <a className="btn btn-outline-light" style={{width: '100%'}} href="/accounts/login">Zaloguj</a>
                            <Link to="/add-user" style={{textAlign: 'center'}}>
                                <button className="btn btn-outline-light mt-5" style={{width: '100%'}}>Zarejestruj</button>
                            </Link>

                        </div>
                    </Col>

                </Row>
            </Container>
        </div>
    )
}

export default Home;
