import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageDataHolder h;
  late CustomListView l;
  late CustomButton b;
  _MyHomePageState() {
    h = PageDataHolder();
    l = CustomListView(items: h.items);
    b = CustomButton(onTap: onPressButton);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: l,
      floatingActionButton: b,
    );
  }

  void onPressButton() {
    setState(() {
      h.addItem("value ${h.items.length}");
    });
    l = CustomListView(items: h.items);
  }
}

class PageDataHolder {
  late List<String> items;
  PageDataHolder() {
    items = [];
  }

  void addItem(String arg) => items.add(arg);
}

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key, required this.items}) : super(key: key);
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(items[index]));
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap}) : super(key: key);
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      child: const Icon(Icons.add),
    );
  }
}
