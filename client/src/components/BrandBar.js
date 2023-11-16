import { observer } from "mobx-react-lite";
import React, { useContext } from "react";
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
    );
});

export default BrandBar;