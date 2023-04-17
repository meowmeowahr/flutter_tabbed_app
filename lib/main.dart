/*
Flutter Tab Tests
An example with a TabBar and TabController using Material 3
By: meowmeowahr
*/

import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  static const String _title = 'Flutter Tab Tests';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const HomeWidget(),
    );
  }
}

class AppState extends ChangeNotifier {
  var tabController = TabController(vsync: _HomeWidgetState(), length: 5);
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  void nextTab() {
    if (_tabController.index != _tabController.length - 1) {
      _tabController.index += 1;
    }
  }

  void prevTab() {
    if (_tabController.index != 0) {
      _tabController.index -= 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(App._title),
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.flag),
              ),
              Tab(
                icon: Icon(Icons.face),
              ),
              Tab(
                icon: Icon(Icons.bolt),
              ),
              Tab(
                icon: Icon(Icons.radar),
              ),
              Tab(
                icon: Icon(Icons.air),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            PageTestWidget(
              index: 1,
              icon: Icons.flag,
              onNext: () => nextTab(),
              onPrev: () => prevTab(),
            ),
            PageTestWidget(
              index: 2,
              icon: Icons.face,
              onNext: () => nextTab(),
              onPrev: () => prevTab(),
            ),
            PageTestWidget(
              index: 3,
              icon: Icons.bolt,
              onNext: () => nextTab(),
              onPrev: () => prevTab(),
            ),
            PageTestWidget(
              index: 4,
              icon: Icons.radar,
              onNext: () => nextTab(),
              onPrev: () => prevTab(),
            ),
            PageTestWidget(
              index: 5,
              icon: Icons.air,
              onNext: () => nextTab(),
              onPrev: () => prevTab(),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTestWidget extends StatelessWidget {
  const PageTestWidget({
    super.key,
    required this.index,
    required this.icon,
    required this.onNext,
    required this.onPrev,
  });

  final int index;
  final IconData? icon;
  final Function()? onNext;
  final Function()? onPrev;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Icon(icon, size: 192),
          Text(
            index.toString(),
            style: const TextStyle(fontSize: 96),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onPrev,
                child: const Text("Back"),
              ),
              const SizedBox(width: 48),
              ElevatedButton(
                onPressed: onNext,
                child: const Text("Next"),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
