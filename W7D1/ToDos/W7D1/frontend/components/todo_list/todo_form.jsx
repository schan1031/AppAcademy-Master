import React from 'react';
import merge from 'lodash/merge';

export default class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "", body: ""};
  }

  createTodo(event) {
    // const todo = merge({}, this.state, { id: this.uniqueId() });
    // console.log(this.state);
    this.props.receiveTodo({id: this.uniqueId(),
      title: this.state.title,
      body: this.state.body
    });
    this.setState({title: '', body: ''});
  }

  setTitle(event) {
    this.setState({title: event.target.value});
  }

  setBody(event) {
    this.setState({body: event.target.value});
  }

  uniqueId() {
    return new Date().getTime();
  }

  render() {
    return (
      <div>
        <label>Title
          <input type='text' value={this.state.title} onChange={this.setTitle.bind(this)}/>
        </label>
        <label>Body
          <input type='text' onChange={this.setBody.bind(this)}/>
        </label>
        <button onClick={this.createTodo.bind(this)}>Submit
        </button>
      </div>
    );
  }
}
