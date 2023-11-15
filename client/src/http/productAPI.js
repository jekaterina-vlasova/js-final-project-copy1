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

/*export const fetchProducts = async (category_id, brand_id, page, limit = 4) => {
    try {
        const response = await $host.get('api/product', {
            params: { category_id, brand_id, page, limit }
        });

        const data = response.data;

        // Check if 'data' and 'data.row' are defined, otherwise set them to empty values
        const row = (data && data.row) || [];
        const count = (data && data.count) || 0;

        return { row, count };
    } catch (error) {
        // Log the error for debugging purposes
        console.error("Error fetching products:", error);

        // Return an empty result or throw the error, depending on your requirements
        return { row: [], count: 0 };
        // or throw error; // Uncomment this line to throw the error for the caller to handle
    }
};*/

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