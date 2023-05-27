import 'package:flutter/material.dart';

class RouteExample extends StatefulWidget {
  const RouteExample({super.key});

  @override
  State<RouteExample> createState() => _RouteExampleState();
}

class _RouteExampleState extends State<RouteExample> {
  Object? result;
  var returnValue = '';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由传参'),
      ),
      body: Column(
        
        children:[
          ElevatedButton(
            onPressed: () async {
                result = await Navigator.pushNamed(
                context, 
                '/route_second',
                arguments: ScreenArguments('传入的标题','传入的信息')
                );
                setState(() {
                  returnValue = result.toString();
                });
            },
            child: const Text('路由传参'),
          ),
          const Text('返回的数据：'),
          Text(returnValue)

        ] 
        
      ),
    );
  }
}
class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
