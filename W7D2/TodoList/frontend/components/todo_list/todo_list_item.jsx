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

  toggle (event) {
    event.preventDefault();
    let tmp = this.state.done;
    // this.setState({done: !tmp});
    this.props.updateTodo({
      done: !tmp,
      id: this.state.id
    }).then(() => this.setState({title: '', body: '', done:!tmp}));
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
