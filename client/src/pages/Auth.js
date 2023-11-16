import React, { useContext, useState } from "react";
import {Card, Container, Form, Button, Row} from 'react-bootstrap';
import { NavLink, useLocation, useNavigate } from "react-router-dom";
import { LOGIN_ROUTE, REGISTRATION_ROUTE, SHOP_ROUTE } from "../utils/consts";
import { registration, login } from "../http/userAPI";
import { observer } from "mobx-react-lite";
import { Context } from "..";
import Image from "react-bootstrap/Image";
import hair_background_2 from "../assets/hair_background_2.jpg"

const Auth = observer(() => {
    const {client} = useContext(Context)
    const location = useLocation()
    const navigate = useNavigate()
    const isLogin = location.pathname === LOGIN_ROUTE
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    
    const click = async () => {
        try {
            let data;
            if (isLogin) {
                data = await login(email, password);
            } else {
                data = await registration(email, password);
            }
            client.setClient(client)
            client.setIsAuth(true)
            navigate(SHOP_ROUTE)

        } catch (e) {
            alert(e.response.data.message)
        }         
    }

    return (
        <Container>
            <Row style={{ display: "flex", flexDirection: "column" }}>
                <Image src={hair_background_2} fluid style={{ width: '100%', marginBottom: '30px' }}/>
            </Row>
            <Row 
                className="d-flex justify-content-center align-items-center"
                style={{ height: "100%" }}
            >
                <Card style={{width: 600}} className="p-5">
                    <h2 className="m-auto">{isLogin ? "Sign In" : "Registration"}</h2>
                    <Form className="d-flex flex-column">
                        <Form.Control
                            className="mt-3"
                            placeholder="E-mail"
                            value={email}
                            onChange={e => setEmail(e.target.value)}
                        />
                        <Form.Control
                            className="mt-3"
                            placeholder="Password"
                            value={password}
                            onChange={e => setPassword(e.target.value)}
                            type="password"
                        />
                        {isLogin ?
                            <div className="mt-3 align-self-center">
                                Don't have an account? <NavLink to={REGISTRATION_ROUTE}>Register</NavLink>
                            </div>
                            :
                            <div className="mt-3 align-self-center">
                                Already have an account? <NavLink to={LOGIN_ROUTE}>Sign In</NavLink>
                            </div>
                            }
                            <Button 
                                className="mt-3 align-self-center" 
                                variant={"outline-dark"}
                                onClick={click}
                            >
                                {isLogin ? "Sign In" : "Register"}
                            </Button>
                        
                    </Form>
                </Card>
            </Row>
        </Container>
    );
});

export default Auth;