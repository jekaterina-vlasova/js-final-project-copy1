import React, {useContext} from 'react';
import {observer} from "mobx-react-lite";
import {Context} from "..";
import {Pagination} from "react-bootstrap";

const Pages = observer(() => {
    const {product} = useContext(Context)
    console.log(product.totalCount);
    console.log(product.limit);
    //const pageCount = Math.ceil(product.totalCount / product.limit)
    const pageCount = 6;
    console.log(pageCount);
    const pages = [1, 2, 3, 4, 5, 6]

    /*for (let i = 0; i < pageCount; i++) {
        pages.push(i + 1)
    }*/

    console.log(pages);

    return (
        <Pagination className="mt-3">
            {pages.map(page =>
                <Pagination.Item
                    key={page}
                    active={product.page === page}
                    onClick={() => product.setPage(page)}
                >
                    {page}
                </Pagination.Item>
            )}
        </Pagination>
    );
});


export default Pages;