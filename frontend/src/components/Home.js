import React from "react";
import {Button} from "react-bootstrap";
import '../styles/styles.css'
import {Link} from "react-router-dom";

const Home = () => {
    return (
        <div className="container red-background">
            <div className="row">
                <div className="col-12 text-center">
                    Dupa :D
                </div>
            </div>
            <div className="row-cols-1 text-center mt-5">
                <Button variant="primary">Primary</Button>
            </div>
            <div className="row-cols-1 text-center mt-5">
                <Link to="/market">
                    <Button variant="secondary">Market</Button>
                </Link>
            </div>
        </div>
    )
}

export default Home;
