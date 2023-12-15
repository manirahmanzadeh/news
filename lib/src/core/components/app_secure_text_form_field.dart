import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSecureTextFormField extends StatefulWidget {
  const AppSecureTextFormField({
    Key? key,
    this.title,
    this.icon,
    this.onSaved,
    this.validator,
  }) : super(key: key);
  final String? title;
  final String? icon;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  State<AppSecureTextFormField> createState() => _AppSecureTextFormFieldState();
}

class _AppSecureTextFormFieldState extends State<AppSecureTextFormField> {
  bool _isObscure = true;

  void _changeObscure() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color(0xFF9098B1),
          ),
      onSaved: widget.onSaved,
      validator: widget.validator,
      obscureText: _isObscure,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color(0xFFEBF0FF),
          ),
        ),
        prefixIcon: widget.icon != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  widget.icon!,
                  height: 16,
                ),
              )
            : null,
        suffixIcon: InkWell(
          onTap: _changeObscure,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              _isObscure ? 'assets/icons/eye-slash-solid.svg' : 'assets/icons/eye-solid.svg',
              height: 16,
            ),
          ),
        ),
        hintText: widget.title,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(0xFF9098B1),
            ),
      ),
      keyboardType: TextInputType.text,
      cursorColor: Colors.blue,
      textAlign: TextAlign.left,
    );
  }
}
