bool isValidEmail(String email) {
  // Regular expression for a basic email pattern
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  // Check if the email matches the pattern
  return emailRegex.hasMatch(email);
}

bool isValidPhoneNumber(String phoneNumber) {
  // List of valid prefixes
  List<String> validPrefixes = [
    "013",
    "014",
    "015",
    "016",
    "017",
    "018",
    "019"
  ];

  // Check length and prefix
  if (phoneNumber.length == 11 && validPrefixes.any(phoneNumber.startsWith)) {
    return true;
  } else {
    return false;
  }
}

bool isPhoneNumberValid(dynamic phoneNumber) {
  RegExp regExp = RegExp(
    r"01[3-9]\d{8}$",
  );
  return regExp.hasMatch(phoneNumber.toString());
}

bool isNameValid(String name) {
  // Check if the name is not null, not empty, and contains only whitespace
  return name != null && name.trim().isEmpty;
}
