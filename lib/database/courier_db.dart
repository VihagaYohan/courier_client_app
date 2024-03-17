import 'package:sqflite/sqflite.dart';
import 'package:courier_client_app/services/database_service.dart';

// models
import 'package:courier_client_app/models/UserInfo.dart';

class CourierDB {
  final tableName = 'user';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL, 
      "name" TEXT NOT NULL,
      "address" TEXT NULL,
      "phoneNumber" TEXT NULL,
      "email" TEXT NOT NULL,
      "photoUrl" TEXT NULL,
      PRIMARY KEY("id" AUTOINCREMENT)
    )""");
  }

  Future<int> create(
      {required String name,
      required String address,
      required String phoneNumber,
      required String email,
      String? photoUrl}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
        '''INSERT INTO $tableName (name, address, phoneNumber, email, photoUrl) VALUES (?,?)''',
        [name, address, phoneNumber, email, photoUrl]);
  }

  Future<List<UserInfo>> getCurrentUser() async {
    final database = await DatabaseService().database;
    final userList = await database.rawQuery('''SELECT * from $tableName''');
    print('from service');
    print(userList);
    return userList.map((item) => UserInfo.fromSqlfliteDatabase(item)).toList();
  }

  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''DELETE FROM $tableName WHERE id = ?''', [id]);
  }
}
