import 'package:flutter/material.dart';
import 'package:flutter_learning/pages/widgets/expansible-menu.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool morePressed = true;
  bool removeItens = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POKEDEX'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(1, 93, 105, 0.8),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(30),
        crossAxisCount: 1,
        mainAxisSpacing: 50,
        children: List.generate(
            3,
            (index) => InkWell(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(255, 255, 255, 0.7)),
                        child: Center(
                          child: Image.asset(
                            'assets/images/charmander.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Charmander',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      removeItens == true
                          ? Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {},
                                  color: const Color.fromARGB(255, 200, 15, 1),
                                ),
                              ),
                            )
                          : Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  onPressed: () {},
                                  color: const Color.fromARGB(255, 200, 15, 1),
                                ),
                              ),
                            ),
                    ],
                  ),
                  onTap: () => Get.toNamed(
                    'details',
                  ),
                )),
      ),
      backgroundColor: const Color.fromARGB(255, 173, 216, 230),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ExpansibleMenu(
        distance: 100,
        children: [
          ActionButton(
            onPressed: () => Get.toNamed(
              'details',
            ),
            icon: const Icon(Icons.add),
            color: Colors.blue,
          ),
          ActionButton(
            onPressed: () => removeItens = !removeItens,
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
          ActionButton(
              onPressed: () => 1,
              icon: const Icon(Icons.search),
              color: Colors.grey),
        ],
      ),
    );
  }
}
