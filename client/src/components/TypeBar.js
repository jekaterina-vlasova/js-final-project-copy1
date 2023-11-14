import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Context } from "..";
import ListGroup from 'react-bootstrap/ListGroup';

const TypeBar = observer(() => {
    const {product} = useContext(Context)
    return (
        <ListGroup>
            {product.categories.map(category =>
                <ListGroup.Item 
                    style={{cursor: "pointer"}}
                    active={category.id === product.selectedCategory.id}
                    onClick={() =>product.setSelectedCategory(category)}
                    key={category.id}
                >
                    {category.name}
                </ListGroup.Item>
            )}
        </ListGroup>
    );
});

export default TypeBar;