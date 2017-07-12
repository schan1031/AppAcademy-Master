import React from 'react';
import ReactDOM from 'react-dom';
import TodoListContainer from './todo_list/todo_list_container.jsx';

export default class App extends React.Component {
  render () {
    return(
      <TodoListContainer/>
    );
  }
}
