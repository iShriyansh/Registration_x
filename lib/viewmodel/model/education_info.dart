abstract class EducationInfo{
  
  String? validateYear(int year,{int min = 1900  });

  String? validateUniversityName(String name);

  String? validateGrade(String grade);


}