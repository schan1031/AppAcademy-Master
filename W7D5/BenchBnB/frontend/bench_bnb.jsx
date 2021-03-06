import Root from'./components/root';
import ReactDOM from 'react-dom';
import configureStore from './store/store'

const store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);

  // TESTING
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});
