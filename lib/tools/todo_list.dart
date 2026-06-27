import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
     required this.taskName, 
     required this.taskCompleted, 
     required this.onChanged, 
     required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;


  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.only(
            top: 19,
            left: 19,
            right: 19,
            bottom: 0,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(), 
              children: [
                SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(13),
                  backgroundColor: Colors.redAccent,
                  ),
              ]
              ),
            child: Container(
              padding: EdgeInsets.all(19),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: taskCompleted, 
                    onChanged: onChanged,
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    ),
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: taskCompleted ? TextDecoration.lineThrough 
                      :TextDecoration.none,
                      decorationColor: Colors.black,
                      decorationThickness: 3,
                    ),
                    ),
                ],
              ),
            ),
          ),
        );
  }
  
}