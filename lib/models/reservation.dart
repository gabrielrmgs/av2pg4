// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sistema_de_reservas/models/space.dart';
import 'package:sistema_de_reservas/models/user.dart';

class Reservation {
  final String id;
  final Space space;
  final User user;
  Reservation({
    required this.id,
    required this.space,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'space': space.toMap(),
      'user': user.toMap(),
    };
  }

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      id: map['id'] as String,
      space: Space.fromMap(map['space'] as Map<String, dynamic>),
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Reservation.fromJson(String source) =>
      Reservation.fromMap(json.decode(source) as Map<String, dynamic>);
}
