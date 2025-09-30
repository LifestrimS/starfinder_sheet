import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/database/database.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

class DIContainer {
  static Future<void> init() async {
    final db = AppDb();

    registerNew<AppDb>(db);
    registerNew<Repository>(Repository(GetIt.I.get()));
    //await theme.initTheme();
  }
}

T shared<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) =>
    GetIt.I.get<T>(
      instanceName: instanceName,
      param1: param1,
      param2: param2,
    );

registerNew<T extends Object>(T instance) async {
  final getIt = GetIt.I;
  if (getIt.isRegistered<T>()) {
    getIt.unregister<T>();
  }
  getIt.registerSingleton<T>(instance);
}
