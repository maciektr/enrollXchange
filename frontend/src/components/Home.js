import React from "react";
import {Button} from "react-bootstrap";
import '../styles/styles.css'

const Home = () => {
    return (
        <div className="container red-background">
            <div className="row">
                <div className="col-12 text-center">
                    Homepage :D
                </div>
            </div>
            <div className="row-cols-1 text-center mt-5">
                <Button variant="primary">Primary</Button>
            </div>

        </div>
    )
}

export default Home;
