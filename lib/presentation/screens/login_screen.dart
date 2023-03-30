import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController emailController;
  late FocusNode emailFocus;
  RegExp authRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  bool emailRegex = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: emailController,
            focusNode: emailFocus,
            onChanged: (value) {
              if(authRegex.hasMatch(value)) {
                emailRegex = true;
              }
            },
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email_rounded),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: emailRegex ? const BorderSide(color: Colors.blue) : const BorderSide(color: Colors.red),
              )
            ),
          ),
        ),
      ),
    );
  }
}