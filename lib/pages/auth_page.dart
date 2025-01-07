import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sistema_de_reservas/pages/main_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    const pColor = Color.fromARGB(255, 27, 38, 44);
    const sColor = Color.fromARGB(255, 15, 76, 117);
    const tColor = Color.fromARGB(255, 50, 130, 184);
    const qColor = Color.fromARGB(255, 187, 225, 250);
    const categoriasReserva = [
      'Auditórios',
      'Salas',
      'Buffet\'s',
      'Apartamentos',
      'Casas'
    ];
    final categories = categoriasReserva.map(
      (name) => FadeAnimatedText(
        name,
        textStyle: const TextStyle(
          color: tColor,
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: qColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Reserv',
                style: TextStyle(
                    color: sColor, fontSize: 36, fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'APP',
                style: TextStyle(
                    color: pColor, fontSize: 36, fontWeight: FontWeight.bold))
          ])),
          SizedBox(
            height: 30,
            child: AnimatedTextKit(
                repeatForever: true, animatedTexts: categories.toList()),
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, bottom: 21),
            child: SizedBox(
              height: 333,
              width: 333,
              child: Lottie.asset('assets/pAnimation.json', fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 33, right: 33),
            child: TextFormField(
              decoration: const InputDecoration(
                  isDense: true,
                  labelStyle: TextStyle(color: pColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                      borderSide: BorderSide(color: sColor, width: 1.8)),
                  labelText: 'Usuário',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.0)))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 33, right: 33, top: 24, bottom: 39),
            child: TextFormField(
              decoration: const InputDecoration(
                  isDense: true,
                  labelStyle: TextStyle(color: pColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                      borderSide: BorderSide(color: sColor, width: 1.8)),
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)))),
            ),
          ),
          const Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Não possui uma conta? ',
                style: TextStyle(color: pColor)),
            TextSpan(
                text: 'Registre-se',
                style: TextStyle(color: tColor),
                spellOut: true)
          ])),
          ElevatedButton(
              iconAlignment: IconAlignment.end,
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(sColor)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ));
              },
              child: const SizedBox(
                width: 210,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(color: qColor, fontSize: 18),
                      ),
                      Icon(
                        Icons.login,
                        color: qColor,
                      )
                    ]),
              ))
        ],
      ),
    );
  }
}
