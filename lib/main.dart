import 'package:flutter/material.dart';
import 'package:login_app/Presentation/Pages/Login/login_page.dart';
import 'package:login_app/Presentation/Pages/Login/login_viewmodel.dart';
import 'package:login_app/Presentation/Pages/Register/register_page.dart';
import 'package:login_app/Presentation/Pages/Register/register_viewmodel.dart';
import 'package:login_app/Presentation/Pages/home/home_page.dart';
import 'package:login_app/Presentation/Pages/home/home_viewmodel.dart';
import 'package:login_app/domain/uses_cases/auth/auth_usecase.dart';
import 'package:login_app/injection.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //Initialize Firebase services
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => LoginViewModel(locator<AuthUseCases>())),
       ChangeNotifierProvider(create: (context) => RegisterViewModel(locator<AuthUseCases>())),
       ChangeNotifierProvider(create: (context) => HomeViewModel(locator<AuthUseCases>())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => const LoginPage(),
          'register':(BuildContext context) => const RegisterPage(),
          'Home': (BuildContext context) => const HomePage()
        },
      ),
    );
  }
}
