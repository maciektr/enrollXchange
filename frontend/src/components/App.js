import React, { Component } from "react";
import { render } from "react-dom";
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from "./Home";
import Market from "./market/Market";

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [],
      loaded: false,
      placeholder: "Loading"
    };
  }

  render() {
    return (
        <Router>
          <Switch>
              <Route exact path='/' component={Home} />
              <Route exact path='/market' component={Market} />
          </Switch>
        </Router>
    );
  }
}

export default App;

const container = document.getElementById("app");
render(<App />, container);
