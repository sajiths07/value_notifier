import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
import 'user_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => UserNotifier(User("ronaldo", 23)),
        child: MyHomePage(),

      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ValueNotifier Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<UserNotifier>(
              builder: (context, userNotifier, child) {
                return Text(
                  'Name: ${userNotifier.value.name}\nAge: ${userNotifier.value.age}',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                User newUser = User("ronaldo", 38);
                Provider.of<UserNotifier>(context, listen: false).updateUser(newUser);
              },
              child: Text("Update User"),
            ),

          ],
        ),
      ),
    );
  }
}
