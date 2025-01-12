import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sistema_de_reservas/pages/auth_page.dart';
import 'package:sistema_de_reservas/pages/main_page.dart';
import 'package:sistema_de_reservas/providers/space_provider.dart';
import 'package:sistema_de_reservas/services/auth_service.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
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
    TextEditingController textEditingControllerName = TextEditingController();
    TextEditingController textEditingControllerAge = TextEditingController();

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
      appBar: AppBar(
          toolbarHeight: 69,
          centerTitle: true,
          backgroundColor: qColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(
                  height: 30,
                  child: AnimatedTextKit(
                      repeatForever: true, animatedTexts: categories.toList()),
                ),
              ])),
      backgroundColor: qColor,
      body: Column(
        children: [
          Lottie.asset(
            'assets/Pay Per Click Digital Marketing.json',
            height: 300,
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
                const EdgeInsets.only(left: 33, right: 33, top: 21, bottom: 21),
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
          Padding(
            padding: const EdgeInsets.only(left: 33, right: 33),
            child: TextFormField(
              controller: textEditingControllerName,
              decoration: const InputDecoration(
                  isDense: true,
                  labelStyle: TextStyle(color: pColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                      borderSide: BorderSide(color: sColor, width: 1.8)),
                  labelText: 'Nome',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 33, right: 33, top: 21, bottom: 12),
            child: TextFormField(
              controller: textEditingControllerAge,
              decoration: const InputDecoration(
                  isDense: true,
                  labelStyle: TextStyle(color: pColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)),
                      borderSide: BorderSide(color: sColor, width: 1.8)),
                  labelText: 'Idade',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(33)))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Já possui uma conta? ',
                style: TextStyle(color: pColor),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    )),
                child: const Text(
                  'Entre',
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
                if (await _authService.signUp(
                        email: textEditingControllerEmail.text,
                        password: textEditingControllerPassword.text,
                        name: textEditingControllerName.text,
                        age: int.parse(textEditingControllerAge.text)) ==
                    null) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Não foi possível realizar o cadastro!'),
                      duration: Duration(seconds: 2),
                      showCloseIcon: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      behavior: SnackBarBehavior.floating,
                      hitTestBehavior: HitTestBehavior.opaque,
                    ));
                  }
                  return;
                }
                if (context.mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthPage(),
                      ));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Cadastro realizado com sucesso!'),
                    duration: Duration(seconds: 2),
                    showCloseIcon: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    behavior: SnackBarBehavior.floating,
                    hitTestBehavior: HitTestBehavior.opaque,
                  ));
                }
              },
              child: const SizedBox(
                width: 210,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Cadastrar',
                        style: TextStyle(color: qColor, fontSize: 18),
                      ),
                      Icon(
                        Icons.account_box_outlined,
                        color: qColor,
                      )
                    ]),
              ))
        ],
      ),
    );
  }
}
