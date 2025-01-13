import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_de_reservas/models/reservation.dart';
import 'package:sistema_de_reservas/models/space.dart';
import 'package:sistema_de_reservas/pages/reservated_space_detail.dart';
import 'package:sistema_de_reservas/pages/space_detail.dart';
import 'package:sistema_de_reservas/providers/reservation_provider.dart';
import 'package:sistema_de_reservas/providers/space_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    const pColor = Color.fromARGB(255, 27, 38, 44);
    const sColor = Color.fromARGB(255, 15, 76, 117);
    const qColor = Color.fromARGB(255, 187, 225, 250);
    final pageController = PageController(initialPage: pageIndex);
    List<Space> spaces = ref.watch(spaceListProvider);
    List<Reservation> reservations = ref.watch(reservationListProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: qColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text.rich(TextSpan(children: [
          TextSpan(
              text: 'Reserv',
              style: TextStyle(
                  color: sColor, fontSize: 36, fontWeight: FontWeight.bold)),
          TextSpan(
              text: 'APP',
              style: TextStyle(
                  color: pColor, fontSize: 36, fontWeight: FontWeight.bold))
        ])),
      ),
      body: PageView(
        onPageChanged: (index) {
          onPageChange(index);
        },
        controller: pageController,
        children: [
          Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11,
                  ),
                  itemCount: spaces.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SpaceDetail(space: spaces[index]),
                            ));
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Image.network(
                              spaces[index].imageURL,
                              width: 150,
                              height: 110,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Column(
                                children: [
                                  Text(
                                    spaces[index].name,
                                    style: const TextStyle(
                                        fontSize: 18, color: pColor),
                                  ),
                                  const Text(
                                    '3 Horários vagos hoje',
                                    style: TextStyle(color: sColor),
                                  ),
                                  Text(
                                    spaces[index].capacity,
                                    style: const TextStyle(color: sColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            color: pColor,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11,
                    ),
                    itemCount: reservations.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReservatedSpaceDetail(
                                    reserv: reservations[index]),
                              ));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(
                                reservations[index].space.imageURL,
                                width: 150,
                                height: 110,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      reservations[index].space.name,
                                      style: const TextStyle(
                                          fontSize: 18, color: pColor),
                                    ),
                                    const Text(
                                      '3 Horários vagos hoje',
                                      style: TextStyle(color: sColor),
                                    ),
                                    Text(
                                      reservations[index].space.capacity,
                                      style: const TextStyle(color: sColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: sColor,
          ),
        ],
      ),
      backgroundColor: qColor,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: qColor,
          unselectedItemColor: qColor.withAlpha(100),
          backgroundColor: sColor,
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
              pageController.jumpToPage(pageIndex);
            });
          },
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

  onPageChange(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
