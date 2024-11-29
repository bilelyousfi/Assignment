import 'package:flutter/material.dart';
import 'package:mobileapp/viewmodels/auth_view_model.dart';
import 'package:mobileapp/viewmodels/event_card_view_model.dart';
import 'package:mobileapp/views/auth_screen.dart';
import 'package:mobileapp/views/events_screen.dart';

import 'package:provider/provider.dart';
import 'viewmodels/events_view_model.dart';
import 'package:firebase_core/firebase_core.dart';




/*void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EventsViewModel()),
          ChangeNotifierProvider(create: (_) => EventCardViewModel()),
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => EventsViewModel()),
          ChangeNotifierProvider(create: (_) => EventCardViewModel()),
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ],
        child: const MyApp(),
      ),
    );

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventsScreen(),
    );
  }
}