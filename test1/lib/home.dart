import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'add_task.dart';
import 'task.dart';
import 'convert.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// List of Tasks
  List<Task> listTasks = <Task>[
    Task(
      title: 'Làm việc cho chị Phương',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: remindItems[2],
      repeat: repeatItems[2],
      color: Colors.green,
    ),
    Task(
      title: 'Hello',
      startTime: TimeOfDay.now(),
      endTime: TimeOfDay.now(),
      deadline: DateTime(2023),
      isFavorite: false,
      isComplete: false,
      remind: remindItems[0],
      repeat: repeatItems[0],
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
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
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
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelPadding: EdgeInsets.zero,
            tabs: [
              tabBarText('All'),
              tabBarText('Uncompleted'),
              tabBarText('Completed'),
              tabBarText('Favourite'),
            ],
          ),
        ),

        ///Tab Bar View
        body: TabBarView(children: [
          ///All tab
          _tabBarViewBuilderAll(),

          ///Uncompleted tab
          _tabBarViewBuilderUncompleted(),

          ///completed tab
          _tabBarViewBuilderCompleted(),

          ///favourite tab
          _tabBarViewBuilderFavorite(),
        ]),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.teal,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTaskScreen(
                    listTasks: listTasks,
                  ),
                ),
              ).then((value) {
                setState(() {});
              });
            },
            child: const Text(
              'Add a task',
            ),
          ),
        ),
      ),
    );
  }

  ///TabBar
  Tab tabBarText(String content) {
    return Tab(
      child: Text(
        content,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
    );
  }

  ///Task
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
            child: Checkbox(
              value: item.isComplete,
              onChanged: (value) {
                setState(() {
                  item.isComplete = value!;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'From: ${timeOfDayFormat12(item.startTime)} - To: ${timeOfDayFormat12(item.endTime)}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Deadline: ${DateFormat('yyyy-MM-dd').format(item.deadline)}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
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

  Widget _tabBarViewBuilderAll() {
    return listTasks.isEmpty
        ? _nothingTabBarViewBuilder()
        : ListView(
            shrinkWrap: true,
            children: [
              for (Task item in listTasks) _taskBuilder(item),
            ],
          );
  }

  Widget _tabBarViewBuilderUncompleted() {
    List<Task> uncompletedTask =
        listTasks.where((element) => !element.isComplete).toList();
    return uncompletedTask.isEmpty
        ? _nothingTabBarViewBuilder()
        : ListView(
            shrinkWrap: true,
            children: [
              for (Task item in uncompletedTask) _taskBuilder(item),
            ],
          );
  }

  Widget _tabBarViewBuilderCompleted() {
    List<Task> completedTask =
        listTasks.where((element) => element.isComplete).toList();
    return completedTask.isEmpty
        ? _nothingTabBarViewBuilder()
        : ListView(
            shrinkWrap: true,
            children: [
              for (Task item in completedTask) _taskBuilder(item),
            ],
          );
  }

  Widget _tabBarViewBuilderFavorite() {
    List<Task> favoriteTask =
        listTasks.where((element) => element.isFavorite).toList();
    return favoriteTask.isEmpty
        ? _nothingTabBarViewBuilder()
        : ListView(
            shrinkWrap: true,
            children: [
              for (Task item in favoriteTask) _taskBuilder(item),
            ],
          );
  }

  ///Nothing TabBarView
  Column _nothingTabBarViewBuilder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.menu,
          size: 72,
          color: Colors.grey,
        ),
        Text(
          'No Tasks Yet, Please Insert Some Tasks',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
