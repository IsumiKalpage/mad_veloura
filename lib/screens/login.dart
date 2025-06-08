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

    // Validate user credentials
    bool isValidUser = users.any((user) => user.email == email && user.password == password);

    if (isValidUser) {
      // If valid, navigate to BottomNavbar screen
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
      body: SingleChildScrollView( 
        child: Column(
          children: [
            // Logo
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 6),
              child: Image.asset(
                'assets/images/logo.png', 
                height: 180, 
                width: 180,
              ),
            ),
            
            
            Container(
              width: double.infinity,  
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 241, 246),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(120),  
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: Column(
                  children: [
                    
                    Text(
                      'Login Here',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 64, 12, 28),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email input field
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Password input field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Forgot Password link
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 15, 15, 15),
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
                        backgroundColor: const Color.fromARGB(255, 239, 191, 183), 
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Google 
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Image.asset('assets/images/google.png'), 
                    onPressed: () {
                      // Handle Google login
                    },
                  ),
                ),
                
                // Facebook
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Image.asset('assets/images/facebook.png'), 
                    onPressed: () {
                     
                    },
                  ),
                ),
                
                // Twitter
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Image.asset('assets/images/twitter.png'), 
                    onPressed: () {
                    },
                  ),
                ),
                
                // Instagram
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Image.asset('assets/images/insta.png'), 
                    onPressed: () {
                      
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
