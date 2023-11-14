import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Card, Row } from "react-bootstrap";
import { Context } from "..";
import ListGroup from 'react-bootstrap/ListGroup';

const BrandBar = observer(() => {
    const {product} = useContext(Context)

    return (
        <ListGroup>
            {product.brands.map(brand =>
                <ListGroup.Item 
                    style={{cursor: "pointer"}}
                    active={brand.id === product.selectedBrand.id}
                    onClick={() =>product.setSelectedBrand(brand)}
                    key={brand.id}
                >
                    {brand.name}
                </ListGroup.Item>
            )}
        </ListGroup>
      /*   <Row className="d-flex">
            {product.brands.map(brand =>
                <Card
                    style={{cursor: "pointer"}}
                    key={brand.id}
                    className="p-3"
                    onClick={() => product.setSelectedBrand(brand)}
                    border={brand.id === product.selectedBrand.id ? "danger" : "light"}
                >
                    {brand.name}
                </Card>
            )}
        </Row> */
    );
});

export default BrandBar;