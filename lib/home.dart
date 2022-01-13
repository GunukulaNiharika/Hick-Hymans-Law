import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(25),
        child: const Text("Visualization of \n Hick Hyman's Law",
            style: TextStyle(color: Colors.black, fontSize: 30)),
      ),
    );
  }
}
