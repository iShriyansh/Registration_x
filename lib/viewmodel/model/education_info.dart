abstract class EducationInfo{
  
  String? validateYear(String year,{int min = 1900  });

  String? validateUniversityName(String name);

  String? validateGrade(String grade);

  String? validateEducationInfo(String? educationInfo);


}