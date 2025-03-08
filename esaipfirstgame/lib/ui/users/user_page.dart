import 'package:esaipfirstgame/ui/users/user_bloc.dart';
import 'package:esaipfirstgame/ui/users/user_events.dart';
import 'package:esaipfirstgame/ui/users/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("(TR) Users page"),
      ),
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
        child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          final bloc = BlocProvider.of<UserBloc>(context);

          return Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: state.isGreen ? Colors.green : null,
              ),
              onPressed: () => bloc.add(ButtonClickEvent(
                isGreen: !state.isGreen,
              )),
              child: Text("Tap me"),
            ),
          );
        }),
      ),
    );
  }
}
