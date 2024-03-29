import { makeAutoObservable } from "mobx"

export default class ItemStore {
    constructor() {
        this._categories = []
        this._brands = []
        this._products = []
        this._selectedCategory = {}
        this._selectedBrand = {}
        this._page = 1
        this._totalCount = 0
        this._limit = 4
        makeAutoObservable(this)
    }

    setCategories(categories) {
        this._categories = categories
    }
    setBrands(brands) {
        this._brands = brands
    }
    setProducts(products) {
        this._products = products
    }
    setBaskets(basket) {
        this._baskets = basket
    }
    setSelectedCategory (category) {
        this.setPage(1)
        this._selectedCategory = category
    }
    setSelectedBrand (brand) {
        this._selectedBrand = brand
    }
    setPage (page) {
        this._page = page
    }
    setTotalCount (count) {
        this._totalCount = count
    }
    get categories() {
        return this._categories
    }

    get brands() {
        return this._brands
    }
    get products() {
        return this._products
    }

    get selectedCategory() {
        return this._selectedCategory
    }
    get selectedBrand() {
        return this._selectedBrand
    }
    get totalCount() {
        return this._totalCount
    }
    get page() {
        return this._page
    }
    get limit() {
        return this._limit
    }
}
