import React from 'react';

export default class Weather extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      weather: null
    }
    this.getWeather = this.getWeather.bind(this);
  }

  componentDidMount() {
    navigator.geolocation.getCurrentPosition(this.getWeather);
  }

  getWeather(location) {
    let lat = Math.floor(location.coords.latitude);
    let lon = Math.floor(location.coords.longitude);
    let params = `lat=${lat}&lon=${lon}`
    let url = "http://api.openweathermap.org/data/2.5/weather?" + params;
    const apiKey = '7df2666c000ad9a9d1a3ea1d5aea512e';
    url += `&APPID=${apiKey}`;

    let xmlRequest = new XMLHttpRequest();
    xmlRequest.open('GET', url, true);

    xmlRequest.onload = () => {
      if (xmlRequest.status >= 200 && xmlRequest.status < 400) {
        const tmp = JSON.parse(xmlRequest.responseText);
        this.setState({weather: tmp});
      }
    }

    xmlRequest.send();
  }

  render() {

    let out = null;
    if (this.state.weather) {
      let weather = this.state.weather;
      let temp = Math.floor((weather.main.temp - 273) * 1.8 + 32);
      out = <div>
        <p>{weather.name}</p>
        <p>{temp} Degrees</p>
      </div>
    } else {
      out = <div className='loading'>loading</div>
    }

    return (
      <div>
        <h1>Weather</h1>
        <div className='weather'>
          {out}
        </div>
      </div>
    )
  }
}

// 7df2666c000ad9a9d1a3ea1d5aea512e
// className='fa fa-cloud'
