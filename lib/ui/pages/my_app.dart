import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/ui/pages/my_home_page.dart';
import 'package:flutter_application_1/ui/pages/settings_page.dart';
import 'package:flutter_application_1/ui/pages/user_details_page/user_details_page.dart';
import 'package:flutter_application_1/ui/pages/users_page/users_page_ui.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(412, 892),
    minTextAdapt: true,
    splitScreenMode: true,
    builder:
        (_, child) => MaterialApp(
          onGenerateTitle: (context) => Tr.of(context).appTitle,
          localizationsDelegates: [
            Tr.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Tr.delegate.supportedLocales,
          themeMode: isChecked ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            fontFamily: "Roboto",
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            fontFamily: "Roboto",
          ),
          routes: {
            '/': (context) => MyHomePage(title: Tr.of(context).appTitle),
            '/settings':
                (context) => SettingsPage(
                  isChecked: isChecked,
                  onChanged: (value) => setState(() => isChecked = value),
                ),
            '/users': (context) => const UsersPage(),
            '/user-details': (context) {
              final userModel = ModalRoute.of(context)!.settings.arguments as UserModel?;
              return UserDetailsPage(user: userModel);
            },
          },
        ),
  );
}
