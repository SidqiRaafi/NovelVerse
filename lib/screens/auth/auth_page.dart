import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../home/main_page.dart';

class AuthPage extends StatefulWidget {
  final int initialTab;
  
  const AuthPage({
    super.key,
    this.initialTab = 0,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  
  // Login fields
  bool _isLoginPasswordVisible = false;
  bool _isLoginLoading = false;
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController = TextEditingController();
  
  // Register fields
  bool _isRegisterPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isRegisterLoading = false;
  final TextEditingController _registerEmailController = TextEditingController();
  final TextEditingController _registerPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );
    
    _pageController = PageController(
      initialPage: widget.initialTab,
    );
    
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.animateToPage(
          _tabController.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Validation
  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    if (!email.contains('@') || !email.contains('.')) return 'Invalid email format';
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  String? _validateConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) return 'Please confirm your password';
    if (password != confirmPassword) return 'Passwords do not match';
    return null;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFFC62828),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Handle Login
  Future<void> _handleLogin() async {
    final emailError = _validateEmail(_loginEmailController.text.trim());
    final passwordError = _validatePassword(_loginPasswordController.text.trim());

    if (emailError != null) {
      _showError(emailError);
      return;
    }
    if (passwordError != null) {
      _showError(passwordError);
      return;
    }

    setState(() => _isLoginLoading = true);

    try {
      await _authService.loginWithEmail(
        email: _loginEmailController.text.trim(),
        password: _loginPasswordController.text.trim(),
      );

      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const curve = Curves.easeOut;
              
              var scaleTween = Tween(begin: 0.97, end: 1.0).chain(CurveTween(curve: curve));
              var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

              return FadeTransition(
                opacity: animation.drive(fadeTween),
                child: ScaleTransition(
                  scale: animation.drive(scaleTween),
                  child: child,
                ),
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isLoginLoading = false);
    }
  }

  // Handle Register
  Future<void> _handleRegister() async {
    final emailError = _validateEmail(_registerEmailController.text.trim());
    final passwordError = _validatePassword(_registerPasswordController.text.trim());
    final confirmPasswordError = _validateConfirmPassword(
      _registerPasswordController.text.trim(),
      _confirmPasswordController.text.trim(),
    );

    if (emailError != null) {
      _showError(emailError);
      return;
    }
    if (passwordError != null) {
      _showError(passwordError);
      return;
    }
    if (confirmPasswordError != null) {
      _showError(confirmPasswordError);
      return;
    }

    setState(() => _isRegisterLoading = true);

    try {
      await _authService.registerWithEmail(
        email: _registerEmailController.text.trim(),
        password: _registerPasswordController.text.trim(),
      );

      _showSuccess('Account created! Please login.');
      
      if (mounted) {
        await Future.delayed(const Duration(milliseconds: 500));
        _tabController.animateTo(0);
      }
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) setState(() => _isRegisterLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFF5F1E8),
                    ),
                  ),
                ],
              ),
            ),

            // Title
            const Text(
              'Get Started now',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xFFB8941F),
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Create an account or log in to explore NovelVerse',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color(0xFFF5F1E8).withOpacity(0.6),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),

            // Tab Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(4),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: const Color(0xFFB8941F),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: const Color(0xFF1E1E1E),
                  unselectedLabelColor: const Color(0xFFF5F1E8).withOpacity(0.6),
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: const [
                    Tab(text: 'Log In'),
                    Tab(text: 'Sign Up'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Forms
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(index);
                },
                children: [
                  _buildLoginForm(),
                  _buildRegisterForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Login Form
  Widget _buildLoginForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            controller: _loginEmailController,
            label: 'Email',
            hint: 'youremail@gmail.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          _buildPasswordField(
            controller: _loginPasswordController,
            label: 'Password',
            isVisible: _isLoginPasswordVisible,
            onToggle: () {
              setState(() => _isLoginPasswordVisible = !_isLoginPasswordVisible);
            },
          ),
          const SizedBox(height: 32),
          _buildButton(
            text: 'Log In',
            isLoading: _isLoginLoading,
            onPressed: _handleLogin,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // Register Form
  Widget _buildRegisterForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            controller: _registerEmailController,
            label: 'Email',
            hint: 'youremail@gmail.com',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          _buildPasswordField(
            controller: _registerPasswordController,
            label: 'Password',
            isVisible: _isRegisterPasswordVisible,
            onToggle: () {
              setState(() => _isRegisterPasswordVisible = !_isRegisterPasswordVisible);
            },
          ),
          const SizedBox(height: 20),
          _buildPasswordField(
            controller: _confirmPasswordController,
            label: 'Confirm Password',
            isVisible: _isConfirmPasswordVisible,
            onToggle: () {
              setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
            },
          ),
          const SizedBox(height: 32),
          _buildButton(
            text: 'Sign Up',
            isLoading: _isRegisterLoading,
            onPressed: _handleRegister,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFF5F1E8).withOpacity(0.7),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(color: Color(0xFFF5F1E8)),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0xFFF5F1E8).withOpacity(0.3),
            ),
            filled: true,
            fillColor: const Color(0xFF2A2A2A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFB8941F),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFF5F1E8).withOpacity(0.7),
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: !isVisible,
          style: const TextStyle(color: Color(0xFFF5F1E8)),
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: TextStyle(
              color: const Color(0xFFF5F1E8).withOpacity(0.3),
            ),
            filled: true,
            fillColor: const Color(0xFF2A2A2A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFB8941F),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFFB8941F),
                size: 20,
              ),
              onPressed: onToggle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required bool isLoading,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB8941F),
          foregroundColor: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBackgroundColor: const Color(0xFFB8941F).withOpacity(0.5),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Color(0xFF1E1E1E),
                  strokeWidth: 2,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }
}
