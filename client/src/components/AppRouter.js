import React, { useContext } from "react";
import {Routes, Route, Navigate} from "react-router-dom";
import {authRoutes, publicRoutes} from "../routes";
import { SHOP_ROUTE } from "../utils/consts";
import { Context } from "..";

const AppRouter = () => {
    const {client} = useContext(Context)

    console.log(client)
    return (
        <Routes>
            {client.isAuth && authRoutes.map(({path, Element}) => 
                <Route key={path} path={path} element={<Element />} />
            )}
            {publicRoutes.map(({path, Element}) => 
                <Route key={path} path={path} element={<Element />} />
            )}
            <Route path='*' element={<Navigate to={SHOP_ROUTE} />} />
        </Routes>
    );
};

export default AppRouter;