import React from 'react';
import ReactDOM from 'react-dom';

export default class TodoListItem extends React.Component{
  constructor (props) {
    super(props);
    this.state = props.todo;
  }

  removeTodo () {
    this.props.removeTodo(
      this.props.todo
    );
  }

  toggle () {
    let tmp = this.state.done;
    this.setState({done: !tmp});
  }

  render () {
    return (
      <li>
        {this.props.todo.title}
        <button onClick={this.removeTodo.bind(this)}>Remove
        </button>
        <button onClick={this.toggle.bind(this)}>{this.state.done ? 'Done' : 'Undone'}
        </button>
      </li>

    );
  }
}
