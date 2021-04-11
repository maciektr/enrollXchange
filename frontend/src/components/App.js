import React, { Component } from "react";
import { render } from "react-dom";
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from "./Home";
import Market from "./Market/Market";
import LoginPage from "./LoginPage";
import '../styles/styles.css'
import MySchedule from "./MySchedule/MySchedule";
import Form from "./AddUser/form/Form";

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
            <Route exact path='/login' component={LoginPage} />
            <Route path='/my-schedule' component={MySchedule} />
            <Route path='/addUser' component={Form}/>
          </Switch>
        </Router>
    );
  }
}

export default App;

const container = document.getElementById("app");
render(<App />, container);
