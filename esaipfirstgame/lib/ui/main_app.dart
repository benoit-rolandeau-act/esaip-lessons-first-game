import 'package:esaipfirstgame/generated/l10n.dart';
import 'package:esaipfirstgame/ui/my_home_page.dart';
import 'package:esaipfirstgame/ui/settings_page.dart';
import 'package:esaipfirstgame/ui/users/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MainApp> {
  Brightness _current = Brightness.light;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => Tr.of(context).appTitle,
      localizationsDelegates: const [
        Tr.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Tr.delegate.supportedLocales,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: _current,
        ),
        brightness: _current,
        useMaterial3: true,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => MyHomePage(
              title: 'Flutter Demo Home Page',
            ),
        "settings": (context) => SettingsPage(
              currentSwitchValue: _current == Brightness.dark,
              onChanged: (value) {
                setState(() {
                  if (value) {
                    _current = Brightness.dark;
                  } else {
                    _current = Brightness.light;
                  }
                });
              },
            ),
        "users": (context) => UserPage(),
      },
    );
  }
}
