import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample/mission_line.dart';

import '../main.dart';
import 'mission.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final _missionBox = Hive.box(missionBox);

  final _missions = [
    Mission(description: 'description1', isComplete: false),
    Mission(description: 'description2', isComplete: false),
    Mission(description: 'description3', isComplete: false),
    Mission(description: 'description4', isComplete: false),
    Mission(description: 'description5', isComplete: false),
    Mission(description: 'description6', isComplete: true),
    Mission(description: 'description7', isComplete: true),
  ];

  @override
  void initState() {
    super.initState();
    for (var element in _missionBox.values) {
      element.isComplete;
    }
    if (_missionBox.length == 0) _missionBox.addAll(_missions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Add new mission'),
              onSubmitted: (str) {
                _missionBox.add(Mission(description: str, isComplete: false));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ValueListenableBuilder<Box>(
                valueListenable: _missionBox.listenable(),
                builder: (context, box, widget) {
                  return ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: MissionLine(
                          description:
                              _missionBox.values.elementAt(index).description,
                          isComplete:
                              _missionBox.values.elementAt(index).isComplete,
                          onDone: () {
                            setState(() {
                              _missionBox.putAt(
                                  index,
                                  Mission(
                                      description: _missionBox.values
                                          .elementAt(index)
                                          .description,
                                      isComplete: !_missionBox.values
                                          .elementAt(index)
                                          .isComplete));
                            });
                          },
                          onDelete: () {
                            _missionBox.deleteAt(index);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _missionBox.close();
    // TODO: implement dispose
    super.dispose();
  }
}
