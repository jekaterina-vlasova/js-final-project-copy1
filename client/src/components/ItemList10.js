import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Context } from "..";
import ItemCard from "./ItemCard";
import { Row } from "react-bootstrap";
import { toJS } from "mobx";

const ItemList = observer(() => {
    const { product } = useContext(Context);
    console.log(product)

    // Convert the observable array to a regular array
    const products = toJS(product.products) || [];
    console.log(products.count)

    return (
        <Row className="d-flex">
            {products.map((product) => (
                <ItemCard key={product.id} product={product}/>
            ))}
        </Row>
    );
});

export default ItemList;

/*import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Context } from "..";
import ItemCard from "./ItemCard";
import { Row } from "react-bootstrap";

const ItemList = observer(() => {
    const { product } = useContext(Context);

    // Check if products is an array
    const products = Array.isArray(product.products) ? product.products : [];

    return (
        <Row className="d-flex">
            {products.map((product) => (
                <ItemCard key={product.id} product={product} />
            ))}
        </Row>
    );
});

export default ItemList;*/

/*import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Context } from "..";
import ItemCard from "./ItemCard";
import { Row } from "react-bootstrap";
import { toJS } from "mobx";

const ItemList = observer(() => {
    const { product } = useContext(Context);

    // Convert the observable array to a regular array or default to an empty array
    const products = Array.isArray(product.products) ? toJS(product.products) : [];

    return (
        <Row className="d-flex">
            {products.map((product) => (
                <ItemCard key={product.id} product={product} />
            ))}
        </Row>
    );
});

export default ItemList;*/

/*import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Context } from "..";
import ItemCard from "./ItemCard";
import { Row } from "react-bootstrap";
import { toJS } from "mobx";

const ItemList = observer(() => {
    const { product } = useContext(Context);

    // Convert the observable array to a regular array or default to an empty array
    const products = Array.isArray(product.products) ? toJS(product.products) : [];

    console.log("Products:", products); // Add this line for debugging

    return (
        <Row className="d-flex">
            {products.map((product) => (
                <ItemCard key={product.id} product={product} />
            ))}
        </Row>
    );
});

export default ItemList;*/