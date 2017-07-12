import { connect } from 'react-redux';
import { allTodos } from '../../reducers/selectors.js';
import { removeTodo, fetchTodos, createTodo, updateTodo } from '../../actions/todo_actions.js';
import TodoList from './todo_list.jsx';
import TodoListItem from './todo_list_item.jsx';

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  createTodo: (todo) => dispatch(createTodo(todo)),
  removeTodo: (todo) => dispatch(removeTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  updateTodo: (todo) => dispatch(updateTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);

// export const remove = connect(
//   mapStateToProps,
//   mapDispatchToProps
// )(TodoListItem);
