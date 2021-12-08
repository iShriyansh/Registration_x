import 'package:registration_x/viewmodel/model/education_info.dart';

class EducationInfoImpl extends EducationInfo {
  @override
  String? validateYear(int year, {int min = 1900}) {
    if (year < min || year > DateTime.now().year) {
      return 'Please enter a valid year';
    } else {
      return null;
    }
  }

  @override
  String? validateGrade(String grade) {
    // if (grade.isEmpty) {
    //   return 'Please enter a valid grade';
    // }
    if (!grade.contains(RegExp(r'[a-zA-Z0-9]'))) {
      return 'Please enter a valid grade';
    } else if (grade.length > 3) {
      return 'Please enter a valid grade';
    }

    return null;
  }

  @override
  String? validateUniversityName(String name) {
    if (name.isEmpty) {
      return 'Please enter a valid university name';
    } else if (!name.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Please enter a valid university name';
    } else if (name.length > 50) {
      return 'Please enter a valid university name';
    } else {
      return null;
    }
  }
}
