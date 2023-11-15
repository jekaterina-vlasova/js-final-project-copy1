import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Context } from "..";
import ListGroup from 'react-bootstrap/ListGroup';
import { CATEGORY_ROUTE } from "../utils/consts";
import { useNavigate } from "react-router-dom";
import { DropdownItem } from "react-bootstrap";
import { Dropdown } from "react-bootstrap";

const TypeBar = observer(() => {
    const {product} = useContext(Context)
    const navigate = useNavigate()

    return (
        <Dropdown>
            {product.categories.map(category =>
                <Dropdown.Item 
                    style={{cursor: "pointer"}}
                    active={category.id === product.selectedCategory.id}
                    onClick={() =>product.setSelectedCategory(category)}
                    key={category.id}
                    
                >
                    {category.name}
                </Dropdown.Item>
            )}
        </Dropdown>
    );
});

export default TypeBar;