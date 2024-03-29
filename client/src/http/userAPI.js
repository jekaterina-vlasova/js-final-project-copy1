import { $authHost, $host } from ".";
import { jwtDecode } from "jwt-decode";

export const registration = async (email, password) => {
    const {data} = await $host.post('api/client/registration', {email, password})
    localStorage.setItem("token", data.token)
    return jwtDecode(data.token)
}

export const login = async (email, password) => {
    const {data} = await $host.post('api/client/login', {email, password})
    localStorage.setItem("token", data.token)
    return jwtDecode(data.token)
}

export const check = async () => {
    const {data} = await $authHost.get('api/client/auth')
    localStorage.setItem("token", data.token)
    return jwtDecode(data.token)
}