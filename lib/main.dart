import 'package:flutter/material.dart';
import 'package:hicks/Drawer/drawer_item.dart';
import 'package:hicks/Menu1/Menu1.dart';
import 'package:hicks/Menu2/menu2.dart';
import 'package:hicks/Menu3/menu3.dart';
import 'package:hicks/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hick's Hymann Law",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 207, 157, 8),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screens = [Home(), Menu1(), Menu2(), Menu3()];

  final drawerItems = [
    DrawerItem(id: "1", name: "Home", isSelected: true),
    DrawerItem(
        id: "2",
        name: "Menu 1 - Unsorted, Uncategorized Menu",
        isSelected: false),
    DrawerItem(id: "3", name: "Menu 2 - Catergorized Menu", isSelected: false),
    DrawerItem(
        id: "4",
        name: "Menu 3 - Catergorized and Hierarchial Menu",
        isSelected: false),
  ];

  _onSelectItem(int index) {
    setState(() {
      _currentIndex = index;
    });
    for (int i = 0; i < drawerItems.length; i++) {
      setState(() {
        if (i == index) {
          drawerItems[i].isSelected = true;
        } else {
          drawerItems[i].isSelected = false;
        }
      });
    }
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(Container(
        child: ListTile(
          title: Text(d.name, style: TextStyle(color: Colors.black)),
          selected: i == _currentIndex,
          selectedTileColor: Colors.amber,
          onTap: () => _onSelectItem(i),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hicks Hyman Law"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: drawerItems.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            for (int i = 0; i < drawerItems.length; i++) {
                              setState(() {
                                if (index == i) {
                                  drawerItems[i].isSelected = true;
                                  _currentIndex = index;
                                } else {
                                  drawerItems[i].isSelected = false;
                                }
                              });
                            }
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            color: drawerItems[index].isSelected
                                ? const Color.fromARGB(255, 207, 157, 8)
                                : Colors.white,
                            child: ListTile(
                              title: Text(
                                drawerItems[index].name,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}
