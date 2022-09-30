import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import '../repository/user_repository.dart';
import '../models/user.dart';

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
                    return GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(
                          context, '/update-user',
                          arguments: [
                            listUser[index].id,
                            listUser[index].name,
                            listUser[index].email,
                            listUser[index].password
                          ]),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                        child: Row(children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(listUser[index].avatar),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listUser[index].name,
                                      style: TextStyle(color: Colors.black)),
                                  Text(listUser[index].email,
                                      style: TextStyle(color: Colors.black)),
                                ]),
                          )
                        ]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: listUser.length))),
    );
  }
}
