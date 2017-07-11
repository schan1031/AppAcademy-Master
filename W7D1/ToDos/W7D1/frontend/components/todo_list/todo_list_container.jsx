import { connect } from 'react-redux';
import { allTodos } from '../../reducers/selectors.js';
import { receiveTodo } from '../../actions/todo_actions.js';
import { removeTodo } from '../../actions/todo_actions.js';
import TodoList from './todo_list.jsx';
import TodoListItem from './todo_list_item.jsx';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

// export const remove = connect(
//   mapStateToProps,
//   mapDispatchToProps
// )(TodoListItem);
