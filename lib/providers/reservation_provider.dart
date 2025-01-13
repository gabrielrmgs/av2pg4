import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_de_reservas/models/reservation.dart';
import 'package:http/http.dart' as http;

final reservationRepositoryProvider =
    StateNotifierProvider<ReservationProvider, List<Reservation>>(
  (ref) => ReservationProvider(),
);

final reservationListProvider = Provider(
  (ref) {
    final List<Reservation> reservations =
        ref.watch(reservationRepositoryProvider);

    return reservations;
  },
);

class ReservationProvider extends StateNotifier<List<Reservation>> {
  ReservationProvider() : super([]);
  final String urlApi = 'https://reserv-app-77552-default-rtdb.firebaseio.com';

  Future<void> newReservation(Reservation reservation) async {
    final url = Uri.parse('$urlApi/reservations.json');
    await http.post(url, body: reservation.toJson());
    state.add(reservation);
  }

  Future<void> deleteReservation(Reservation reserv) async {
    final url = Uri.parse('$urlApi/reservations/${reserv.id}.json');
    await http.delete(url);
    state.remove(reserv);
  }

  getReservationsByUserId(String userId) async {
    state.clear();
    final url = Uri.parse(
        '$urlApi/reservations.json?orderBy="userId"&equalTo="$userId"');

    final response = await http.get(url);

    final Map data = jsonDecode(response.body);
    data.forEach(
      (key, value) {
        value['id'] = key;
        state = [...state, Reservation.fromMap(value)];
      },
    );
  }
}
