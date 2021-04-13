import React, {useEffect, useState} from "react";
import {BrowserRouter} from 'react-router-dom';
import Navigation from "./Navigation/Navigation";
import {userContext} from "../context/userContext";
import apollo_client from "../util/apollo";
import meQuery from '../queries/me.graphql'

const App = () => {
    const [user, setUser] = useState({me: null});
    useEffect(() => {
        apollo_client.query({query: meQuery})
            .then(result => result.data)
            .then(data => {
               setUser(data.me)
            })
    }, [])

    return (
        <BrowserRouter>
            <userContext.Provider value={user}>
                <Navigation />
            </userContext.Provider>
        </BrowserRouter>
    );
}

export default App;
