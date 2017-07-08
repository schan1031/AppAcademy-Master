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
          <div>
          <p>Time:</p>
          <p>
            Date:
          </p>
        </div>
        <div>
          <p>
            {this.state.time.toTimeString()}
          </p>
          <p>
            {this.state.time.toDateString()}
          </p>
        </div>

        </div>
      </div>
    )
  }
}
