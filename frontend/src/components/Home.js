import React from "react";
import {Button} from "react-bootstrap";
import '../styles/styles.css'
import {Link} from "react-router-dom";

const Home = () => {
    return (
        <div className="container red-background">
            <div className="row">
                <div className="col-12 text-center">
                    Homepage :D
                </div>
            </div>
            <div className="row-cols-1 text-center mt-5">
                <Link to="/my-schedule">
                    <Button variant="primary">Mój podział</Button>
                </Link>
            </div>

        </div>
    )
}

export default Home;
