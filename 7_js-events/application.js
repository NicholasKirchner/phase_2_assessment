$(document).ready(function() {
  var todoTemplate = $.trim($('#todo_template').html());

  function bindEvents() {
      $(document).on('click', '.add', newTodoItem);
      $(document).on('click', '.complete', completeTodoItem);
      $(document).on('click', '.delete', deleteTodoItem);
  }

  function newTodoItem() {
      var new_item = buildTodo($('.toolbox input').val());
      $('.todo_list').append(new_item);     
  }

  function completeTodoItem() {
      $(this).parent().parent().parent().attr('class', 'todo complete');
  }

  function deleteTodoItem() {
      $(this).parent().parent().parent().remove();
  }

  function buildTodo(todoName) {
    // Creates an jQueryDOMElement from the todoTemplate.
    var $todo = $(todoTemplate);
    // Modifies it's text to use the passed in todoName.
    $todo.find('h2').text(todoName);
    // Returns the jQueryDOMElement to be used elsewhere.
    return $todo;
  }

  bindEvents();
});
