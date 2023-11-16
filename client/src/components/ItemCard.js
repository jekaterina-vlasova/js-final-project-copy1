import React from "react";
import { Card, Col } from "react-bootstrap";
import Image from "react-bootstrap/Image";
import star from "../assets/star.png";
import {useNavigate} from "react-router-dom";
import { PRODUCT_ROUTE } from "../utils/consts";
import {Button} from "react-bootstrap";

const ItemCard = ({ product }) => {
    const navigate = useNavigate()
    console.log(navigate)
    return (
        <Col md={3} className={"mt-5"} onClick={() => navigate(PRODUCT_ROUTE + "/" + product.id)}>
            <Card className="align-items-center border-0" style={{width: 300, cursor: "pointer"}} border={"light"}>
                <Image width={250} height={250} src={process.env.REACT_APP_API_URL + "/" + product.img} className="mx-auto" />
            </Card>
            <Card className={"mt-2 border-0"} style={{ height: 60 }}>
                <div className="d-flex align-items-center text-black-50 mt-1 text-black-50" style={{ width: 300 }}>{product.name}</div>
            </Card>
            <Card className="border-0">
                <div className="text-black-50 mt-1 d-flex align-items-center" style={{ width: 300 }}>
                    <div style={{fontSize: 20, fontWeight: "bold", marginRight: "10px"}}>$ {product.price}</div>
                    <div className="d-flex align-items-center">
                        <div style={{fontSize: 15}}>{product.rating}</div>
                        <Image style={{marginRight: "100px"}} width={18} height={18} src={star}/>
                    <Button variant={"outline-dark"}>See more</Button>
                        </div>
                    </div>
            </Card>
        </Col>
    );
};

export default ItemCard;