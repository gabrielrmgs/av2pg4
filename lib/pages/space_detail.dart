import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sistema_de_reservas/models/reservation.dart';
import 'package:sistema_de_reservas/models/space.dart';
import 'package:sistema_de_reservas/providers/reservated_spaces_provider.dart';
import 'package:sistema_de_reservas/providers/reservation_provider.dart';
import 'package:sistema_de_reservas/providers/user_provider.dart';

class SpaceDetail extends ConsumerStatefulWidget {
  final Space space;

  const SpaceDetail({
    super.key,
    required this.space,
  });

  @override
  ConsumerState<SpaceDetail> createState() => _SpaceDetailState();
}

class _SpaceDetailState extends ConsumerState<SpaceDetail> {
  final provider = ReservationProvider();

  @override
  Widget build(BuildContext context) {
    const sColor = Color.fromARGB(255, 15, 76, 117);
    const tColor = Color.fromARGB(255, 50, 130, 184);
    const qColor = Color.fromARGB(255, 187, 225, 250);

    TextEditingController textEditingControllerDate = TextEditingController();
    TextEditingController textEditingControllerHourStart =
        TextEditingController();
    TextEditingController textEditingControllerHourEnd =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tColor,
        centerTitle: true,
        title: Text(widget.space.name),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: qColor,
        child: Column(
          children: [
            Image.network(
              widget.space.imageURL,
              width: 360,
              height: 300,
              fit: BoxFit.none,
            ),
            Text(
              'Capacidade para ${widget.space.capacity}',
              style: const TextStyle(fontSize: 21),
            ),
            Text(
              widget.space.adress.street,
            ),
            Text(
              '${widget.space.adress.district}, ${widget.space.adress.number}',
            ),
            Text(
              'id: ${ref.watch(userProvider).id} nome: ${ref.watch(userProvider).name}',
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(tColor)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                      builder: (context, setState) => AlertDialog(
                        title: const Text('Nova Reserva'),
                        content: SizedBox(
                          height: 300.0,
                          child: Column(
                            children: [
                              TextField(
                                controller: textEditingControllerDate,
                                decoration: const InputDecoration(
                                  labelText: 'Data',
                                ),
                                inputFormatters: [
                                  MaskTextInputFormatter(mask: '##/##/####')
                                ],
                              ),
                              TextField(
                                controller: textEditingControllerHourStart,
                                decoration: const InputDecoration(
                                  labelText: 'Hora início',
                                ),
                                inputFormatters: [
                                  MaskTextInputFormatter.eager(mask: '##:##:##')
                                ],
                              ),
                              TextField(
                                controller: textEditingControllerHourEnd,
                                decoration: const InputDecoration(
                                  labelText: 'Hora final',
                                ),
                                inputFormatters: [
                                  MaskTextInputFormatter.eager(
                                      mask: '##:##:##'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        actions: [
                          TextButton(
                              onPressed: () {
                                textEditingControllerDate.clear();
                                textEditingControllerHourStart.clear();
                                textEditingControllerHourEnd.clear();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar')),
                          TextButton(
                              onPressed: () {
                                /* DateFormat inputFormat =
                                    DateFormat('dd/MM/yyyy hh:mm:ss'); */

                                textEditingControllerDate.text =
                                    textEditingControllerDate.text
                                        .split('/')
                                        .reversed
                                        .join();

                                /* textEditingControllerDate.text
                                    .replaceAll(RegExp(r'/'), ''); */
                                if (textEditingControllerHourStart
                                    .text.isNotEmpty) {
                                  Reservation newReservation = Reservation(
                                      id: DateTime.now().toString(),
                                      spaceId: widget.space.id,
                                      userId: ref.watch(userProvider).id,
                                      initialDate: DateTime.parse(
                                          '${textEditingControllerDate.text} ${textEditingControllerHourStart.text}'),
                                      finalDate: DateTime.parse(
                                          '${textEditingControllerDate.text} ${textEditingControllerHourEnd.text}'),
                                      space: widget.space);
                                  /* setState(
                                  () { */
                                  ref
                                      .read(reservationRepositoryProvider
                                          .notifier)
                                      .newReservation(newReservation);
                                  /* ref
                                      .watch(reservatedSpaceRepositoryProvider
                                          .notifier)
                                      .getSpaceByUserId(
                                          ref.watch(userProvider).id); */
                                  /* },
                                ); */
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Reserva feita com sucesso!'),
                                    duration: Duration(seconds: 3),
                                    showCloseIcon: true,
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                }
                                textEditingControllerDate.clear();
                                textEditingControllerHourStart.clear();
                                textEditingControllerHourEnd.clear();
                              },
                              child: const Text('Salvar')),
                        ],
                      ),
                    );
                  },
                );

                ref
                    .read(reservatedSpaceRepositoryProvider.notifier)
                    .getSpaceByUserId(ref.watch(userProvider).id);
              },
              child: const Text(
                'Faça sua reserva!',
                style: TextStyle(color: qColor),
              ),
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
