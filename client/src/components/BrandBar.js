import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
import { Card, Row } from "react-bootstrap";
import { Context } from "..";
import { Dropdown } from "react-bootstrap";

const BrandBar = observer(() => {
    const {product} = useContext(Context)

    return (
        <Dropdown>
            {product.brands.map(brand =>
                <Dropdown.Item 
                    style={{cursor: "pointer"}}
                    active={brand.id === product.selectedBrand.id}
                    onClick={() =>product.setSelectedBrand(brand)}
                    key={brand.id}
                >
                    {brand.name}
                </Dropdown.Item>
            )}
        </Dropdown>
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