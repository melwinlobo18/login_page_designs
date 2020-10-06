class Validation {
  String validateFirstName(String value) {
    if (value.isEmpty)
      return 'First Name is required';
    else
      return null;
  }

  String validateLastName(String value) {
    if (value.isEmpty)
      return 'Last Name is required';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validateMobile(String value) {
    Pattern numPattern = r'^[0-9]{10}$';
    RegExp regex = new RegExp(numPattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Phone Number';
    else
      return null;
  }

  String validateGST(String value) {
    Pattern numPattern = r'^[0-9A-Z]{15}$';
    RegExp regex = new RegExp(numPattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid GST Number';
    else
      return null;
  }

  String validatePAN(String value) {
    Pattern numPattern = r'^[0-9A-Z]{10}$';
    RegExp regex = new RegExp(numPattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid PAN Number';
    else
      return null;
  }

  String validateAadhar(String value) {
    Pattern numPattern = r'^[0-9]{12}$';
    RegExp regex = new RegExp(numPattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Aadhar Number';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 8)
      return 'Enter Valid Password';
    else
      return null;
  }
}
