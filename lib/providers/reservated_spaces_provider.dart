import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_de_reservas/models/space.dart';
import 'package:http/http.dart' as http;

final reservatedSpaceRepositoryProvider =
    StateNotifierProvider<ReservatedSpacesProvider, List<Space>>(
  (ref) => ReservatedSpacesProvider(),
);
final reservatedSpaceListProvider = Provider(
  (ref) {
    final List<Space> spaces = ref.watch(reservatedSpaceRepositoryProvider);
    return spaces
        .where(
          (space) => space.active,
        )
        .toList();
  },
);

class ReservatedSpacesProvider extends StateNotifier<List<Space>> {
  ReservatedSpacesProvider() : super([]);

  final String url = 'https://reserv-app-77552-default-rtdb.firebaseio.com/';

  getSpaces() async {
    state.clear();
    final response = await http.get(Uri.parse('${url}spaces.json'));
    final Map data = jsonDecode(response.body);
    data.forEach(
      (key, value) {
        state = [...state, Space.fromMap(value)];
      },
    );
  }

  getSpaceById(String spaceId) async {
    final response = await http.get(Uri.parse('${url}spaces/$spaceId.json'));
    final Map data = jsonDecode(response.body);
    state = [
      ...state,
      Space(
          id: data['id'],
          name: data['name'],
          imageURL: data['imageURL'],
          active: data['active'],
          capacity: data['capacity'],
          contact: Contact.fromMap(data['contact']),
          adress: Adress.fromMap(data['adress']))
    ];
  }

  Future<void> getSpaceByUserId(String userId) async {
    state.clear();
    final uri =
        Uri.parse('$url/reservations.json?orderBy="userId"&equalTo="$userId"');

    final response = await http.get(uri);

    final Map data = jsonDecode(response.body);

    data.forEach(
      (key, value) {
        getSpaceById(value['spaceId']);
      },
    );
  }
}
