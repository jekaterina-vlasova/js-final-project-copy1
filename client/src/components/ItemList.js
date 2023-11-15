import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Context } from "..";
import ItemCard from "./ItemCard";
import { Row } from "react-bootstrap";

const ItemList = observer(() => {
    const { product } = useContext(Context)
    console.log(product);
    return (
        <Row className = "d-flex">
            {product.products.map(product =>
                <ItemCard key={product.id} product={product}/> 
            )} 
        </Row>
    );
});

export default ItemList;