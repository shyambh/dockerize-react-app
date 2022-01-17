import React from "react";
import renderer from "react-test-renderer";
import ArticleMeta from "../../components/article/ArticleMeta";
import mockArticle from "../mocks/mock-article";

jest.mock("next/router", () => ({
  useRouter() {
    return {
      route: "/",
      pathname: "",
      query: "",
      asPath: "",
    };
  },
}));

const useRouter = jest.spyOn(require("next/router"), "useRouter");

test("snapshot test for ArticleMeta component", () => {
  useRouter.mockImplementationOnce(() => {
    query: {
      pid: 1;
    }
  });

  const renderedComponent = renderer
    .create(<ArticleMeta article={mockArticle} />)
    .toJSON();
  console.log(
    "This is the rendered component \n" + renderedComponent.toString()
  );

  expect(renderedComponent).toMatchSnapshot();
});
