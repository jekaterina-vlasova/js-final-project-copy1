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
    const {product} = useContext(Context)

    useEffect(() => {
        fetchCategories().then(data => product.setCategories(data))
        fetchBrands().then(data => product.setBrands(data))
        fetchProducts(null, null, 1, 4).then(data => {
            product.setProducts(data)
            product.setTotalCount(data.amount)
        })        
    }, [])

    useEffect(() => {
        fetchProducts(product.selectedCategory.category_id, product.selectedBrand.brand_id, product.page, 4).then(data => {
            product.setProducts(data)
            product.setTotalCount(data.count)
        })
    }, [product.page, product.selectedCategory, product.selectedBrand])

    return (
        <Container>
            {/* <Row className="mt-2"> */}
                <ItemList/>

                {/* <Col md={3}>
                    <TypeBar/>
                </Col>
                <Col md={9}>
                    <BrandBar/>
                    <ItemList/>
                    <Pages/>
                </Col> */}
            {/* </Row> */}
        <Pages/>
        </Container>
    );
});

export default Shop;