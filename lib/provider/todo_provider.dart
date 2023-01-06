



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/models/todo.dart';


final todoProvider = StateNotifierProvider<TodoProvider,List<Todo>>((ref) => TodoProvider([]));

class TodoProvider extends StateNotifier<List<Todo>>{
  TodoProvider(super.state);

  void addToDo(Todo todo){
    state = [...state, todo];
}

void removeToDo(Todo todo){
    state.remove(todo);
    state = [...state];

}

void updateToDo(int index, Todo todo){
    state[index] = todo;
    state = [...state];

}

// void checkBoxChange(bool? value, int index){
// state[index] = !state[index];
//
// }

}