class Validators{
   static String? email(String? input) {
    if (input!.isEmpty) {
      return "Email Address cannot be empty.";
    }
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input);
    if (!isValid) {
      return "Email Address is Not Valid";
    }
    return null;
  }
  
  static String? isRequired(String? input) {
    if (input == null || input.isEmpty) {
      return "This is a required field.";
    } else {
      return null;
    }
  }
}