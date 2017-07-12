export const getTodos = () => (
  $.ajax({ method: 'GET', url: '/api/todos' })
);

export const postTodo = (todo) => (
  $.ajax({ method: 'POST', url: '/api/todos', data: { todo } })
);

export const patchTodo = (todo) => (
  $.ajax({ method: 'PATCH', url: `/api/todos/${todo.id}`, data: { todo } })
);
