// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/src/core/localization/locale_eevent.dart';
import 'package:news_app/src/core/localization/locale_state.dart';

extension Localization on BuildContext {
  AppLocalizations get localizations {
    return AppLocalizations.of(this)!;
  }
}

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc()
      : super(
          const LocaleLoaded(
            Locale('en'),
          ),
        ) {
    on<ChangeLocaleEvent>(onLocaleChange);
  }

  FutureOr<void> onLocaleChange(ChangeLocaleEvent event, Emitter<LocaleState> emit) {
    emit(LocaleLoaded(event.locale));
  }
}
