import 'package:flutter/material.dart';
import 'package:flutter_test_app/about/about.dart';
import 'package:flutter_test_app/home/home.dart';
import 'package:flutter_test_app/home/route_example.dart';
import 'package:flutter_test_app/home/route_second.dart';
import 'package:flutter_test_app/pages/layout_page.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const MyHomePage(title: 'Flutter Demo'),
        '/route_example' : (context) => const RouteExample(),
        '/route_second' : (context) => const RouteSecond(),
        '/layout' : (context) => const LayoutPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  //无状态 widget 接收的参数来自于它的父 widget，它们储存在 final 成员变量中。
  //当 widget 需要被 build() 时，就是用这些存储的变量为创建的 widget 生成新的参数。
  final String title;
  //当该 widget 的父 widget 重建时，父 widget 首先会创建一个 ShoppingList 的实例，
  //但是框架会复用之前创建的 _ShoppingListState，而不会重新调用 createState。
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//为什么 StatefulWidget 和 State 是独立的对象。
//在 Flutter 中，这两种类型的对象具有不同的生命周期。 
//Widget 是临时对象，用于构造应用当前状态的展示。而 State 对象在调用 build() 之间是持久的，以此来存储信息
//State 的子类通常以下划线开头进行命名，表示它们的实现细节是私有的
class _MyHomePageState extends State<MyHomePage> {
  int seleclectedIndex = 0;
  final screens = [
    const Home(),
    const About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: seleclectedIndex,
        children: screens,
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: seleclectedIndex,
        onTap: (index)=>setState(() {
          seleclectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.person),
            label: '我',
          ),
            
        ],
      ),
    );
  }
}
