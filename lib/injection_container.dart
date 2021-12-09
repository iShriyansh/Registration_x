

import 'package:get_it/get_it.dart';
import 'package:registration_x/model/basic_info_impl.dart';
import 'package:registration_x/model/education_info_impl.dart';
import 'package:registration_x/model/professional_info_impl.dart';
import 'package:registration_x/viewmodel/model/basic_info.dart';
import 'package:registration_x/viewmodel/model/education_info.dart';
import 'package:registration_x/viewmodel/registration_vm.dart';

import 'viewmodel/model/professional_info.dart';



final sl = GetIt.instance;

init() {
  //!form validator

sl.registerFactory(() => RegistrationVM(sl(), sl(), sl()));

  sl.registerSingleton<BasicInfoModel>( BasicInfoModelImpl());
sl.registerSingleton<EducationInfo>( EducationInfoImpl());
sl.registerSingleton<ProfessionalInfo>( ProfessionalInfoImpl());


}