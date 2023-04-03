import 'package:auth_app/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalInputPassword extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode passwordFocus;

  const GlobalInputPassword(
      {super.key,
      required this.controller,
      required this.passwordFocus,});

  @override
  State<GlobalInputPassword> createState() => _GlobalInputPasswordState();
}

class _GlobalInputPasswordState extends State<GlobalInputPassword> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return TextFormField(
          controller: widget.controller,
          focusNode: widget.passwordFocus,
          onChanged: (value) {
            setState(() {});
          },
          decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: const Icon(Icons.remove_red_eye),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue)
              )),
        );
      },
    );
  }
}
