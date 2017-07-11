import React from 'react';
import ReactDOM from 'react-dom';
import TodoListItem from './todo_list_item.jsx';
import TodoForm from './todo_form.jsx';

const TodoList = (props) => {

  return(
    <div>
      <ul>
        {
          props.todos.map((todo) => (
            <TodoListItem key={todo.id} todo={todo} removeTodo={props.removeTodo}/>
          ))
        }
      </ul>
      <TodoForm receiveTodo={props.receiveTodo}/>
    </div>


  );
};

export default TodoList;
