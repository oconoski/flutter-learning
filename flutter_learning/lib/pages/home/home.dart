import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/widgets/expansible-menu.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool morePressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('remind'),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(30),
        crossAxisCount: 1,
        mainAxisSpacing: 50,
        children: List.generate(
          10,
          (index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 218, 185, 0.7)),
            child: const Row(
              children: [],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 173, 216, 230),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ExpansibleMenu(
        distance: 100,
        children: [
          ActionButton(
            onPressed: () => 1,
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () => 1,
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () => 1,
            icon: const Icon(Icons.videocam),
          ),
        ],
      ),
    );
  }
}
