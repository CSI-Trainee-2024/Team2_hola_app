String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address';
  }
  if (!value.contains('@')) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your name';
  }
  return null;
}

/*String? userValidator(String? value) {
  if (value == null) {
    return 'Please enter the user name';
  }
  return null;
}*/

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a pasword';
  }
  if (value.length < 6) {
    return 'Password must be alleast 6 characters long';
  }
  return null;
}
