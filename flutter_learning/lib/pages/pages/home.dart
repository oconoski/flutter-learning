import 'package:flutter/material.dart';
import 'package:flutter_learning/src/widgets/expansible-menu.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool morePressed = true;
  bool removeItens = false;
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POKEDEX'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(1, 93, 105, 0.8),
      ),
      body: Stack(
        children: [
          GridView.count(
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
                        color: const Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/charmander.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return removeItens
                            ? Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () => setState(() {
                                      removeItens = !removeItens;
                                    }),
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
                              );
                      },
                    ),
                    Positioned(
                      bottom: 5,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(10.0)),
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
                  ],
                ),
                onTap: () => Get.toNamed('details'),
              ),
            ),
          ),
          searching
              ? Container(
                  decoration: const BoxDecoration(color: Color.fromRGBO(50, 50, 50, 0.5)),
                  child: Stack(
                    children: [
                      Center(
                        child: Form(
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(suffixIcon: Icon(Icons.search), fillColor: Colors.white, focusColor: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Stack(
                          children: [
                            IconButton(
                                onPressed: () => setState(() {
                                      searching = false;
                                    }),
                                icon: const Icon(Icons.close)),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : const Text("")
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 173, 216, 230),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: ExpansibleMenu(
        distance: 100,
        children: [
          ActionButton(
            onPressed: () => Get.toNamed('details'),
            icon: const Icon(Icons.add),
            color: Colors.blue,
          ),
          ActionButton(
            onPressed: () => setState(() {
              removeItens = !removeItens;
            }),
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
          ActionButton(
            onPressed: () => setState(() {
              searching = !searching;
            }),
            icon: const Icon(Icons.search),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
