import React, { useContext } from "react";
import { Context } from "..";
import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import NavDropdown from 'react-bootstrap/NavDropdown';
import { NavLink, useNavigate } from "react-router-dom";
import { LOGIN_ROUTE, SHOP_ROUTE } from "../utils/consts";
import { Button } from "react-bootstrap";
import { observer } from "mobx-react-lite";
import TypeBar from "../components/TypeBar";
import BrandBar from "./BrandBar";

const NavBar = observer(() => { 
    const {client} = useContext(Context)
    const navigate = useNavigate()

    const logOut = () => {
        client.setClient({})
        client.setIsAuth(false)
    }

    return (
        <Navbar expand="lg" className="bg-body-tertiary">
            <Container>
                <NavLink className="navbar-brand mr-4" style={{color: "black", fontSize: "24px", fontWeight: "bold", textDecoration: "none"}} to={SHOP_ROUTE}>HairAdore</NavLink>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse>
                    <Nav className="me-auto">
                        <NavDropdown title="Brands" style={{ marginRight: '10px', marginLeft: '10px', fontWeight: "bold" }}>
                            <BrandBar/>
                        </NavDropdown>
                        <NavDropdown title="Categories" style={{fontWeight: "bold"}}>
                            <TypeBar/>
                        </NavDropdown>
                    </Nav>
                    {client.isAuth ?
                        <Nav className="ml-auto">
                            <Button 
                                variant={"outline-dark"} 
                                onClick={() => logOut()} 
                                className="ml-4"
                            >
                                Sign Out
                            </Button>
                        </Nav>
                        :
                        <Nav className="ml-auto">
                            <Button 
                                variant={"outline-dark"} 
                                onClick={() => navigate(LOGIN_ROUTE)}
                                className="ml-4"
                            >
                                Sign In
                            </Button>
                        </Nav>
                    }
                </Navbar.Collapse>
            </Container>
        </Navbar>
    );
});

export default NavBar;