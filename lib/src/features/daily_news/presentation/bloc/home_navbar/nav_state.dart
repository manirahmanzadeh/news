import 'package:equatable/equatable.dart';

abstract class NavState extends Equatable {
  final int index;

  const NavState({required this.index});

  @override
  List<Object> get props => [index];
}

class NavLoaded extends NavState {
  const NavLoaded(int index) : super(index: index);
}
