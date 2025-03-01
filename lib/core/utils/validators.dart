class Validators {
  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can not be empty';
    }
    return null;
  }
}
