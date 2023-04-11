import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test1/task.dart';
import 'convert.dart';

class AddTaskScreen extends StatefulWidget {
  final List<Task> listTasks;
  const AddTaskScreen({required this.listTasks, super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  ///Key Form
  final _addTaskFormKey = GlobalKey<FormState>();

  ///Controller title
  final TextEditingController _titleController = TextEditingController();

  ///Controller deadline
  final TextEditingController _deadlineDateController = TextEditingController();
  DateTime? deadline;

  ///Controller start time
  final TextEditingController _startTimeController = TextEditingController();
  TimeOfDay? startTime;

  ///Controller end time
  final TextEditingController _endTimeController = TextEditingController();
  TimeOfDay? endTime;

  ///remind dropdown menu selected
  String _remindDropDownMenuValue = remindItems.first;

  ///repeat dropdown menu selected
  String _repeatDropDownMenuValue = repeatItems.first;

  /// color selected
  Color selectedColor = colorItems[0];
  @override
  Widget build(BuildContext context) {
    //print(deadlineDate);
    return Form(
      key: _addTaskFormKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Task'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Title here
                const Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ///Title form field
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[150],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),

                ///Deadline here
                const Text(
                  'Deadline',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_month),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (newDate == null) return;
                        deadline = newDate;
                        setState(() {
                          _deadlineDateController.text =
                              DateFormat('yyyy-MM-dd').format(newDate);
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[150],
                  ),
                  controller: _deadlineDateController,
                  readOnly: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deadline cannot be empty';
                    }
                    return null;
                  },
                ),

                ///Start time and end time here
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Start time here
                          const Text(
                            'Start time',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[150],
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.schedule,
                                  ),
                                  onPressed: () async {
                                    TimeOfDay? newStartTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (newStartTime == null) return;
                                    startTime = newStartTime;
                                    setState(() {
                                      _startTimeController.text =
                                          timeOfDayFormat12(newStartTime);
                                    });
                                  },
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Start time cannot be empty';
                              }
                              return null;
                            },
                            controller: _startTimeController,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    ///End time here
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'End Time',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.grey[150],
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.schedule,
                                  ),
                                  onPressed: () async {
                                    TimeOfDay? newEndTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (newEndTime == null) return;
                                    setState(() {
                                      endTime = newEndTime;
                                      _endTimeController.text =
                                          timeOfDayFormat12(newEndTime);
                                    });
                                  },
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'End time cannot be empty';
                              }
                              return null;
                            },
                            controller: _endTimeController,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// Remind here
                const Text(
                  'Remind',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[150],
                  ),
                  value: _remindDropDownMenuValue,
                  items:
                      remindItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          value,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _remindDropDownMenuValue = value!;
                  },
                ),

                /// Repeat here
                const Text(
                  'Repeat',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[150],
                  ),
                  value: _repeatDropDownMenuValue,
                  items:
                      repeatItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          value,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    _repeatDropDownMenuValue = value!;
                  },
                ),

                /// Select color here
                const Text(
                  'Color',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (Color color in colorItems) _colorSelectButton(color),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.teal,
            ),
            child: const Text(
              'Create a Task',
            ),
            onPressed: () {
              ///Validate
              if (_addTaskFormKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Adding task is completed')));
                widget.listTasks.add(Task(
                    title: _titleController.text,
                    startTime: startTime!,
                    endTime: endTime!,
                    deadline: deadline!,
                    isFavorite: false,
                    isComplete: false,
                    remind: _remindDropDownMenuValue,
                    repeat: _repeatDropDownMenuValue,
                    color: selectedColor));
                Navigator.pop(context);

                ///Thêm task
              }

              ///pop
            },
          ),
        ),
      ),
    );
  }

  TextButton _colorSelectButton(Color color) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: color == selectedColor ? Colors.black : Colors.transparent,
            width: 4,
          ),
        ),
        child: Icon(
          Icons.check,
          color: color == selectedColor ? Colors.white : Colors.transparent,
        ),
      ),
    );
  }
}
