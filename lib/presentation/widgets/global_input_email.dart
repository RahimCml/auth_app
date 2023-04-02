import 'package:auth_app/providers/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalInputEmail extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode emailFocus;
  final RegExp authRegex;

  const GlobalInputEmail(
      {super.key,
      required this.controller,
      required this.emailFocus,
      required this.authRegex});

  @override
  State<GlobalInputEmail> createState() => _GlobalInputEmailState();
}

class _GlobalInputEmailState extends State<GlobalInputEmail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, loginProvider, child) {
        return TextFormField(
          controller: widget.controller,
          focusNode: widget.emailFocus,
          onChanged: (value) {
            var v = value.contains(widget.authRegex);
            loginProvider.checkEmail(v);
            setState(() {});
          },
          validator: (value) {
            if (!widget.authRegex.hasMatch(value.toString())) {
              return 'Fill email field';
            }
            return null;
          },
          decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: const Icon(Icons.email_rounded),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: loginProvider.emailRegex
                    ? const BorderSide(color: Colors.blue)
                    : const BorderSide(color: Colors.red),
              )),
        );
      },
    );
  }
}
