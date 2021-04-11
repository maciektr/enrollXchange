import React, { Component } from "react";
import { render } from "react-dom";
import {BrowserRouter} from 'react-router-dom';
import '../styles/styles.css'
import Navigation from "./Navigation/Navigation";

//Routing is moved to src/routes
class App extends Component {
  render() {
    return (
        <BrowserRouter>
            <Navigation />
        </BrowserRouter>
    );
  }
}

export default App;

const container = document.getElementById("app");
render(<App />, container);
