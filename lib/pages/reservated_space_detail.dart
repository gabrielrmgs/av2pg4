import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_de_reservas/models/reservation.dart';

import 'package:sistema_de_reservas/providers/reservated_spaces_provider.dart';
import 'package:sistema_de_reservas/providers/reservation_provider.dart';
import 'package:sistema_de_reservas/providers/user_provider.dart';

class ReservatedSpaceDetail extends ConsumerStatefulWidget {
  final Reservation reserv;

  const ReservatedSpaceDetail({
    super.key,
    required this.reserv,
  });

  @override
  ConsumerState<ReservatedSpaceDetail> createState() =>
      _ReservatedSpaceDetailState();
}

class _ReservatedSpaceDetailState extends ConsumerState<ReservatedSpaceDetail> {
  @override
  Widget build(BuildContext context) {
    const sColor = Color.fromARGB(255, 15, 76, 117);
    const tColor = Color.fromARGB(255, 50, 130, 184);
    const qColor = Color.fromARGB(255, 187, 225, 250);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: tColor,
        centerTitle: true,
        title: Text(widget.reserv.space.name),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: qColor,
        child: Column(
          children: [
            Image.network(
              widget.reserv.space.imageURL,
              width: 360,
              height: 300,
              fit: BoxFit.none,
            ),
            Text(
              'Capacidade para ${widget.reserv.space.capacity}',
              style: const TextStyle(fontSize: 21),
            ),
            Text(
              widget.reserv.space.adress.street,
            ),
            Text(
              '${widget.reserv.space.adress.district}, ${widget.reserv.space.adress.number}',
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
                        title: const Text('Cancelar Reserva'),
                        content: const SizedBox(
                          height: 300.0,
                          child: Column(
                            children: [
                              Text(
                                'Esta ação não poderá ser desfeita, deseja realmente cancelar a reserva?',
                                style: TextStyle(fontSize: 21),
                              )
                            ],
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.spaceBetween,
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Não')),
                          TextButton(
                              onPressed: () {
                                ref
                                    .read(
                                        reservationRepositoryProvider.notifier)
                                    .deleteReservation(widget.reserv);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: const Text('Sim')),
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
                'Cancelar reserva',
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
