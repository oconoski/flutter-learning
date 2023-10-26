import 'package:flutter/material.dart';
import 'package:flutter_learning/src/widgets/progress-bar.dart';
import 'package:get/get.dart';

class Details extends StatefulWidget {
  Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool morePressed = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(238, 235, 235, 0),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.toNamed(
              'index',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            )
          ],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 300),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const TabBar(
                      tabs: [
                        Tab(text: 'Sobre'),
                        Tab(text: 'Evoluções'),
                        Tab(text: 'Movimentos'),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            ListTile(
                              title: Text('Nome: Charmander'),
                              subtitle: Text('Tipo: Fogo'),
                            ),
                            ListTile(
                              title: Text('Altura: 0.6m'),
                              subtitle: Text('Peso: 8.5kg'),
                            ),
                            ProgressBar(name: 'HP', currentValue: 45, maxValue: 255),
                            ProgressBar(name: 'Ataque', currentValue: 224, maxValue: 255),
                            ProgressBar(name: 'Defesa', currentValue: 85, maxValue: 255),
                            ProgressBar(name: 'Velocidade', currentValue: 100, maxValue: 255),
                            ProgressBar(name: 'Total', currentValue: 180, maxValue: 255),
                          ],
                        ),
                        Column(
                          children: [
                            ListTile(
                              title: Text('Evo 1: Charmeleon'),
                              subtitle: Text('Fogo'),
                            ),
                            ListTile(
                              title: Text('Evo 2: Charizard'),
                              subtitle: Text('Fogo'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ListTile(
                              title: Text('Move 1: Ember'),
                            ),
                            ListTile(
                              title: Text('Move 2: Flamethrower'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 0,
              left: 20,
              right: 0,
              child: Text(
                'Charmander',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Set text color to white
                  fontSize: 24.0, // Set font size to 24
                ),
              ),
            ),
            Positioned(
              top: 25,
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: 0.6,
                child: Image.asset(
                  'assets/images/charmander.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(253, 107, 105, 1),
      ),
    );
  }
}
