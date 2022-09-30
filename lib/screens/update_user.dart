import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:research_app/repository/user_repository.dart';

class UpdateUserPage extends StatefulWidget {
  const UpdateUserPage({super.key});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  UserRepository userRepository = UserRepository();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;

    if (args[1].isNotEmpty) {
      _nameController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      _emailController.text = args[2];
    }
    if (args[3].isNotEmpty) {
      _passwordController.text = args[3];
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                    child: Text(
                      "UPDATE USER",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 99, 180),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                      ),
                      hintText: 'Name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                      ),
                      hintText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueGrey, width: 2.0),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Back")),
                    Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            bool response = await userRepository.putData(
                                args[0],
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text);

                            if (response) {
                              Navigator.of(context).popAndPushNamed("/home");
                            } else {
                              print("Update data gagal");
                            }
                          },
                          child: Text("Update"),
                        )),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
