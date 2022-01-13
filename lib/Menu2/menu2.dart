import 'package:flutter/material.dart';
import 'package:hicks/Menu2/menu_items.dart';

class Menu2 extends StatelessWidget {
  const Menu2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();

    return Container(
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            head("Kitchen"),
            Container(
              padding: const EdgeInsets.all(5),
              child: list_items(Kitchen, time),
            ),
            head("Living Room"),
            Container(
              padding: const EdgeInsets.all(5),
              child: list_items(Living_room, time),
            ),
            head("Toiletries"),
            Container(
              padding: const EdgeInsets.all(5),
              child: list_items(toiletries, time),
            ),
            head("Clothing"),
            Container(
              padding: const EdgeInsets.all(5),
              child: list_items(clothing, time),
            ),
            head("Food"),
            Container(
              padding: const EdgeInsets.all(5),
              child: list_items(food, time),
            )
          ],
        ),
      ),
    );
  }
}

Widget list_items(List list, DateTime time) {
  var list_cards = <Widget>[];
  for (int i = 0; i < list.length; i++) {
    list_cards.add(card(time, list[i]));
  }
  return Column(
    children: list_cards.toList(),
  );
}

Widget head(String heading) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Text(
      heading,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}

card(DateTime time, String listItem) {
  return Card(
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    shadowColor: Colors.grey,
    borderOnForeground: true,
    margin: const EdgeInsets.all(10),
    child: ListTile(
      title: Text(listItem),
      onTap: () {
        print(DateTime.now().difference(time));
      },
      // _buildHostelItem(hostelMenus[index], context),
    ),
  );
}
