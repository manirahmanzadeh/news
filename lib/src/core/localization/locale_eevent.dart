import 'package:flutter/material.dart';

abstract class LocaleEvent {
  const LocaleEvent();
}

class ChangeLocaleEvent extends LocaleEvent {
  final Locale locale;

  const ChangeLocaleEvent({required this.locale});
}
