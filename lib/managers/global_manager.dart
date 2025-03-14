import 'package:flutter_application_1/managers/abstract_manager.dart';
import 'package:flutter_application_1/managers/users_manager.dart';

class GlobalManager extends AbstractManager {
  static GlobalManager? _instance;

  static GlobalManager get instance {
    _instance ??= GlobalManager();
    return _instance!;
  }

  late final UsersManager usersManager;

  @override
  Future<void> init() async {
    print("GlobalManager init");
    usersManager = UsersManager();
    await usersManager.init();
  }

  @override
  Future<void> dispose() async {
    print("GlobalManager dispose");
    await usersManager.dispose();
  }
}
