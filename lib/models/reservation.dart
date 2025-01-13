// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:sistema_de_reservas/models/space.dart';

class Reservation {
  final String id;
  final String spaceId;
  final String userId;
  final DateTime initialDate;
  final DateTime finalDate;
  final Space space;
  Reservation({
    required this.id,
    required this.spaceId,
    required this.userId,
    required this.initialDate,
    required this.finalDate,
    required this.space,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'spaceId': spaceId,
      'userId': userId,
      'initialDate': initialDate.millisecondsSinceEpoch,
      'finalDate': finalDate.millisecondsSinceEpoch,
      'space': space.toMap(),
    };
  }

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      id: map['id'] as String,
      spaceId: map['spaceId'] as String,
      userId: map['userId'] as String,
      initialDate:
          DateTime.fromMillisecondsSinceEpoch(map['initialDate'] as int),
      finalDate: DateTime.fromMillisecondsSinceEpoch(map['finalDate'] as int),
      space: Space.fromMap(map['space'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Reservation.fromJson(String source) =>
      Reservation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reservation(id: $id, spaceId: $spaceId, userId: $userId, initialDate: $initialDate, finalDate: $finalDate, space: $space)';
  }
}
