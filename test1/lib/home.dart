import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'add_task.dart';
import 'task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> listTasks = <Task>[
    Task(
      title: 'Hello',
      startTime: DateTime(2023),
      endTime: DateTime(2023),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: 10,
      repeat: Repeat.Weakly,
      color: Colors.green,
    ),
    Task(
      title: 'Hello',
      startTime: DateTime(2023),
      endTime: DateTime(2023),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: 10,
      repeat: Repeat.Weakly,
      color: Colors.green,
    ),
    Task(
      title: 'Hello',
      startTime: DateTime(2023),
      endTime: DateTime(2023),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: 10,
      repeat: Repeat.Weakly,
      color: Colors.purple,
    ),
    Task(
      title: 'Hello',
      startTime: DateTime(2023),
      endTime: DateTime(2023),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: 10,
      repeat: Repeat.Weakly,
      color: Colors.purple,
    ),
    Task(
      title: 'Hello',
      startTime: DateTime(2023),
      endTime: DateTime(2023),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: 10,
      repeat: Repeat.Weakly,
      color: Colors.purple,
    ),
    Task(
      title: 'Hello',
      startTime: DateTime(2023),
      endTime: DateTime(2023),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: 10,
      repeat: Repeat.Weakly,
      color: Colors.purple,
    ),
    Task(
      title: 'Hello',
      startTime: DateTime(2023),
      endTime: DateTime(2023),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: 10,
      repeat: Repeat.Weakly,
      color: Colors.purple,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Board'),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.calendar_month,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text('All'),
              ),
              Tab(
                child: Text('Uncompleted'),
              ),
              Tab(
                child: Text('Completed'),
              ),
              Tab(
                child: Text('Favourite'),
              ),
            ],
          ),
        ),
        body: listTasks.isEmpty
            ? const Center(
                child: Text('Trống trơn'),
              )
            : ListView(
                children: [
                  for (Task item in listTasks) _taskBuilder(item),
                ],
              ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskScreen()),
            );
          },
          child: const Text('Add a task'),
        ),
      ),
    );
  }

  Container _taskBuilder(Task item) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Checkbox(
                    value: item.isComplete,
                    onChanged: (value) {
                      setState(() {
                        item.isComplete = value!;
                      });
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      'Thời gian ở đây',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Deadline ở đây',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: IconButton(
              onPressed: () {
                setState(() {
                  item.isFavorite = !item.isFavorite;
                });
              },
              icon: item.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    )
                  : const Icon(
                      Icons.favorite_border,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
