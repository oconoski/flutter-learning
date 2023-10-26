import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexState();
}

class _IndexState extends State<IndexPage> {
  bool morePressed = true;
  bool removeItens = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OWNDEX',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(30, 30, 30, 0.8),
      ),
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                color: const Color.fromRGBO(240, 0, 0, 1),
                child: const Center(
                  child: Text(
                    'MINHA PRÓPRIA POKEDEX',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () => Get.offAllNamed(
                'pokedex_list',
              ),
            ),
          ),
          Container(
            color: const Color.fromRGBO(34, 34, 36, 1),
            height: 30.0,
            padding: const EdgeInsets.all(4),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: InkWell(
            child: Container(
              color: const Color.fromRGBO(240, 240, 240, 1),
              child: const Center(
                child: Text('POKEDEX',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            onTap: () => Get.toNamed(
              'pokedex_list',
            ),
          )),
        ],
      ),
    );
  }
}
