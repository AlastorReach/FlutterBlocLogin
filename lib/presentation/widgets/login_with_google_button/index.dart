import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const GoogleIcon(),
      onPressed: () {},
      label: const Text('Login With Google'),
    );
  }
}

class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svg/logo_google_g_icon.svg',
      semanticsLabel: 'Google Logo',
      width: 20,
      height: 20,
    );
  }
}
