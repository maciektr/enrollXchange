import React, {createContext, useEffect, useState} from "react";
import { Redirect, Route, Switch } from "react-router";
import { openRoutes, protectedRoutes } from "../../routes/routes";
import apollo_client from "../../util/apollo";
import meQuery from '../../queries/me.graphql';


const Navigation = () => {
    const [authorized, setAuthorized] = useState(true);

    useEffect(() => {
        apollo_client.query({query: meQuery})
            .then(result => result.data)
            .then(object => object.me)
            .then(data => {
                if (data == null){
                    setAuthorized(false);
                } else {
                    setAuthorized(true);
                }
            })
    }, [])
    return (
        <>
            {openRoutes.map((route) => (
                <Route key={route.path} {...route} />
            ))}
            {!authorized && protectedRoutes.map((route) => (
                <Redirect key={route.path} from={route.path} to={"/"} />
            ))}
            {authorized && protectedRoutes.map((route) => (
                <Route key={route.path} {...route} />
            ))}
        </>
    );
}

export default Navigation;
