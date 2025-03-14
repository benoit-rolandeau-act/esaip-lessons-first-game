import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/ui/pages/user_details_page/user_details_bloc.dart';
import 'package:flutter_application_1/ui/pages/user_details_page/user_details_event.dart';
import 'package:flutter_application_1/ui/pages/user_details_page/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailsPage extends StatelessWidget {
  final UserModel? user;

  const UserDetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider<UserDetailsBloc>(
      create: (context) => UserDetailsBloc(user: user),
      child: BlocConsumer<UserDetailsBloc, UserDetailsState>(
        listenWhen: (previous, current) => !previous.hasAnError && current.hasAnError,
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("(TR) An error occurred"),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<UserDetailsBloc>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                (state.user == null)
                    ? "(TR) New user"
                    : "${state.user!.firstName} ${state.user!.lastName}",
              ),
              backgroundColor: theme.colorScheme.inversePrimary,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "(TR) First name"),
                    initialValue: user?.firstName,
                    readOnly: state.loading,
                    onChanged: (value) => bloc.add(UserEditingEvent(firstName: value)),
                  ),
                  SizedBox(height: 16.h),
                  TextFormField(
                    decoration: InputDecoration(labelText: "(TR) Last name"),
                    readOnly: state.loading,
                    initialValue: user?.lastName,
                    onChanged: (value) => bloc.add(UserEditingEvent(lastName: value)),
                  ),
                  const Spacer(),
                  if (state.hasAnError)
                    Text(
                      "(TR) An error occurred",
                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error),
                    ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed:
                        state.loading
                            ? null
                            : () {
                              if (state.user == null || state.user!.id < 0) {
                                bloc.add(UserCreateEvent());
                              } else {
                                bloc.add(UserSaveEvent());
                              }
                            },
                    child: Text(
                      (state.user == null || state.user!.id < 0) ? "(TR) Create" : "(TR) Save",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
