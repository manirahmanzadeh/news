abstract class NavEvent {
  const NavEvent();
}

class NavChangeIndex extends NavEvent {
  final int newIndex;

  const NavChangeIndex({required this.newIndex});
}
