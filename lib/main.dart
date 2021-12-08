import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_x/model/basic_info_impl.dart';
import 'package:registration_x/viewmodel/registration_vm.dart';
import 'package:registration_x/views/pages/education_info_form.dart';

import 'views/pages/registration.dart';
import 'views/style/themes.dart';

void main() => runApp(Provider(
    create: (context) => RegistrationVM(BasicInfoModelImpl()), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Registration X',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: EducationInfoForm());
  }
}
