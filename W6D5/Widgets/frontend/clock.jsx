import React from 'react';

export default class Clock extends React.Component{
  constructor (props) {
    super(props);
    this.tick = this.tick.bind(this);
    this.state = {
      time: new Date()
    }
  }

  componentDidMount() {
    this.intervalID = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    this.intervalID.clearInterval();
  }

  tick() {
    this.setState({time: new Date()});
  }

  render() {
    return (
      <div>
        <h1>Clock</h1>
        <div className='clock'>
          <p>
          <span>
            {this.state.time.toTimeString()}
          </span>
        </p>
          <p>
            Date: {this.state.time.toDateString()}
          </p>

        </div>
      </div>
    )
  }
}
