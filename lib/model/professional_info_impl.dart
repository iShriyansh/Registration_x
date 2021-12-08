import 'package:registration_x/viewmodel/model/professional_info.dart';

class ProfessionalInfoImpl extends ProfessionalInfo {
  @override
  String? validateDesignation(String designation) {
     
   
     if (designation.length < 3) {
      return 'Designation must be at least 3 characters long';
    }
    else if (designation.length > 50) {
    return 'Designation must be less than 50 characters long';
    }
    else {
      return null;
    }
    
  }

  @override
  String? validateDomain(String domain) {
  
     if (domain.length < 3) {
      return 'Domain must be at least 3 characters long';
    }
    else if (domain.length > 50) {
      return 'Domain must be less than 50 characters long';
    }
    else {
      return null;
    }
   
  }

  @override
  String? validateNoOfYearsOfExperience(String noOfYearsOfExperience) {

   if(noOfYearsOfExperience.length < 1) {
    return 'No of years of experience must be at least 1 character long';
  }
 try {
    int.parse(noOfYearsOfExperience);
  } on FormatException {
    return 'Please enter a valid number';
  }
  return null;
  }


}
