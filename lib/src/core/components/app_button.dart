import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.labelText,
  }) : super(key: key);
  final Function() onTap;
  final String labelText;

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
        labelText,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: const Color(0xFFFFFFFF),
              letterSpacing: 0.5,
            ),
      ),
    );
  }
}
