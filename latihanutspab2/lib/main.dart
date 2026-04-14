import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:latihanutspab2/screens/home_screen.dart';
// Wajib import file ini (file ini otomatis terbuat saat Anda setup Firebase CLI)
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ini kunci utamanya! Harus menyertakan options.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      title: "latihan",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
