import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_app/screens/resume_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: ((context, child) => const ResumeScreen()),
        );
      },
    );
  }
}
