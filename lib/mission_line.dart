import 'package:flutter/material.dart';

class MissionLine extends StatelessWidget {
  final String description;
  final bool isComplete;
  final Function onDone;
  final Function onDelete;

  const MissionLine(
      {Key? key,
      required this.description,
      this.isComplete = false,
      required this.onDone,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onDone();
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
                color: isComplete ? Colors.blue : Colors.white,
                border: Border.all(color: Colors.blueGrey)),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          description,
          style: TextStyle(
              decoration: isComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        IconButton(
            onPressed: () {
              onDelete();
            },
            icon: const Icon(Icons.delete))
      ],
    );
  }
}
