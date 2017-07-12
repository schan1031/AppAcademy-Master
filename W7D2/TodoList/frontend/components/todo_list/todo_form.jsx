import React from 'react';
import merge from 'lodash/merge';

export default class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {title: "", body: ""};
  }

  handleSubmit(event) {
    // const todo = merge({}, this.state, { id: this.uniqueId() });
    // console.log(this.state);
    event.preventDefault();
    this.props.createTodo({
      title: this.state.title,
      body: this.state.body
    }).then(() => this.setState({title: '', body: ''}));
  }

  setTitle(event) {
    this.setState({title: event.target.value});
  }

  setBody(event) {
    this.setState({body: event.target.value});
  }

  // uniqueId() {
  //   return new Date().getTime();
  // }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit.bind(this)}>
          {this.props.errors.map((error,idx) => (
            <div key={idx}>{error}<br/></div>
          ))}
          <label>Title
            <input type='text' value={this.state.title} onChange={this.setTitle.bind(this)}/>
          </label>
          <label>Body
            <input type='text' value={this.state.body} onChange={this.setBody.bind(this)}/>
          </label>
          <button>Submit
          </button>

        </form>
      </div>
    );
  }
}
