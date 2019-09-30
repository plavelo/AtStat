import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../data/repository/client/get_user.dart';
import 'user_bloc.dart';
import 'user_event.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc bloc = Provider.of<UserBloc>(context);
    return _build(bloc);
  }

  Widget _build(UserBloc bloc) {
    return StreamBuilder<User>(
      stream: bloc.user,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        final User user = snapshot.data;

        return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (String userId) => bloc.eventSink.add(UserSearchEvent(userId)),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name',
                ),
              ),
              if (user != null)
                ...<Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'AC',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          user.acceptedCount.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Points',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          user.ratedPointSum.toString(),
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            ],
          ),
        );
      },
    );
  }
}
