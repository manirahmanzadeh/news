class AppValidator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email Is Required!';
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password Is Required!';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters!';
    }
    return null;
  }

  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can not be empty!';
    }
    return null;
  }
}
