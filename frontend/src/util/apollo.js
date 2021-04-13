import ApolloClient from 'apollo-client';
import { HttpLink} from 'apollo-link-http';
import {InMemoryCache as Cache} from "apollo-cache-inmemory";
import { ApolloLink } from 'apollo-link';
import cookie from "react-cookies";

const uri = `/graphql`;
const AuthLink = (operation, next) => {
  const token = cookie.load("csrftoken");

  operation.setContext(context => ({
    ...context,
    headers: {
      ...context.headers,
      "X-CSRFToken": token,
    },
  }));

  return next(operation);
};

const link = ApolloLink.from([
  AuthLink,
  new HttpLink({ uri }),
]);

const apollo_client = new ApolloClient({
  link,
  cache: new Cache().restore({}),
});

export default apollo_client;
