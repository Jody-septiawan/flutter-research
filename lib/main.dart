import 'package:flutter/material.dart';
import 'repository/user_repository.dart';
import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                onPressed: () {},
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
                          backgroundImage: NetworkImage(listUser[index].avatar),
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
