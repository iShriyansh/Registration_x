import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobx/mobx.dart';

import 'package:registration_x/model/basic_info_impl.dart';
import 'package:registration_x/viewmodel/model/education_info.dart';
import 'package:registration_x/viewmodel/model/professional_info.dart';

import 'model/basic_info.dart';

part 'registration_vm.g.dart';

class RegistrationVM extends _RegistrationVMBase with _$RegistrationVM {
  RegistrationVM(BasicInfoModel basicInfoModel, EducationInfo educationInfo,
      ProfessionalInfo professionalInfo)
      : super(basicInfoModel, educationInfo, professionalInfo);
}

abstract class _RegistrationVMBase with Store {
  final BasicInfoModel basicInfo;
  final EducationInfo educationInfo;
  final ProfessionalInfo professionalInfo;
  _RegistrationVMBase(
      this.basicInfo, this.educationInfo, this.professionalInfo);
  //!Basic Info Validation

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

  bool validateAllFields({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    validateFirstName(firstName);
    validateLastName(lastName);
    validatePhone(phone);
    validateEmail(email);
    validatePassword(password);
    validateConfirmPassword(password, confirmPassword);
    bool isVaalid = (firstNameError == null &&
        lastNameError == null &&
        phoneError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null);
    print("Basic info validation: $isVaalid");
    return isVaalid;
  }

  //! Education Info Validation

  @observable
  String? educationSelectError;
  @observable
  String? passingYearError;
  @observable
  String? gradeError;
  @observable
  String? universityNameError;

  void validateEducation(String? education) =>
      educationSelectError = educationInfo.validateEducationInfo(education);
  void vaidatePassingYear(String passingYear) =>
      passingYearError = educationInfo.validateYear(passingYear);
  void validateGrade(String grade) =>
      gradeError = educationInfo.validateGrade(grade);
  void validateUniversityName(String universityName) => universityNameError =
      educationInfo.validateUniversityName(universityName);

//! Professional info validation
  @observable
  String? yearsOfExperienceError;
  @observable
  String? designationError;
  @observable
  String? domainError;

  void validateYearsOfExperience(String noOfYears) => yearsOfExperienceError =
      professionalInfo.validateNoOfYearsOfExperience(noOfYears);
  void validateDesignation(String designation) =>
      designationError = professionalInfo.validateDesignation(designation);
  void validateDomain(String domain) =>
      domainError = professionalInfo.validateDomain(domain);

//! Address validation

  @observable
  String? addressError;
  @observable
  String? cityError;
  @observable
  String? stateError;
  @observable
  String? landmarkError;
  @observable
  String? pinCodeError;

  void validateAddress(String address) =>
      addressError = basicInfo.validateAddress(address);

  void validateCity(String city) => cityError = basicInfo.validateCity(city);

  void validateLandmark(String landMark) =>
      landmarkError = basicInfo.validatLandMark(landMark);
  void validateZipCode(String zipCode) =>
      pinCodeError = basicInfo.validatePinCode(zipCode);

  void validateState(String? state) =>
      stateError = basicInfo.validateState(state);

  bool validateAllEducationFields(
      {required String? education,
      required String passingYear,
      required String grade,
      required String universityName}) {
    validateEducation(education);
    vaidatePassingYear(passingYear);
    validateGrade(grade);
    validateUniversityName(universityName);
    bool isValid = true;
    if (educationSelectError != null) {
      isValid = false;
    }
    if (passingYearError != null) {
      isValid = false;
    }
    if (gradeError != null) {
      isValid = false;
    }
    if (universityNameError != null) {
      isValid = false;
    }
    print("Education is valid $isValid");
    return isValid;
  }

  bool validateAllProfessionalFields(
      {required String experience,
      required String designation,
      required String domain}) {
    validateYearsOfExperience(experience);
    validateDesignation(designation);
    validateDomain(domain);
    bool isValid = true;
    if (yearsOfExperienceError != null) {
      isValid = false;
    }
    if (designationError != null) {
      isValid = false;
    }
    if (domainError != null) {
      isValid = false;
    }
    print("Professional is valid $isValid");
    return isValid;
  }

  bool validateAllAddressFields(
      {required String address,
      required String city,
      required String state,
      required String landmark,
      required String zipCode}) {
    validateAddress(address);
    validateCity(city);
    validateState(state);
    validateLandmark(landmark);
    validateZipCode(zipCode);

    bool isValid = true;
    validateState(state);
    if (addressError != null) {
      isValid = false;
    }
    if (cityError != null) {
      isValid = false;
    }
    if (stateError != null) {
      isValid = false;
    }
    if (landmarkError != null) {
      isValid = false;
    }
    if (pinCodeError != null) {
      isValid = false;
    }
    print("Address validation success" + isValid.toString());
    return isValid;
  }
}
