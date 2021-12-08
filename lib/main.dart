import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_x/model/basic_info_impl.dart';
import 'package:registration_x/model/education_info_impl.dart';
import 'package:registration_x/viewmodel/model/professional_info.dart';
import 'package:registration_x/viewmodel/registration_vm.dart';
import 'package:registration_x/views/pages/your_info_form.dart';

import 'model/professional_info_impl.dart';
import 'views/pages/registration.dart';
import 'views/style/themes.dart';

void main() => runApp(Provider(
    create: (context) => RegistrationVM(
        BasicInfoModelImpl(), EducationInfoImpl(), ProfessionalInfoImpl()),
    child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Registration X',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: YourInfoForm());
  }
}
