import 'package:flutter/material.dart';

class SignInButtonComponent extends StatelessWidget {
  const SignInButtonComponent({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        fixedSize: const Size(343, 57),
      ),
      child: Text(
        'Sign In',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: const Color(0xFFFFFFFF),
              letterSpacing: 0.5,
            ),
      ),
    );
  }
}
