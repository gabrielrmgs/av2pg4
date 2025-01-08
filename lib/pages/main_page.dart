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
      body: PageView(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 24.0, left: 9, right: 9, bottom: 12),
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
                        style: const ButtonStyle(
                            fixedSize:
                                WidgetStatePropertyAll(Size.fromWidth(270)),
                            elevation: WidgetStatePropertyAll(3)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthPage()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Pesquisar...'),
                            Icon(Icons.search_outlined),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 270,
                              width: 180,
                              child: Card(
                                elevation: 2.4,
                                surfaceTintColor: qColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https://images.pexels.com/photos/11815444/pexels-photo-11815444.jpeg?auto=compress&cs=tinysrgb&w=600',
                                        width: 150,
                                        height: 110,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Audório da UESPI',
                                              style: TextStyle(
                                                  fontSize: 18, color: pColor),
                                            ),
                                            Text(
                                              '3 Horários vagos hoje',
                                              style: TextStyle(color: sColor),
                                            ),
                                            Text(
                                              '120 pessoas',
                                              style: TextStyle(color: sColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 270,
                              width: 180,
                              child: Card(
                                elevation: 2.4,
                                surfaceTintColor: qColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https://images.pexels.com/photos/159213/hall-congress-architecture-building-159213.jpeg?auto=compress&cs=tinysrgb&w=600',
                                        width: 150,
                                        height: 110,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Salão de reuniões',
                                              style: TextStyle(
                                                  fontSize: 18, color: pColor),
                                            ),
                                            Text(
                                              '1 Horário vago hoje',
                                              style: TextStyle(color: sColor),
                                            ),
                                            Text(
                                              '60 pessoas',
                                              style: TextStyle(color: sColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 270,
                              width: 180,
                              child: Card(
                                elevation: 2.4,
                                surfaceTintColor: qColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https://images.pexels.com/photos/11815444/pexels-photo-11815444.jpeg?auto=compress&cs=tinysrgb&w=600',
                                        width: 150,
                                        height: 110,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Audório da UESPI',
                                              style: TextStyle(
                                                  fontSize: 18, color: pColor),
                                            ),
                                            Text(
                                              '3 Horários vagos hoje',
                                              style: TextStyle(color: sColor),
                                            ),
                                            Text(
                                              '120 pessoas',
                                              style: TextStyle(color: sColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 270,
                              width: 180,
                              child: Card(
                                elevation: 2.4,
                                surfaceTintColor: qColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https://images.pexels.com/photos/159213/hall-congress-architecture-building-159213.jpeg?auto=compress&cs=tinysrgb&w=600',
                                        width: 150,
                                        height: 110,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Salão de reuniões',
                                              style: TextStyle(
                                                  fontSize: 18, color: pColor),
                                            ),
                                            Text(
                                              '1 Horário vago hoje',
                                              style: TextStyle(color: sColor),
                                            ),
                                            Text(
                                              '60 pessoas',
                                              style: TextStyle(color: sColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 270,
                              width: 180,
                              child: Card(
                                elevation: 2.4,
                                surfaceTintColor: qColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https://images.pexels.com/photos/11815444/pexels-photo-11815444.jpeg?auto=compress&cs=tinysrgb&w=600',
                                        width: 150,
                                        height: 110,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Audório da UESPI',
                                              style: TextStyle(
                                                  fontSize: 18, color: pColor),
                                            ),
                                            Text(
                                              '3 Horários vagos hoje',
                                              style: TextStyle(color: sColor),
                                            ),
                                            Text(
                                              '120 pessoas',
                                              style: TextStyle(color: sColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 270,
                              width: 180,
                              child: Card(
                                elevation: 2.4,
                                surfaceTintColor: qColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 9),
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https://images.pexels.com/photos/159213/hall-congress-architecture-building-159213.jpeg?auto=compress&cs=tinysrgb&w=600',
                                        width: 150,
                                        height: 110,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Salão de reuniões',
                                              style: TextStyle(
                                                  fontSize: 18, color: pColor),
                                            ),
                                            Text(
                                              '1 Horário vago hoje',
                                              style: TextStyle(color: sColor),
                                            ),
                                            Text(
                                              '60 pessoas',
                                              style: TextStyle(color: sColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              )),
          Container(
            color: pColor,
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
}
