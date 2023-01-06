


import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_ui/models/todo.dart';
import 'package:flutter_ui/provider/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class HomePage extends ConsumerWidget {
final todoController = TextEditingController();
final todoController1 = TextEditingController();
  @override
  Widget build(BuildContext context, ref) {
    final todoData = ref.watch(todoProvider);
    return Scaffold(
      backgroundColor: Color(0xfffF5F5F5),
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
                      DateTime now = DateTime.parse(todoData[index].dateTime);
                      String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
                      final todo = todoData[index];
                        return Slidable(
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(
                                autoClose: true,
                                onPressed: (context) {
                                  Get.defaultDialog(
                                      title: 'Update post',
                                      content: TextFormField(
                                        controller: todoController1..text = todo.todo,
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
                                                todo: todoController1.text.trim()
                                            );
                                            Get.back();
                                            ref.read(todoProvider.notifier).updateToDo(index, newTodo);
                                            todoController1.clear();
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
                                      actions: [

                                        TextButton(
                                            onPressed: (){
                                              Get.back();
                                            },
                                            child: Text('Cancel')),
                                      ]
                                  );
                                },
                                icon: Icons.edit_note_outlined,
                                borderRadius: BorderRadius.circular(12),
                              backgroundColor: Colors.blue,
                              ),
                              SlidableAction(onPressed: (context) {
                                Get.defaultDialog(
                                  title: 'Hold on',
                                  content: Text('Are you sure you want to remove this'),
                                  actions: [
                                    TextButton(
                                        onPressed: (){
                                          Get.back();
                                          ref.read(todoProvider.notifier).removeToDo(todo);

                                        },
                                        child: Text('Yes')),
                                    TextButton(
                                        onPressed: (){
                                          Get.back();
                                        },
                                        child: Text('no')),
                                  ]
                                );
                              },
                              icon: Icons.delete,backgroundColor: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                              )
                            ],
                          ),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20,),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              leading: Icon(Icons.task_outlined),
                              // leading:Checkbox(
                              //     onChanged: (value) {},
                              //     value: ,
                              // ),
                              title: Text(todo.todo),
                              subtitle: Text(formattedDate),
                              // trailing: Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     IconButton(
                              //            onPressed: (){
                              //             showDialog(context: context, builder: (context) => SimpleDialog(
                              //
                              //               title: Text('Update todo'),
                              //               backgroundColor: Color(0xfffF5F5F5),
                              //               children: [
                              //                 Padding(
                              //                   padding: const EdgeInsets.all(8.0),
                              //                   child: TextField(
                              //               decoration: InputDecoration(
                              //                     hintText: 'type to update',
                              //                     fillColor: Colors.white,
                              //                     filled: true,
                              //                     border: InputBorder.none,
                              //
                              //                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)
                              //               ),
                              //                     onChanged: (value) {
                              //                       text = value;
                              //
                              //                     },
                              //                   ),
                              //                 ),
                              //                 Padding(
                              //                   padding: const EdgeInsets.symmetric(horizontal: 100),
                              //                   child: ElevatedButton(
                              //
                              //                       onPressed: (){
                              //                         final newtodo = Todo(todo: text, dateTime: DateTime.now().toString());
                              //                         ref.read(todoProvider.notifier).updateToDo(index, newtodo);
                              //                         Navigator.pop(context);
                              //
                              //                       },
                              //                       child: Text('Update')),
                              //                 )
                              //               ],
                              //             ));
                              //            },
                              //            icon: Icon(Icons.edit_note_outlined,color: Colors.red),
                              //        ),
                              //     IconButton(
                              //         onPressed: (){
                              //           ref.read(todoProvider.notifier).removeToDo(todo);
                              //         },
                              //         icon: Icon(Icons.delete_rounded,color: Colors.red,)
                              //     )
                              //   ],
                              // ),



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
