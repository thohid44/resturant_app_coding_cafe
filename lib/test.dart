import 'package:flutter/material.dart';

class TestData extends StatefulWidget {
  const TestData({Key? key}) : super(key: key);

  @override
  _TestDataState createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.cyan, Colors.amber],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                  title: const Text("Test Tab", style: TextStyle(fontSize: 20)),
                  centerTitle: true,
                  bottom: const TabBar(tabs: [
                    Tab(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      text: "Login",
                    ),
                    Tab(
                        icon: Icon(
                          Icons.person_add,
                          color: Colors.white,
                        ),
                        text: "Register")
                  ])),
            )));
  }
}
