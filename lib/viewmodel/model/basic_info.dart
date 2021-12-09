


abstract class BasicInfoModel {
  String? validateName(String firstName);
  String? validatePhone(String phone);
  String? validateEmail(String email);
  String? validatePassword(String password);
  String? validateConfirmPassword(String password, String confirmPassword);
  
  String? validateAddress(String address);
  String? validateCity(String city);
  String? validatLandMark(String landMark);
  String? validatePinCode(String pinCode);

  String? validateState(String? state);


}
