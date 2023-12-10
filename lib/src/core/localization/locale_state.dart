import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({required this.locale});

  @override
  List<Object> get props => [locale];
}

class LocaleLoaded extends LocaleState {
  const LocaleLoaded(Locale locale) : super(locale: locale);
}
