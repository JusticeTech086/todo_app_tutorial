import 'package:flutter/material.dart';
import 'package:to_do_app/tools/todo_list.dart';

class HomePage  extends StatefulWidget{
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List toDoList = [
    ['Doing My HomeWork', false],
    ['Having Breakfast', false],
   
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        title: Text(
          "Basic Todo",
          ),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.black,
      ),
      body: ListView.builder(itemCount: toDoList.length, itemBuilder:  (BuildContext context, index) {
        return TodoList(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChanged(index),
          deleteFunction: (contex) => deleteTask(index),
        );
      }
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a new todo items',
                    filled: true,
                    fillColor: Colors.blueGrey.shade300,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey
                      ),
                    ),
                  ),
                ),
              ),
              ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child: Icon(Icons.add),
              ),
          ],
        ),
      ),
    );
  }
}