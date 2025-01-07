import 'package:flutter/material.dart';
import 'package:sistema_de_reservas/pages/auth_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    const pColor = Color.fromARGB(255, 27, 38, 44);
    const sColor = Color.fromARGB(255, 15, 76, 117);
    const tColor = Color.fromARGB(255, 50, 130, 184);
    const qColor = Color.fromARGB(255, 187, 225, 250);
    final pageController = PageController(initialPage: pageIndex);
    return Scaffold(
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
      body: PageView(
        children: [
          Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Reserv',
                        style: TextStyle(
                            color: sColor,
                            fontSize: 36,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'APP',
                        style: TextStyle(
                            color: pColor,
                            fontSize: 36,
                            fontWeight: FontWeight.bold))
                  ])),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()));
                      },
                      child: const Icon(Icons.abc_sharp))
                ],
              )),
          Container(
            color: pColor,
          ),
          Container(
            color: sColor,
          ),
        ],
      ),
    );
  }
}
