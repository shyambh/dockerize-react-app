import React from "react";
import renderer from "react-test-renderer";
import ArticleActions from "../../components/article/ArticleActions";
import mockArticle from "../mocks/mock-article";
import {screen} from '@testing-library/react'
import { setupServer } from 'msw/node';
import { rest, DefaultRequestBody } from "msw";
import useSWR, {SWRConfig, cache } from 'swr';
import axios from 'axios';

jest.mock("next/router", () => ({
  useRouter() {
    return {
      route: "/articles",
      pathname: "",
      query: "pid=1",
      asPath: "",
    };
  },
}));

jest.mock('swr', () => ({
  data: '',
  error: ''
}))


const server = setupServer(
  rest.get<DefaultRequestBody, { user: String }>(
    '/user',
    (req, res, ctx) => {
      return res(
        ctx.delay(100),
        ctx.status(200),
        ctx.json({ data: [
          {
            user: {
              username: "shyambh",
          }
          }
          
        ]})
      )
    }
  ) 
)

let mockFridge = {}

class LocalStorageMock {
  constructor() {
    this.store = {};
  }

  clear() {
    this.store = {};
  }

  getItem(key) {
    return this.store[key] || null;
  }

  setItem(key, value) {
    this.store[key] = String(value);
  }

  removeItem(key) {
    delete this.store[key];
  }
}

global.localStorage = new LocalStorageMock;

beforeAll(() => {
  server.listen()
  global.Storage.prototype.setItem = jest.fn((key, value) => {
    mockFridge[key] = {
      data: 
        {
          "user": {"email":"bhattaraishyam@gmail.com","username":"shyambh"}
        }
    }
  })
  global.Storage.prototype.getItem = jest.fn((key) => mockFridge[key])
});



beforeEach(() => {
  mockFridge = {};
  window.localStorage.setItem('data', {
    "user": {"email":"bhattaraishyam@gmail.com","username":"shyambh"}
});
})

afterAll(() => {
  server.close();
  global.Storage.prototype.setItem.mockReset()
  global.Storage.prototype.getItem.mockReset()
});
 afterEach(() => server.resetHandlers());

const useRouter = jest.spyOn(require("next/router"), "useRouter");



test.only("snapshot test for ArticleActions component", () => {
  global.localStorage.setItem('data', {});
  const getFromStorage = jest.fn().mockReturnValueOnce(undefined)
  let mockStorage;
  const setInStorage = jest.fn((value) => { mockStorage = value })
  

  const renderedComponent = renderer
    .create(<ArticleActions article={mockArticle} />)
    .toJSON();
    screen.debug()
  console.log(
    "This is the rendered component \n" + renderedComponent.toString()
  );

  expect(renderedComponent).toMatchSnapshot();
});
