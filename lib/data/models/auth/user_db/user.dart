
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 2, adapterName: "UserAdapter")
class Users extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String surname;
  @HiveField(2)
  final String phone;

  Users({ required this.name, required this.surname,required this.phone});
}

