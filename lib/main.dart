import 'package:atstat/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/view/user_bloc.dart';
import 'presentation/view/user_view.dart';

void main() => runApp(Main());

final UserRepository _userRepository = UserRepository();

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Provider<UserBloc>(
          builder: (BuildContext context) => UserBloc(_userRepository),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('User Finder'),
            ),
            body: UserView(),
          ),
        ),
      },
    );
  }
}
