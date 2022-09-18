import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_bloc.dart';
import 'package:kurdwork/bloc/authentication_bloc/auth_event.dart';
import '../routes/signin.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(right: 15.0, left: 15),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(CupertinoIcons.back),
                      ),
                    ),
                    const VerticalDivider(),
                    Text("Settings",
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
              ),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text("Account Settings"),
            ),
            GestureDetector(
              onTap: () {
                try {
                  BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
                } catch (e) {
                  const SnackBar(content: Text("an error occured"));
                }
              },
              child: const ListTile(
                leading: Icon(Icons.logout_rounded),
                title: Text("Sign Out"),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
