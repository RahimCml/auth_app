import 'package:auth_app/presentation/widgets/global_input_email.dart';
import 'package:auth_app/presentation/widgets/global_input_password.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  RegExp authRegex =
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  
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
                  GlobalInputEmail(controller: emailController, authRegex: authRegex, emailFocus: emailFocus,),
                  const SizedBox(height: 12),
                  GlobalInputPassword(controller: passwordController, passwordFocus: passwordFocus),
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
