import React from 'react';
import './App.css';
import { Switch, Route } from 'react-router-dom';
import  Register  from './components/Register';
import Home from './components/Home';

function App() {
  return (
    <Switch>
      <Route exact path="/" component={Register}/>
      <Route exact path="/home" render={(props) => <Home {...props}/>}/>
    </Switch>
  );
}

export default App;
