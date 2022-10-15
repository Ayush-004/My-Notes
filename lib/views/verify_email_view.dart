import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  _VerifyEmailViewState createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify email',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: 'OpenSansBold',
              fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          const Text(
            "We've sent you an email verification. Please open it to verify your account.",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "If you haven't received a verification email yet, press the button below",
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 15,
            ),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text(
              'Send email verification',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text(
              'Go Back',
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
