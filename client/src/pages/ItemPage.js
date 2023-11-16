import React, { useContext, useEffect, useState } from "react";
import { Card, Col, Container, Image, Row } from "react-bootstrap";
import bigStar from "../assets/bigStar.png";
import { Button } from "react-bootstrap";
import { Context } from "..";
import { useParams } from "react-router-dom";
import { fetchOneProduct } from "../http/productAPI";
import hair_background_1 from "../assets/hair_background_1.jpg"

const ItemPage = () => {
    const [product, setProduct] = useState({info: []})
    const {id} = useParams()

    useEffect(() => {
        fetchOneProduct(id).then(data => setProduct(data))
    }, [])
    
    return (
        <Container>
             <Row style={{ display: "flex", flexDirection: "column" }}>
                <Image src={hair_background_1} fluid style={{ width: '100%', marginBottom: '30px' }}/>
            </Row>
            <Row>
                <Col md={4}>
                    <Card className="d-flex align-items-center border-0">
                        <Image width={300} height={300} src={process.env.REACT_APP_API_URL + "/" + product.img}/>
                    </Card>
                    <Card className="d-flex align-items-center border-0">
                        <h2 className={"mt-4"}>$ {product.price}</h2>
                        {/* <Button variant={"outline-dark"}>Add to Basket</Button> */}
                    </Card>
                </Col>
                <Col md={4}>
                    <Row className="d-flex flex-column align-items-center">
                        <h3>{product.name}</h3>
                        <div
                            className="d-flex align-items-center justify-content-center"
                            style={{background: `url(${bigStar}) no-repeat center center`, width:200, height: 200, backgroundSize: "cover", fontSize: 50}}
                        >
                            {product.rating}
                        </div>
                    </Row>
                </Col>
            </Row>
            <Col className="d-flex flex-column m-3" style={{fontSize: 18}}>
                {product.description}
            </Col>
            
        </Container>
    );
};

export default ItemPage;