import React from "react";
import Home from "../components/Home/Home";
import Market from "../components/Market/Market";
import MySchedule from "../components/MySchedule/MySchedule";

export const protectedRoutes = [
    {
        path: "/my-schedule",
        exact: true,
        component: MySchedule,
    },
    {
        path: "/market",
        exact: true,
        component: Market,
    },
];

export const openRoutes = [
    {
        path: "/",
        exact: true,
        component: Home,
    },
];
