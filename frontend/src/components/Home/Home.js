import React from "react";
import {Button} from "react-bootstrap";
import {Link} from "react-router-dom";

const Home = () => {
    return (
        <div>
            <div className="container">
                <div className="row-cols-1 text-center mt-5">
                    <Link to="/login">
                        <Button variant="primary">Zaloguj</Button>
                    </Link>
                </div>
                <div className="row-cols-1 text-center mt-5">
                    <Link to="/add-user">
                        <Button variant="primary">Zarejestruj</Button>
                    </Link>
                </div>
                <div className="row-cols-1 text-center mt-5">
                    <Link to="/market">
                        <Button variant="secondary">Market</Button>
                    </Link>
                </div>
            </div>
        </div>

    )
}

export default Home;
