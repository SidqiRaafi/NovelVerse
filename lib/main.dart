import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:novelverse/screens/auth/welcome_page.dart';
import 'firebase_options.dart';
import 'dart:io'; // Penting untuk file gambar
import 'models/user.dart'; // Import model user kamu

// --- VARIABEL GLOBAL (Agar data tidak reset) ---
UserModel? loggedInUser;
File? globalProfileImage;
File? globalCoverImage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NovelVerse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1A1A2E),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.light,
      ),
      home: const WelcomePage(),
    );
  }
}
