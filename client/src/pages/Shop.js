import React, { useContext, useEffect } from "react";
import { Container } from "react-bootstrap";
import ItemList from "../components/ItemList";
import { observer } from "mobx-react-lite";
import { Context } from "..";
import { fetchBrands, fetchCategories, fetchProducts } from "../http/productAPI";
import Pages from "../components/Pages";
import hair_background from "../assets/hair_background.jpg";
import Image from "react-bootstrap/Image";

const Shop = observer(() => {
    const { product } = useContext(Context)

    useEffect(() => {
        fetchCategories().then(data => product.setCategories(data))
        fetchBrands().then(data => product.setBrands(data))
        fetchProducts(null, null, 1, 4).then(data => {
            product.setProducts(data.products)
            product.setTotalCount(data.count)
        })
    }, [])

    useEffect(() => {
        fetchProducts(product.selectedCategory.id, product.selectedBrand.id, product.page, 4).then(data => {
            product.setProducts(data.products)
            product.setTotalCount(data.count)
        })
    }, [product.page, product.selectedCategory, product.selectedBrand])

    return (
        <Container style={{ minHeight: "100vh", display: "flex", flexDirection: "column" }}>
            <Image src={hair_background} fluid style={{ width: '100%' }}/>

            <ItemList />
            <div style={{ marginTop: "auto", position: "fixed", bottom: 0, left: 0, right: 0, display: "flex", justifyContent: "center", background: "white", padding: "10px" }}>
                <Pages />
            </div>
        </Container>
    );
});

export default Shop;