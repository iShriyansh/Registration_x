import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_x/model/basic_info_impl.dart';
import 'package:registration_x/model/education_info_impl.dart';
import 'package:registration_x/viewmodel/model/professional_info.dart';
import 'package:registration_x/viewmodel/registration_vm.dart';
import 'package:registration_x/views/pages/address_form.dart';
import 'package:registration_x/views/pages/your_info_form.dart';

import 'injection_container.dart';
import 'model/professional_info_impl.dart';
import 'views/pages/registration.dart';
import 'views/style/themes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(Provider(
      //Depedency Injection
      create: (context) => sl<RegistrationVM>(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration X',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: AddressForm(),
      // home: YourInfoForm(),
      // home: Registration()
    );
  }
}
