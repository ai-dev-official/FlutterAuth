import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signed In As: ' + user.email!,
              style:GoogleFonts.bebasNeue(
                    //fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.grey[200],
                  ),
              ),
            MaterialButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              
            },
              color: Colors.deepOrange,
              child: Text(
                'Sign Out', 
                style:GoogleFonts.bebasNeue(
                    //fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[200],
                  ),               
              ),
            )
          ],
        )
      ),
    );
  }
}