import 'package:flutter/material.dart';
import 'package:trial/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF03444A), // Dark teal background
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacing from top
              const SizedBox(height: 30),
              
              // Logo (suggested: family-themed icon)
              Icon(
                Icons.family_restroom, // Suggesting a family support icon
                size: 100,
                color: Color(0xFFE6E414), // Bright yellow
              ),
              
              const SizedBox(height: 20),
              
              // App Name with Style
              Text(
                "APPLIFE: The Complete Family Support System",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF924D), // Warm orange
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),
              
              // Email TextField
              MyTextField(
                controller: emailController,
                hinttext: "Email",
                obscureText: false,
              ),

              const SizedBox(height: 25),

              // Password TextField
              MyTextField(
                controller: passwordController,
                hinttext: "Password",
                obscureText: true,
              ),

              const SizedBox(height: 35),

              // Login Button with Rounded Corners and Padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF00A8A8), // Bright teal
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    // Correctly navigate to the menu page route
                    Navigator.pushNamed(context, '/menu/menu_page');
                  },
                ),
              ),

              const SizedBox(height: 20),
              
              // Forgot Password option (optional enhancement)
              TextButton(
                onPressed: () {
                  // Navigate to forgot password page (if implemented)
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Color(0xFF9AD3DA), // Light teal
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
