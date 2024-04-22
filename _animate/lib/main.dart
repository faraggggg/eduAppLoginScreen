import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/rm222-mind-14.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const Positioned(
              top: 160,
              left: 0,
              right: 0,
              child: LottieAnimation(),
            ),
            Positioned(
              top: 470,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: TextField(
                      style: GoogleFonts.kalam(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        border: const OutlineInputBorder(),
                        labelText: 'Email',
                        suffixIcon: const Icon(Icons.email_outlined),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: false,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: const PasswordField(),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add your login button logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(110, 50),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.kalam(fontSize: 30),
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.kalam(
                        fontSize: 16,
                        color: Colors.black, // Customize the color as needed
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'SIGN UP',
                          style: GoogleFonts.kalam(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Add navigation to signup page
                              if (kDebugMode) {
                                print('Navigate to signup page');
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.kalam(
        fontSize: 18,
      ),
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Enter your password',
        border: const OutlineInputBorder(),
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 46, 110, 163)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 164, 164, 164)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: false,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }
}

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.network(
      'https://lottie.host/a9b7c272-9f6f-4f50-bd7b-54ffb6898af4/15NZG7voD9.json',
      repeat: true,
      height: 320,
    );
  }
}

void main() {
  runApp(const MyApp());
}
