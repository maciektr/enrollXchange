import React from "react";
import {BrowserRouter} from 'react-router-dom';
import Navigation from "./Navigation/Navigation";
import {UserProvider} from "../context/User";

const App = () => {
    return (
        <BrowserRouter>
            <UserProvider>
                <Navigation />
            </UserProvider>
        </BrowserRouter>
    );
}

export default App;
