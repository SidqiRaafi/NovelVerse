import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF4A148C),  // Darker purple
              Color(0xFF1A0033),  // Almost black purple
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const Spacer(flex: 2),
                
                // App Icon
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.menu_book_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                
                const SizedBox(height: 32),  // Reduced from 40
                
                // Title
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white60,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'NovelVerse',
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 12),  // Reduced from 16
                
                // Subtitle
                const Text(
                  'Discover amazing stories and novels\nfrom around the world',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white60,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const Spacer(flex: 2),  // Reduced from 3
                
                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF4A148C),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 14),  // Reduced from 16
                
                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                
                const Spacer(flex: 1),
                
                // Footer
                const Text(
                  'By continuing, you agree to our Terms of Service and Privacy Policy',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white38,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
