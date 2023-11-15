import { $authHost, $host } from ".";
import { jwtDecode } from "jwt-decode";

export const fetchCategories = async () => {
    const {data} = await $host.get('api/category')
    return data
}

export const fetchBrands = async () => {
    const {data} = await $host.get('api/brand')
    return data
}

export const fetchProducts = async (category_id, brand_id, page, limit = 4) => {
    const {data} = await $host.get('api/product', {params: {
        category_id, brand_id, page, limit
    }})
    return data
}

export const fetchOneProduct = async (id) => {
    const {data} = await $host.get('api/product/' + id)
    return data
}