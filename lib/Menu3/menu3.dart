import 'package:flutter/material.dart';
import 'package:hicks/Menu3/menu_items.dart';

class Menu3 extends StatefulWidget {
  const Menu3({Key? key}) : super(key: key);

  @override
  _Menu3State createState() => _Menu3State();
}

var _textColor = Colors.black;

class _Menu3State extends State<Menu3> {
  final time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Card(
                child: ExpansionTile(
                  title: Text(
                    items[index].title,
                    style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          187,
                          22,
                          0,
                        ),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  children: [_buildExpandableContent(items[index], time)],
                ),
              );
            }));
  }
}

_buildExpandableContent(subList sublist, DateTime time) {
  List<Widget> columnContent = [];

  if (sublist.subcontents != null) {
    for (var i = 0; i < sublist.subcontents!.length; i++) {
      columnContent.add(Card(
        child: ExpansionTile(
          title: Text(
            sublist.subcontents![i].title,
            style: TextStyle(
                color: Color.fromARGB(255, 187, 22, 0),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          children: [_buildExpandableContent(sublist.subcontents![i], time)],
        ),
      ));
    }
  }
  if (sublist.contents != null) {
    for (int i = 0; i < sublist.contents!.length; i++) {
      columnContent.add(
        ListTile(
          title: Text(
            sublist.contents![i],
            style: new TextStyle(
              fontSize: 15.0,
              color: _textColor,
            ),
          ),
          onTap: () {
            // setState(() {
            //   _selectedIndex = index;
            // });
            print(DateTime.now().difference(time));
          },
        ),
      );
    }
  }
  return Column(
    children: columnContent.toList(),
  );
  // for (String content in vehicle.contents)
  //   columnContent.add(
  //     ListTile(
  //       title: Text(content, style: new TextStyle(fontSize: 18.0),),
  //       leading: Icon(vehicle.icon),
  //       tileColor: _selectedIndex == index ? Colors.blue : null,
  //       onTap: () {
  //         setState(() {
  //           _selectedIndex = index;
  //         });
  //       },
  //     ),
  //   );
}
