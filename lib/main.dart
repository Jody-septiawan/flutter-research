import 'package:flutter/material.dart';
import 'repository/user_repository.dart';
import 'models/user.dart';
import 'screens/add_user.dart';

var imgUrl =
    "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Research Test App',
      routes: {
        '/home': (context) => HomePage(),
        '/add-user': (context) => AddUserPage(),
      },
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> listUser = [];
  UserRepository userRepository = UserRepository();

  getData() async {
    listUser = await userRepository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.app_registration),
                onPressed: () {
                  Navigator.of(context).pushNamed('/add-user');
                },
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {},
                      child: Container(
                          // padding: EdgeInsets.fromLTRB(2.0, 5.0, 2.0, 5.0),
                          child: Row(children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(imgUrl),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(listUser[index].name,
                                    style: TextStyle(color: Colors.black)),
                                Text(listUser[index].email,
                                    style: TextStyle(color: Colors.black)),
                              ]),
                        )
                      ])),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: listUser.length))),
    );
  }
}
