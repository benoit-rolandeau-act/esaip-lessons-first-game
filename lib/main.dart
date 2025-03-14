import 'package:flutter/material.dart';
import 'package:flutter_application_1/managers/global_manager.dart';
import 'package:flutter_application_1/ui/pages/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GlobalManager.instance.init();

  runApp(const MyApp());
}
