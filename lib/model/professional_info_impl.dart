import 'package:registration_x/viewmodel/model/professional_info.dart';

class ProfessionalInfoImpl implements ProfessionalInfo {
  @override
  String? validateDesignation(String designation) {
    if (designation.isEmpty) {
      return "Designation is required";
    } else if (designation.length < 3) {
      return 'Designation must be at least 3 characters long';
    } else if (designation.length > 50) {
      return 'Designation must be less than 50 characters long';
    } else {
      return null;
    }
  }

  @override
  String? validateDomain(String domain) {
    if (domain.isEmpty) {
      return null;
    } else if (domain.length < 3) {
      return 'Domain must be at least 3 characters long';
    } else if (domain.length > 50) {
      return 'Domain must be less than 50 characters long';
    } else {
      return null;
    }
  }

  @override
  String? validateNoOfYearsOfExperience(String noOfYearsOfExperience) {
    if (noOfYearsOfExperience.isEmpty) {
      return "No of years of experience is required";
    } else {
      return null;
    }
  }
}
