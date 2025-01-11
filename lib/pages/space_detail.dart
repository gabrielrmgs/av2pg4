import 'package:flutter/material.dart';
import 'package:sistema_de_reservas/models/space.dart';

class SpaceDetail extends StatelessWidget {
  final Space space;

  const SpaceDetail({
    super.key,
    required this.space,
  });

  @override
  Widget build(BuildContext context) {
    const pColor = Color.fromARGB(255, 27, 38, 44);
    const sColor = Color.fromARGB(255, 15, 76, 117);
    const tColor = Color.fromARGB(255, 50, 130, 184);
    const qColor = Color.fromARGB(255, 187, 225, 250);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tColor,
        centerTitle: true,
        title: Text(space.name),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: qColor,
        child: Column(
          children: [
            Image.network(
              space.imageURL,
              width: 360,
              height: 300,
              fit: BoxFit.none,
            ),
            Text(
              'Capacidade para ${space.capacity}',
              style: const TextStyle(fontSize: 21),
            ),
            Text(
              space.adress.street,
            ),
            Text(
              '${space.adress.district}, ${space.adress.number}',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: qColor,
          unselectedItemColor: qColor.withAlpha(100),
          backgroundColor: sColor,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_outlined,
                ),
                label: 'Reservas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Perfil'),
          ]),
    );
  }
}
