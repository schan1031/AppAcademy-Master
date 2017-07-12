import React from 'react';
import ReactDOM from 'react-dom';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';

class TodoList extends React.Component {
  constructor(props) {
      super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const { todos } = this.props;
    return(
      <div>
        <ul>
          {
            this.props.todos.map((todo) => (
              <TodoListItem key={todo.id} todo={todo}
                updateTodo={this.props.updateTodo} removeTodo={this.props.removeTodo}/>
            ))
          }
        </ul>
        <TodoForm createTodo={this.props.createTodo} errors={this.props.errors}/>
      </div>
    );
  }
}

export default TodoList;
