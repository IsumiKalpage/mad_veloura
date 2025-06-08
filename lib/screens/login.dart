import 'package:flutter/material.dart';
import 'package:mad_veloura/models/components/bottomnavbar.dart';
import 'register.dart';
import '../models/user/user_list.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login function
  void _login() {
    String email = emailController.text;
    String password = passwordController.text;

    // Check if the entered credentials match any user in the list
    bool isValidUser = users.any((user) => user.email == email && user.password == password);

    if (isValidUser) {
      // If valid, navigate to BottomNavbar 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavbar()), 
      );
    } else {
      // If invalid, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Image.asset(
                  'assets/images/logo.png',
                  height: 180, 
                  width: 180,
                ),
                SizedBox(height: 20), 

                
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40), 
                  width: double.infinity,
                  child: Column(
                    children: [
                      
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w300, 
                          fontFamily: 'Roboto', 
                        ),
                      ),
                      SizedBox(height: 30), 
                      // Email input field with icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Enter your email',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), 

                      // Password input field with icon
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'Enter your password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), 
                      // Forgot Password link
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 164, 161, 162),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      // Login Button
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF823434), 
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0), 
                          ),
                          elevation: 8,
                          minimumSize: Size(double.infinity, 55),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Navigate to Sign Up screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Social Media Login 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.g_translate),
                      onPressed: () {},
                      color: const Color.fromARGB(255, 113, 203, 116),
                    ),
                    IconButton(
                      icon: Icon(Icons.facebook),
                      onPressed: () {},
                      color: const Color.fromARGB(255, 6, 65, 192),
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt), // Instagram icon
                      onPressed: () {},
                      color: const Color.fromARGB(255, 213, 68, 117),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
