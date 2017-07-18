import React from 'react';
import GreetingContainer from './greeting/greeting_container';
import SessionFormContainer from './session/session_form_container';
import { Route } from 'react-router-dom';

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />

      <Route path="/login" component={SessionFormContainer} />
      <Route path="/signup" component={SessionFormContainer} />
    </header>
  </div>
);

export default App;
