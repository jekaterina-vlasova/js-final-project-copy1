import React, { useContext, useEffect, useState } from "react";
import { Card, Col, Container, Image, Row } from "react-bootstrap";
import bigStar from "../assets/bigStar.png";
import { Button } from "react-bootstrap";
import { Context } from "..";
import { useParams } from "react-router-dom";
import { fetchOneProduct } from "../http/productAPI";

const ItemPage = () => {
    const [product, setProduct] = useState({info: []})
    const {id} = useParams()

    useEffect(() => {
        fetchOneProduct(id).then(data => setProduct(data))
    }, [])
    
    return (
        <Container className="mt-5">
            <Row>
                <Col md={4}>
                    <Card className="d-flex align-items-center">
                        <Image width={300} height={300} src={process.env.REACT_APP_API_URL + "/" + product.img}/>
                    </Card>
                    <Card className="d-flex align-items-center">
                        <h2>$ {product.price}</h2>
                        {/* <Button variant={"outline-dark"}>Add to Basket</Button> */}
                    </Card>
                </Col>
                <Col md={4}>
                    <Row className="d-flex flex-column align-items-center">
                        <h2>{product.name}</h2>
                        <div
                            className="d-flex align-items-center justify-content-center"
                            style={{background: `url(${bigStar}) no-repeat center center`, width:200, height: 200, backgroundSize: "cover", fontSize: 50}}
                        >
                            {product.rating}
                        </div>
                    </Row>
                </Col>
                {/* <Col md={4}>
                    <Card 
                        border="5x solid lightgray"
                        className="d-flex flex-column align-items-center justify-content-around"
                        style={{fontSize: 18}}
                    >
                        {product.description}
                    </Card>
                </Col> */}
            </Row>
            <Col className="d-flex flex-column m-3" style={{fontSize: 18}}>
                {product.description}
            </Col>
            <Row>
                {/* <Col md={2}>
                    <Card className="d-flex"> 
                        <Button variant={"outline-dark"}>Add to Basket</Button>
                    </Card>
                </Col> */}
            </Row>
            
        </Container>
    );
};

export default ItemPage;