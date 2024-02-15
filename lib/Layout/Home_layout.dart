import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/Modules/Archived%20Tasks/archived_tasks_screen.dart';
import 'package:untitled/Modules/Done%20Tasks/done_tasks_screen.dart';
import '../Modules/New Tasks/new_tasks_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var FormKey;
  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  Widget defaultFormField({
    required TextEditingController controller,
    required TextInputType type,
    required String? Function(String value) validate,
    required String label,
    required IconData prefix, required Future<Null> Function,


  }) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
      ),
      validator: validateText,


    );
  }

  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];


  late Database _database;


  late GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;


  late TextEditingController titleController = TextEditingController();
  late TextEditingController timeController = TextEditingController();
  late TextEditingController dateController = TextEditingController();
  var _showTimePicker;
  var showBottomSheet;

  get showTimePicker => _showTimePicker;

  set showTimePicker(value) {
    _showTimePicker = value;
  }
  @override
  void initState() {
    super.initState();
    createDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        elevation: 50.0,
      ),

      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          if (isBottomSheetShown) {

            if (FormKey.currentState.showBottomSheet) {
              Navigator.pop(context);
            }
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.edit;
            });
          } else {
            scaffoldKey.currentState?.showBottomSheet(
                    (context) => Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    color: Colors.grey[200],
                    child: Form(
                      key: formKey,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defaultFormField(
                        controller: titleController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'title must not be empty';
                          }
                          return null;
                        },
                        label: 'Task Title',
                        prefix: Icons.title, Function:_showTimePicker,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                        controller: timeController,
                        type: TextInputType.datetime,

                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'time must not be empty';
                          }
                          return null;
                        },
                        label: 'Task Time',

                    prefix: Icons.watch_later_outlined,
                    Function: showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then ((value) {
                    timeController.text =
                        value!.format(context).toString();
                    print(value.format(context));
                  });

                  SizedBox(
                  height: 15.0,
                ),



            ),
          defaultFormField(
          controller: dateController,
          type: TextInputType.datetime,

          validate: (String value) {
          if (value.isEmpty) {
          return 'date must not be empty';
          }
          return null;
          },
          label: 'Task Date',
          prefix: Icons.calendar_today, Function: null,
          ),
          ],
                      ),
          Function:





          ),

          ),
          ),
          ),
          );

          isBottomSheetShown = true;
          setState(() {
          fabIcon = Icons.add;
          });
        }
        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive_outlined,
            ),
            label: 'Archived',
          ),
        ],
      ),
    );
  }

  Future<String> getName() async {
    return 'Ahmed Ali';
  }

  void createDatabase() async {
    _database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT,date TEXT, time TEXT, status TEXT)')
            .then((value) {
          print('Table is created');
        }).catchError((error) {
          print('Error when creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('database opened');
      },
    );
  }

  void insertToDatabase() {
    _database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status)VALUES("first task","022","0111","new")')
          .then((value) {
        print('Inserted Successfully');
      }).catchError((error) {
        print('Error when Inserting New Record ${error.toString()}');
      });
    });
  }



  String? validateText(String? value) {
    return null;

  }

}