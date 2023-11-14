import React, { useContext, useEffect } from "react";
import { Context } from "..";
import { observer } from "mobx-react-lite";
import { Card, Col, Container, Row } from "react-bootstrap";

const Basket = observer (() => {
    const {product} = useContext(Context)

    let prices = 0;
    {product.basket.map(price =>
        prices += Number(price.product.price)
    )}

    return (
        <Container
            className="d-flex flex-sm-column justify-content-center align-items-center mt-3"
        >
            <h1 className="pb-2">Basket</h1>
            <Card className="d-flex flex-row p-2 justify content-between align-items-center mb-2">
                <h1 className="pr-2">Total:</h1>
                <h3 className="pl-2">{prices}<span className="font-weight-light pl-2">$</span></h3>
            </Card>
            
            {product.basket.map(product =>
                <Card className="d-flex w-100 p-2 justify-content-center mb-2" key={product.id}>
                    <Row className="d-flex w-100">
                        <Col>
                            <div className="d-flex flex-row align-items-center">
                                <img src={product.img} width={50}/>
                                <h1 className="pl-3">{product.product.name}</h1>
                            </div>
                        </Col>
                        <Col>
                            <div className="d-flex h-100 flex-row justify-content-end align-items-center">
                                <h2 className="font-weight-light">{product.product.price} euros</h2>
                            </div>
                        </Col>
                    </Row>
                </Card>
            )}
        </Container>
    );
});

export default Basket;