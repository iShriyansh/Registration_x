// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:registration_x/Core/custom_type.dart';
import 'package:registration_x/Core/enums.dart';
import 'package:registration_x/model/basic_info_impl.dart';
import 'package:registration_x/viewmodel/registration_vm.dart';
import 'package:registration_x/views/pages/your_info_form.dart';

import 'package:registration_x/views/style/themes.dart';
import 'package:registration_x/views/widgets/custom_app_bar.dart';

import '../widgets/common_widgets.dart';

class Registration extends StatefulWidget {
  const Registration({
    Key? key,
  }) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void pickImage() async {
    print("test");
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  late RegistrationVM _registrationVM;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _registrationVM = Provider.of<RegistrationVM>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          title: "Registration",
          iconWidget: Icon(
            Icons.vpn_key,
            size: 30,
            color: Theme.of(context).primaryColor,
          )),
      body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppTheme.margin * 2,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 130,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).indicatorColor),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: image == null
                                  ? Icon(Icons.person,
                                      size: 75,
                                      color: Theme.of(context).indicatorColor)
                                  : Image.file(File(image?.path ?? ""),
                                      fit: BoxFit.cover),
                            ),
                            borderRadius: BorderRadius.circular(100),

                            //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                          ),
                          Positioned.fill(
                            top: -65,
                            left: 75,
                            child: Align(
                              //alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () async {
                                  pickImage();
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      // color: Theme.of(context).indicatorColor,
                                      // shape: BoxShape.circle,
                                      ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: CupertinoColors.systemGrey,
                                      size: 26,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const TextFieldLabel(label: "First Name"),
                Observer(builder: (_) {
                  return Field(
                    "First Name",
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                    ],
                    controller: _firstNameController,
                    onChange: (value) {
                      _registrationVM.validateFirstName(value);
                    },
                    error: _registrationVM.firstNameError,
                  );
                }),
                const TextFieldLabel(label: "Last Name"),
                Observer(builder: (_) {
                  return Field(
                    "Last Name",
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                    ],
                    controller: _lastNameController,
                    onChange: _registrationVM.validateLastName,
                    error: _registrationVM.lastNameError,
                  );
                }),

                const TextFieldLabel(
                  label: "Phone Number",
                ),
                Observer(builder: (_) {
                  return Field(
                    "Enter your phone number",
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      LengthLimitingTextInputFormatter(10),
                    ],
                    controller: _phoneNumberController,
                    onChange: _registrationVM.validatePhone,
                    error: _registrationVM.phoneError,
                  );
                }),
                const TextFieldLabel(
                  label: "Email",
                ),
                Observer(builder: (_) {
                  return Field(
                    "Example@email.com",
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: <TextInputFormatter>[],
                    controller: _emailController,
                    onChange: _registrationVM.validateEmail,
                    error: _registrationVM.emailError,
                  );
                }),
                const SizedBox(
                  height: AppTheme.margin,
                ),
                Text(
                  "Gender",
                  style: Theme.of(context).textTheme.headline3,
                ),

                //Accepts radio items and returns select item key
                RadioGroup(
                  radioItems: [
                    RadioItem(Gender.male, "Male"),
                    RadioItem(Gender.female, "Female")
                  ],
                  onChange: <Gender>(gender) {
                    print(gender);
                  },
                ),
                const TextFieldLabel(label: "Password"),
                Observer(builder: (_) {
                  return PasswordField(
                    "Enter password",
                    controller: _passwordController,
                    onChange: _registrationVM.validatePassword,
                    error: _registrationVM.passwordError,
                  );
                }),

                const TextFieldLabel(label: "Confirm password"),
                Observer(builder: (_) {
                  return PasswordField(
                    "Confirm password",
                    controller: _confirmPasswordController,
                    onChange: (value) {
                      _registrationVM.validateConfirmPassword(
                          _passwordController.text, value);
                    },
                    error: _registrationVM.confirmPasswordError,
                  );
                }),
                const SizedBox(
                  height: AppTheme.margin * 3,
                ),

                NextButton(onTap: () {
                  if (_registrationVM.validateAllFields()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YourInfoForm()));
                  }
                }),

                SizedBox(
                  height: AppTheme.margin * 2,
                )
              ],
            ),
          )),
    );
  }
}
