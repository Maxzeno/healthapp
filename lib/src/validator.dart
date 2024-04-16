class Validator {
  static String? phone(String? value,
      {String message = 'Field cannot be empty'}) {
    if (value!.trim().isEmpty) {
      return message;
    } else if (value.trim().length < 10) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  static String? pin(
    String? value,
  ) {
    if (value!.isEmpty) {
      return 'Field can not be empty';
    } else if (value.length > 4) {
      return 'Pin must be 4';
    }
    return null;
  }

  static String? nonEmptyField(
    String? value, {
    String message = 'Field cannot be empty',
  }) {
    if (value!.trim().isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  static String? emailValidator(String? value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Field cannot be empty';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Enter valid email address';
    }
    return null;
  }

  static String? password(String? value,
      {String message = 'Field cannot be empty'}) {
    const pattern = r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*";
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return message;
    } else if (value.length < 8) {
      return 'Password should be at least 8 characters';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Must include Uppercase, Lowercase and Number';
    }
    return null;
  }

  String? feildValidator(
    String? value, {
    String message = 'Field cannot be empty',
  }) {
    if (value!.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  String? emailValidator2(String? value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Field cannot be empty';
    } else if (!regex.hasMatch(value.trim())) {
      return 'Enter valid email address';
    }
    return null;
  }
}
