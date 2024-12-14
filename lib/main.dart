import 'package:atw_ltd_task/domain/di/di.dart';
import 'package:atw_ltd_task/ui/screens/auth/log_in/logic/log_in_view_model.dart';
import 'package:atw_ltd_task/ui/screens/home/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atw_ltd_task/ui/screens/auth/log_in/presentation/log_in_view.dart';

void main() async {
  // Ensure Firebase is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print('Firebase Initialized Successfully');
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  configureDependencies(); // Initialize dependencies
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LoginViewModel>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ATW Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => LogInView(), // initial route
          '/home': (context) => const HomeView(), // define the /home route
        },
      ),
    );
  }
}
