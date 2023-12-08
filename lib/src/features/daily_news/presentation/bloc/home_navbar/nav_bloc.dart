import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/home_navbar/nav_event.dart';
import 'package:news_app/src/features/daily_news/presentation/bloc/home_navbar/nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(const NavLoaded(0)) {
    on<NavChangeIndex>((event, emit) {
      emit(NavLoaded(event.newIndex));
    });
  }
}
