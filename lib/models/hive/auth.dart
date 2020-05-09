import 'package:hive/hive.dart';
part 'auth.g.dart';

@HiveType()
class Auth {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String roles;

  @HiveField(4)
  String username;

  @HiveField(5)
  String emailVerifiedAt;

  Auth(this.id, this.name, this.email, this.roles, this.username, this.emailVerifiedAt);
}