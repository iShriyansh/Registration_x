import 'package:registration_x/Core/input_types.dart';
import 'package:registration_x/viewmodel/model/basic_info.dart';

class BasicInfoModelImpl implements BasicInfoModel {
//!Dartz package
//?https://pub.dev/packages/dartz
//!Either is datatype that can return two type of data -  Left and Right

  @override
  String? validateName(String firstName) {
    if (firstName.length < 3) {
      return "Name must be at least 3 characters long";
    }
    return null;
  }

  @override
  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return null;
    } else {
      return "Password and Confirm Password must be same";
    }
  }

  @override
  String? validateEmail(String email) {
    if (email == "" || email.isEmpty) {
      return "Email cannot be empty";
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (emailValid) {
        return null;
      } else {
        return "Email is not valid";
      }
    }
  }

  @override
  String? validatePhone(String phone) {
    if (phone.length < 10) {
      return "Please enter valid mobile number";
    } else if (phone.isEmpty) {
      return "Phone number cannot be empty";
    } else if (phone.length == 10) {
      return null;
    } else {
      return "Please enter valid mobile number";
    }
  }

  @override
  String? validatePassword(String password) {
    if (password.isEmpty || password == "") {
      return "Password cannot be empty";
    } else {
      if (password.length < 3) {
        return "Password length is short!";
      } else {
        String pattern = r'^(?=.*\d)(?=.*[a-zA-Z])(?=.*[\W_]).{3,}$';
        //  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
        RegExp regExp = new RegExp(pattern);
        if (regExp.hasMatch(password)) {
          return null;
        } else {
          return "Password should contain Special Characters, Numbers and Alphabates with Lowercase and Uppercase ";
        }
      }
    }
  }

  @override
  String? validatLandMark(String landMark) {
    if (landMark.isEmpty || landMark == "") {
      return "Landmark cannot be empty";
    } else if (landMark.length < 3) {
      return "Landmark must be at least 3 characters long";
    }

    return null;
  }

  @override
  String? validateAddress(String address) {
    if (address.isEmpty || address == "") {
      return "Address cannot be empty";
    } else if (address.length < 3) {
      return "Address must be at least 3 characters long";
    }

    return null;
  }

  @override
  String? validateCity(String city) {
    return null;
  }

  @override
  String? validatePinCode(String pinCode) {
    //  if(pinCode.isEmpty || pinCode == ""){
    //    return "Pin Code cannot be empty";

    // }

    if (pinCode.length < 6) {
      return "Pin Code must be at least 6 characters long";
    }
    return null;
  }

  @override
  String? validateState(String? state) {
    if (state != null && state != "") {
      return null;
    } else {
      return "State cannot be empty";
    }
  }
}
