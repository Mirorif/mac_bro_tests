import 'package:hive/hive.dart';
import 'package:mac_bro_test/data/models/auth/user_db/user.dart';

import '../../../../core/constants/app_keys.dart';

class UserDatabase {
  static Box<Users>? boxUser;
  static UserDatabase instance = UserDatabase._();

  UserDatabase._();

  static Future<UserDatabase> getInstance() async {
    boxUser ??= await Hive.openBox<Users>(AppKeys.userDb);
    return instance;
  }


  Future<void> addUser(Users users) async {
    await boxUser?.put(AppKeys.profile, users);
  }

  Future<void> deleteUser() async {
    await boxUser?.clear();
  }

}
