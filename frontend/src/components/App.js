import React from "react";
import {BrowserRouter} from 'react-router-dom';
import Navigation from "./Navigation/Navigation";
import Layout from "./Layout/Layout";

const App = () => {
    return (
        <BrowserRouter>
                <Layout>
                    <Navigation />
                </Layout>
        </BrowserRouter>
    );
}

export default App;
