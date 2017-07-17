import React from 'react';
import { Link, Route } from 'react-router-dom';

export default class Greeting extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    this.props.logout();
  }

  render() {
    console.log(this.props);
    if (this.props.currentUser) {
      return (
        <div>
          Welcome {this.props.currentUser.username}
          <button onClick={this.handleClick}>
            Log Out
          </button>
        </div>
      );
    } else {
      return (
        <div>
          <Link to='/signup'>Sign Up</Link>
          <Link to='/login'>Log In</Link>
        </div>
      );
    }
  }
}
