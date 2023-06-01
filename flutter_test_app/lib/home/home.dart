import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('首页'),
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             
              children: [
                ElevatedButton(
                  child: const Text('路由'),
                  onPressed:() {
                    Navigator.pushNamed(context, '/route_example');
                  },
              ),
                ElevatedButton(
                  child: const Text('provider示例'),
                  onPressed:() {
                    Navigator.pushNamed(context, '/shopper_login');
                  },
              ),
              ]
            ),
          ),
        ),
    );
     
  }
}