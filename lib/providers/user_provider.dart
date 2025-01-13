import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_de_reservas/models/user.dart';
import 'package:sistema_de_reservas/models/user_credentials.dart';

final userProvider = NotifierProvider<UserProvider, User>(UserProvider.new);

class UserProvider extends Notifier<User> {
  late User _user;

  @override
  User build() => User(
        id: '',
        name: 'name',
        email: 'email',
        age: 1,
        credentials: UserCredentials(
            token: 'token', refreshToken: 'refreshToken', expiresIn: 1),
      );

  User get user => _user;

  Future<void> setUserInfo(User user) async {
    state = user;
  }
}
