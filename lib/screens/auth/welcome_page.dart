import 'package:flutter/material.dart';
import 'auth_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('assets/logo/logo.png'), context);
    });
  }

  void _navigateToAuth(int initialTab) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => 
            AuthPage(initialTab: initialTab),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              
              // Logo
              Image.asset(
                'assets/logo/logo.png',
                width: 120,
                height: 120,
              ),
              
              const SizedBox(height: 40),
              
              // Title
              const Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFF5F1E8),
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'NovelVerse',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB8941F),
                  letterSpacing: 2.0,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 16),
              
              // Subtitle
              Text(
                'Discover amazing stories and novels\nfrom around the world',
                style: TextStyle(
                  fontSize: 15,
                  color: const Color(0xFFF5F1E8).withOpacity(0.7),
                  height: 1.6,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              
              const Spacer(flex: 2),
              
              // Login Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => _navigateToAuth(0),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB8941F),
                    foregroundColor: const Color(0xFF1E1E1E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Create Account Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () => _navigateToAuth(1),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFB8941F),
                    side: const BorderSide(
                      color: Color(0xFFB8941F),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
              
              const Spacer(flex: 1),
              
              // Footer
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'By continuing, you agree to our Terms of Service\nand Privacy Policy',
                  style: TextStyle(
                    fontSize: 11,
                    color: const Color(0xFFF5F1E8).withOpacity(0.3),
                    height: 1.4,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
