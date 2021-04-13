import React, {useContext} from "react";
import { Col, Container, Row} from "react-bootstrap";
import '../../styles/home.css';
import {UserContext} from "../../context/User";
import {Link} from "react-router-dom";

const Home = () => {
    const { user, _setUser } = useContext(UserContext);
    return (
        <div className="bg-image">
            <Container className="image-container" >
                <Row className="row-login">
                    <Col className="col-6 offset-3 col-login">
                        <div className="text-center title">enrollXchange</div>
                        <div className="mt-5 d-flex flex-column justify-content-around">
                            {!user ?
                                (
                                    <a className="btn btn-outline-light" style={{width: '100%'}}
                                    href="/accounts/login">Zaloguj</a>)
                                : (
                                    <div className="text-center">
                                        <h2 style={{color: "white"}}>Witaj {user.username}!</h2>
                                        <Link to="/my-schedule">
                                            <button className="btn btn-outline-light mt-3" style={{width: '100%'}}>Mój podział</button>
                                        </Link>
                                        <Link to="/market">
                                            <button className="btn btn-outline-light mt-5" style={{width: '100%'}}>Giełda</button>
                                        </Link>
                                        <a className="btn btn-outline-light mt-5" style={{width: '100%'}}
                                           href="/accounts/logout">Wyloguj</a>
                                    </div>
                                )
                            }
                        </div>
                    </Col>

                </Row>
            </Container>
        </div>
    )
}

export default Home;
