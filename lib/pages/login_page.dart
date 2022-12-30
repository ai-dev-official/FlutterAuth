import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {

  final VoidCallback showRegisterPage;

  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override 
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  get scaffoldBackgroundColor => null;

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim(),
      );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_airport,
                color: Colors.deepOrange,
                size: 75,
                ),
                SizedBox(height: 20),
              // Hello
              Text(
                  'Lets Go!',
                  style:GoogleFonts.bebasNeue(
                    //fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.grey[200],
                  ),
                  
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to the sky hotel!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[200],
                  ),
                ),
                 SizedBox(height: 30),
              // Email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left:20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 10),
              
              // password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:25.0),
                  child: Container(
                    
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left:20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 10),

              // Sign in Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                      ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                    
                        ),
                    ),
                  ),
                              ),
                ),
               ),
               SizedBox(height: 10),
              // Not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Not a member? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                    ),
                    ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: Text(
                      'Register Now!',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
             
             ],
            ),
          ),
        ),
     
    );
  }
}

