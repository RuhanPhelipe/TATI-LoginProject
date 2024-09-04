import 'package:flutter/material.dart';
import 'common/routes/routes.dart';
import 'common/theme/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Aula',
      theme: myTheme,
      routerConfig: routers,
    );
  }
}
