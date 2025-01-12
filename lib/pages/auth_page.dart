import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sistema_de_reservas/pages/main_page.dart';
import 'package:sistema_de_reservas/providers/space_provider.dart';
import 'package:sistema_de_reservas/services/auth_service.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
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

    final _authService = AuthService();

    TextEditingController textEditingControllerEmail = TextEditingController();
    TextEditingController textEditingControllerPassword =
        TextEditingController();

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
              controller: textEditingControllerEmail,
              decoration: const InputDecoration(
                  isDense: true,
                  labelStyle: TextStyle(color: pColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                      borderSide: BorderSide(color: sColor, width: 1.8)),
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33.0)))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 33, right: 33, top: 24, bottom: 39),
            child: TextFormField(
              controller: textEditingControllerPassword,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Não possui uma conta? ',
                style: TextStyle(color: pColor),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    )),
                child: const Text(
                  'Resgistre-se',
                  style: TextStyle(color: sColor),
                ),
              )
            ],
          ),
          ElevatedButton(
              iconAlignment: IconAlignment.end,
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(sColor)),
              onPressed: () async {
                await _authService.signIn(textEditingControllerEmail.text,
                    textEditingControllerPassword.text);
                ref.read(spaceRepositoryProvider.notifier).getSpaces();
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
