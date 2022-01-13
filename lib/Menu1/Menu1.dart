import 'package:flutter/material.dart';
import 'package:hicks/Menu1/menu_items.dart';

class Menu1 extends StatelessWidget {
  const Menu1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = DateTime.now();
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              shadowColor: Colors.grey,
              borderOnForeground: true,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
              child: ListTile(
                title: Text(items[index]),
                onTap: () {
                  print(DateTime.now().difference(time));
                },
                // _buildHostelItem(hostelMenus[index], context),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
          itemCount: items.length),
    );
  }
}

// R