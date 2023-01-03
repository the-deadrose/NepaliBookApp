


import 'package:flutter/material.dart';
import 'package:flutter_ui/models/todo.dart';
import 'package:flutter_ui/provider/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
final todoController = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    final todoData = ref.watch(todoProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: todoController,
                onFieldSubmitted: (value) {
                  // print(value);
                  if (value.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                      content: Text('add some todo'),
                    )
                    );
                  }else {
                    final newTodo = Todo(
                        dateTime: DateTime.now().toString(),
                        todo: value
                    );
                    //ref.read(todoProvider.notifier).addToDo(newTodo);
                    ref.read(todoProvider.notifier).addToDo(newTodo);
                    todoController.clear();
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none),
                  focusedBorder: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'add some todo',
                  hintStyle: TextStyle(color: Colors.grey,)
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemCount: todoData.length,
                      itemBuilder: (context, index){
                      final todo = todoData[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,),
                            tileColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            leading: Icon(Icons.task_outlined),
                            title: Text(todo.todo),
                            subtitle: Text(todo.dateTime),
                            trailing: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               ElevatedButton(
                                   onPressed: (){},
                                   child: Text('Edit')
                               ),
                               ElevatedButton(
                                   onPressed: (){},
                                   child: Text('Delete')
                               )
                             ],
                            ),

                          ),
                        );
                      }
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
