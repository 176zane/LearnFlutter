import 'package:flutter/material.dart';
import 'package:flutter_test_app/home/route_example.dart';

class RouteSecond extends StatelessWidget {
  const RouteSecond({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(arg.message),
            ElevatedButton(
            onPressed: () {
              Navigator.pop(context,'我是返回值');
            },
            child: const Text('带信息返回!'),
            ),
          ],
        )),
      
    );
  }

}