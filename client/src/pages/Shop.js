import React, { useContext, useEffect } from "react";
import { Col, Container, Row } from "react-bootstrap";
import TypeBar from "../components/TypeBar";
import BrandBar from "../components/BrandBar";
import ItemList from "../components/ItemList";
import { observer } from "mobx-react-lite";
import { Context } from "..";
import { fetchBrands, fetchCategories, fetchProducts } from "../http/productAPI";
import Pages from "../components/Pages";

const Shop = observer(() => {
    const { product } = useContext(Context)

    useEffect(() => {
        fetchCategories().then(data => product.setCategories(data))
        fetchBrands().then(data => product.setBrands(data))
        fetchProducts(null, null, 1, 4).then(data => {
            product.setProducts(data)
            product.setTotalCount(data.count)
        })
    }, [])

    useEffect(() => {
        fetchProducts(product.selectedCategory.id, product.selectedBrand.id, product.page, 8).then(data => {
            product.setProducts(data)
            product.setTotalCount(data.count)
        })
    }, [product.page, product.selectedCategory, product.selectedBrand])

    return (
        <Container>
            
            <ItemList />

           
            <Pages />
        </Container>
    );
});

export default Shop;