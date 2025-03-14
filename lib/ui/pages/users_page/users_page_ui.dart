import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/ui/pages/users_page/users_bloc.dart';
import 'package:flutter_application_1/ui/pages/users_page/users_event.dart';
import 'package:flutter_application_1/ui/pages/users_page/users_state.dart';
import 'package:flutter_application_1/ui/widgets/user_line.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider<UsersBloc>(
      create: (context) => UsersBloc(),
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<UsersBloc>(context);
          return Scaffold(
            appBar: AppBar(title: Text("Users"), backgroundColor: theme.colorScheme.inversePrimary),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child:
                  state.loading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                        separatorBuilder: (_, __) => Divider(height: 1.h, thickness: 1.h),
                        itemCount: state.users!.length,
                        itemBuilder:
                            (context, index) => UserLine(
                              user: state.users![index],
                              onPressed:
                                  () => Navigator.of(
                                    context,
                                  ).pushNamed("/user-details", arguments: state.users![index]),
                              onDelete:
                                  () => bloc.add(UsersDeleteUserEvent(state.users![index].id)),
                            ),
                      ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed:
                  state.loading
                      ? null
                      : () => Navigator.of(context).pushNamed("/user-details", arguments: null),
              tooltip: '(TR) Create new user',
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
