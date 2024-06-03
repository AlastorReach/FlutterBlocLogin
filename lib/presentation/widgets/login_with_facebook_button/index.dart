import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithFacebookButton extends StatelessWidget {
  const LoginWithFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const GoogleIcon(),
      onPressed: () {},
      label: const Text('Login With Facebook'),
    );
  }
}

class GoogleIcon extends StatelessWidget {
  const GoogleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svg/facebook_logo_f.svg',
      semanticsLabel: 'Facebook Logo',
      width: 20,
      height: 20,
    );
  }
}
