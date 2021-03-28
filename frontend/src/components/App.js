import React, { Component } from "react";
import { render } from "react-dom";
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from "./Home";

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
            <div>
              <Route exact path='/' component={Home} />
            </div>
          </Switch>
        </Router>
    );
  }
}

export default App;

const container = document.getElementById("app");
render(<App />, container);
