import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController emailController;
  late FocusNode emailFocus;
  RegExp authRegex =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  bool emailRegex = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Container(
          color: const Color.fromARGB(73, 18, 17, 17),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    focusNode: emailFocus,
                    onChanged: (value) {
                      if (value.contains(authRegex)) {
                        emailRegex = true;
                      } else {
                        emailRegex = false;
                      }
                      setState(() {});
                    },
                    validator: (value) {
                      if (!authRegex.hasMatch(value.toString())) {
                        return 'Fill email field';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_rounded),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: emailRegex
                              ? const BorderSide(color: Colors.blue)
                              : const BorderSide(color: Colors.red),
                        )),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('checked');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 219, 214, 214),
                        onPrimary: const Color.fromARGB(73, 18, 17, 17),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 3.5, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text('Sign in'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
