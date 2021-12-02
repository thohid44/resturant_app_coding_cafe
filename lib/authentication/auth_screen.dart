import 'package:flutter/material.dart';
import 'package:fooderlich/authentication/login_screen.dart';
import 'package:fooderlich/authentication/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
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
            title: const Text(
              "iFood",
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: "Lobster",
              ),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.lock, color: Colors.white),
                  text: "Login",
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  text: "Register",
                ),
              ],
              indicatorColor: Colors.white38,
              indicatorWeight: 4,
            ),
          ),
          body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber,
                    Colors.cyan,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: const TabBarView(
                  children: [LoginScreen(), RegisterScreen()])),
        ),
      ),
    );
  }
}
