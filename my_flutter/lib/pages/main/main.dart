import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/pages/main/initialize_items.dart';

class MainScreen extends StatefulWidget {
  static final String routeName = "/";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  MethodChannel methodChannel = MethodChannel("native/method");
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedLabelStyle: TextStyle(color: Colors.red),
        unselectedLabelStyle: TextStyle(color: Colors.black45),
        items: items,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            methodChannel.invokeMethod("back");
          }
      ),
    );
  }
}