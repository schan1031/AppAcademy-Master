import React from 'react';

export default class SessionForm extends React.Component {
  constructor(props) {
		super(props);
		this.state = {
			username: "",
			password: ""
		};
  }

  updateUsername (e) {
    
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  render () {
    const formType = this.props.formType;

    return (formType === 'login') ? (
      <div>
        <span>Username</span>
        <input type='text' onChange={this.updateUsername}/>
      </div>
    ) : (
      <div></div>
    );
  }
}
