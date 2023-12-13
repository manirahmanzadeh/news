import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogInButtonComponent extends StatelessWidget {
  const LogInButtonComponent({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: const Color(0xFFEBF0FF),
          ),
        ),
        height: 57,
        width: 343,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: const Color(0xFF9098B1),
                      letterSpacing: 0.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
