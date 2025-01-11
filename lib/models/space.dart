import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Space {
  final String id;
  final String name;
  final String imageURL;
  final bool active;
  final String capacity;
  final Contact contact;
  final Adress adress;
  Space({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.active,
    required this.capacity,
    required this.contact,
    required this.adress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imageURL': imageURL,
      'active': active,
      'capacity': capacity,
      'contact': contact.toMap(),
      'adress': adress.toMap(),
    };
  }

  factory Space.fromMap(Map<String, dynamic> map) {
    return Space(
      id: map['id'] as String,
      name: map['name'] as String,
      imageURL: map['imageURL'] as String,
      active: map['active'] as bool,
      capacity: map['capacity'] as String,
      contact: Contact.fromMap(map['contact'] as Map<String, dynamic>),
      adress: Adress.fromMap(map['adress'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Space.fromJson(String source) =>
      Space.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Contact {
  final String email;
  final String telephone;
  Contact({
    required this.email,
    required this.telephone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'telephone': telephone,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      email: map['email'] as String,
      telephone: map['telephone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Adress {
  final String street;
  final String district;
  final int number;
  Adress({
    required this.street,
    required this.district,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'district': district,
      'number': number,
    };
  }

  factory Adress.fromMap(Map<String, dynamic> map) {
    return Adress(
      street: map['street'] as String,
      district: map['district'] as String,
      number: map['number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Adress.fromJson(String source) =>
      Adress.fromMap(json.decode(source) as Map<String, dynamic>);
}
