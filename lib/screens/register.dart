import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( 
        child: Column(
          children: [
            
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 6),
              child: Image.asset(
                'assets/images/logo.png',
                height: 180,
                width: 180,
              ),
            ),
            SizedBox(height: 20),

           
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 241, 246),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120), 
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: Column(
                  children: [
                    
                    Text(
                      'Register',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 64, 12, 28),
                        fontSize: 32,
                        fontWeight: FontWeight.w300, 
                      ),
                    ),
                    SizedBox(height: 30),

                    // Full Name input field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Email input field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Phone number input field
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Password input field
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      ),
                    ),
                    SizedBox(height: 30),

                    // Register button
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 239, 191, 183), 
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 8,
                        minimumSize: Size(double.infinity, 55),
                      ),
                      child: Text(
                        'Register',
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
          ],
        ),
      ),
    );
  }
}
