import React from "react";
import Home from "../components/Home/Home";
import Market from "../components/Market/Market";
import LoginPage from "../components/Login/LoginPage";
import MySchedule from "../components/MySchedule/MySchedule";
import AddUserForm from "../components/AddUser/AddUserForm";

export const protectedRoutes = [
    {
        path: "/my-schedule",
        exact: true,
        component: MySchedule,
    },
];

export const openRoutes = [
    {
        path: "/",
        exact: true,
        component: Home,
    },
    {
        path: "/market",
        exact: true,
        component: Market,
    },
    {
        path: "/login",
        exact: true,
        component: LoginPage,
    },
    {
        path: "/add-user",
        exact: true,
        component: AddUserForm,
    }
];
