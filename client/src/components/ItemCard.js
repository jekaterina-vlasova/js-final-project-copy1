import React from "react";
import { Card, Col } from "react-bootstrap";
import Image from "react-bootstrap/Image";
import star from "../assets/star.png";
import {useNavigate} from "react-router-dom";
import { PRODUCT_ROUTE } from "../utils/consts";

const ItemCard = ({product}) => {
    const navigate = useNavigate()
    console.log(navigate)
    return (
        <Col md={3} className={"mt-3"} onClick={() => navigate(PRODUCT_ROUTE + "/" + product.id)}>
            <Card style={{width: 150, cursor: "pointer"}} border={"light"}>
                <Image width={300} height={300} src={process.env.REACT_APP_API_URL + product.img}/>
                <div className="text-black-50 mt-1 d-flex text-black-50 justify-content-between align-items-center">{product.name}<br/>$ {product.price}
                </div>
                    {/* <div>Loreal</div>
                    <div className="d-flex align-items-center">
                        <div className="mr-1">{product.rating}</div>
                        <Image width={18} height={18} src={star}/>
                    </div>
                </div>
                <div>{product.name}</div> */}
            </Card>
        </Col>
    );
};

export default ItemCard;