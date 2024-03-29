import Auth from "./pages/Auth";
import Basket from "./pages/Basket";
import ItemPage from "./pages/ItemPage";
import Shop from "./pages/Shop";
import { BASKET_ROUTE, PRODUCT_ROUTE, LOGIN_ROUTE, REGISTRATION_ROUTE, SHOP_ROUTE } from "./utils/consts";

export const authRoutes = [
    {
        path: BASKET_ROUTE,
        Element: Basket
    }
]

export const publicRoutes = [
    {
        path: SHOP_ROUTE,
        Element: Shop
    },
    {
        path: LOGIN_ROUTE,
        Element: Auth
    },
    {
        path: REGISTRATION_ROUTE,
        Element: Auth
    },
    {
        path: PRODUCT_ROUTE + "/:id",
        Element: ItemPage
    }
]