import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Space {
  final String id;
  final String name;
  final String imageURL;
  final bool active;
  final String capacity;
  Space({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.active,
    required this.capacity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageURL': imageURL,
      'active': active,
      'capacity': capacity,
    };
  }

  factory Space.fromMap(Map<String, dynamic> map) {
    return Space(
      id: map['id'] as String,
      name: map['name'] as String,
      imageURL: map['imageURL'] as String,
      active: map['active'] as bool,
      capacity: map['capacity'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Space.fromJson(String source) =>
      Space.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Space(id: $id, name: $name, imageURL: $imageURL, active: $active, capacity: $capacity)';
  }
}
