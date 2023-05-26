import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    print('initstate');
    super.initState();
  }
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body:const  Text('首页'),
    );
  }
}