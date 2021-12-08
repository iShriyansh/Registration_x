import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobx/mobx.dart';

import 'package:registration_x/model/basic_info_impl.dart';
import 'package:registration_x/viewmodel/model/education_info.dart';

import 'model/basic_info.dart';

part 'registration_vm.g.dart';

class RegistrationVM extends _RegistrationVMBase with _$RegistrationVM {
  RegistrationVM(BasicInfoModel basicInfoModel, EducationInfo educationInfo)
      : super(basicInfoModel, educationInfo);
}

abstract class _RegistrationVMBase with Store {
  final BasicInfoModel basicInfo;
  final EducationInfo educationInfo;
  _RegistrationVMBase(
    this.basicInfo,
    this.educationInfo,
  );
  //!========== Basic Info Validation ============

  @observable
  String? firstNameError;
  @observable
  String? lastNameError;
  @observable
  String? phoneError;
  @observable
  String? emailError;
  @observable
  String? passwordError;
  @observable
  String? confirmPasswordError;

//Form fields validations
  void validateFirstName(String fName) =>
      firstNameError = basicInfo.validateName(fName);

  void validateLastName(String lName) =>
      lastNameError = basicInfo.validateName(lName);

  void validatePhone(String phone) =>
      phoneError = basicInfo.validatePhone(phone);

  void validateEmail(String email) =>
      emailError = basicInfo.validateEmail(email);

  void validatePassword(String password) =>
      passwordError = basicInfo.validatePassword(password);

  void validateConfirmPassword(String password, String confirmPassword) =>
      confirmPasswordError =
          basicInfo.validateConfirmPassword(password, confirmPassword);

//Validate all fields

  bool validateAllFields() {
    bool isValid = true;
    if (firstNameError != null) {
      isValid = false;
    }
    if (lastNameError != null) {
      isValid = false;
    }
    if (phoneError != null) {
      isValid = false;
    }
    if (emailError != null) {
      isValid = false;
    }
    if (passwordError != null) {
      isValid = false;
    }
    if (confirmPasswordError != null) {
      isValid = false;
    }
    return isValid;
  }

  //!========== Education Info Validation ============

  @observable
  String? educationSelectError;
  @observable
  String? passingYearError;

  void validateEducationSelect(String education) =>
      educationSelectError = basicInfo.validateYear(education);
}
