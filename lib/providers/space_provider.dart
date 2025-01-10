import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_de_reservas/models/space.dart';
import 'package:http/http.dart' as http;

final spaceRepositoryProvider =
    StateNotifierProvider<SpaceProvider, List<Space>>(
  (ref) => SpaceProvider(),
);
final spaceListProvider = Provider(
  (ref) {
    final List<Space> spaces = ref.watch(spaceRepositoryProvider);
    return spaces
        .where(
          (space) => space.active,
        )
        .toList();
  },
);

class SpaceProvider extends StateNotifier<List<Space>> {
  SpaceProvider() : super([]);

  final String url = 'https://reserv-app-77552-default-rtdb.firebaseio.com/';

  getSpaces() async {
    final response = await http.get(Uri.parse('${url}spaces.json'));
    final Map data = jsonDecode(response.body);
    data.forEach(
      (key, value) {
        state = [...state, Space.fromMap(value)];
      },
    );
  }
}
