import 'package:flutter_challenge/domain/model/simpson_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDataBase {
  late Future<Isar> db;

  IsarDataBase() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationCacheDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([SimpsonModelSchema],
          inspector: true, directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> saveData({required List<SimpsonModel> simpsons}) async {
    final isar = await db;

    /// insert
    await isar.writeTxn(() => isar.simpsonModels.putAll(simpsons));
  }

  Future<List<SimpsonModel>> loadData() async {
    final isar = await db;

    return isar.simpsonModels.where().findAll();
  }
}
