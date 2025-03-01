import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/Splash/splashScreen.dart';

class crudAppAssignment extends StatelessWidget {
  const crudAppAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
