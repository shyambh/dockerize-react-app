import React from "react";
import renderer from 'react-test-renderer';
import ArticlePreview from "../../components/article/ArticlePreview";
import mockArticle from "../mocks/mock-article";


describe("Snapshot test suite", () => {
    test('snapshot test for ArticlePreview component', ()=>{
      
        const renderedComponent = renderer.create(<ArticlePreview article={ mockArticle } />).toJSON();
        console.log('This is the rendered component \n' + renderedComponent.toString());

        expect(renderedComponent).toMatchSnapshot();
    })
});