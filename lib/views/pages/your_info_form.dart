import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:registration_x/viewmodel/registration_vm.dart';
import 'package:registration_x/views/style/themes.dart';
import 'package:registration_x/views/widgets/common_widgets.dart';
import 'package:registration_x/views/widgets/custom_app_bar.dart';

class YourInfoForm extends StatefulWidget {
  const YourInfoForm({Key? key}) : super(key: key);

  @override
  _YourInfoFormState createState() => _YourInfoFormState();
}

class _YourInfoFormState extends State<YourInfoForm> {
  String? educationLevel;

  TextEditingController _yearOfPassingController = TextEditingController();
  TextEditingController _gradeController = TextEditingController();
  TextEditingController _universityNameController = TextEditingController();
  TextEditingController _yearsOfExperienceController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  TextEditingController _domainController = TextEditingController();

  late RegistrationVM _registrationVM;
  @override
  void didChangeDependencies() {
    _registrationVM = Provider.of<RegistrationVM>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, iconWidget: null, title: 'Your Info'),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppTheme.margin * 2,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppTheme.margin * 1,
              ),
              Text(
                "Educational Info",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: AppTheme.margin * 1,
              ),
              TextFieldLabel(
                label: "Education",
              ),
              Observer(builder: (_) {
                return DropDown(
                  education: const [
                    "Post Graduate",
                    "Graduate",
                    "HSC/Diploma",
                    "SSC",
                  ],
                  onChanged: (value) {
                    educationLevel = value;
                  },
                  error: _registrationVM.educationSelectError,
                );
              }),
              TextFieldLabel(
                label: "Year of Passing",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter Year",
                  keyboardType: TextInputType.datetime,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    LengthLimitingTextInputFormatter(4),
                  ],
                  controller: _yearOfPassingController,
                  onChange: _registrationVM.vaidatePassingYear,
                  error: _registrationVM.passingYearError,
                );
              }),
              TextFieldLabel(
                label: "Grade",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter your grade or percentage",
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9aA-zZ]")),
                    LengthLimitingTextInputFormatter(2),
                  ],
                  controller: _gradeController,
                  onChange: _registrationVM.validateGrade,
                  error: _registrationVM.gradeError,
                );
              }),
              TextFieldLabel(
                label: "University",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter your University",
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9aA-zZ]")),
                    LengthLimitingTextInputFormatter(2),
                  ],
                  controller: _universityNameController,
                  onChange: _registrationVM.validateUniversityName,
                  error: _registrationVM.universityNameError,
                );
              }),
              SizedBox(
                height: AppTheme.margin * 1,
              ),
              Text(
                "Professional Info",
                style: Theme.of(context).textTheme.headline6,
              ),
              TextFieldLabel(
                label: "Experience",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter the years of experience",
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    LengthLimitingTextInputFormatter(2),
                  ],
                  controller: _yearsOfExperienceController,
                  onChange: _registrationVM.validateYearsOfExperience,
                  error: _registrationVM.yearsOfExperienceError,
                );
              }),
              TextFieldLabel(
                label: "Designation",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter your designation",
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9aA-zZ]")),
                  ],
                  controller: _designationController,
                  onChange: _registrationVM.validateDesignation,
                  error: _registrationVM.designationError,
                );
              }),
              TextFieldLabel(
                label: "Domain",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter your Domain",
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9aA-zZ]")),
                  ],
                  controller: _domainController,
                  onChange: _registrationVM.validateDomain,
                  error: _registrationVM.domainError,
                );
              }),
              SizedBox(
                height: AppTheme.margin * 3,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 43,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "Back",
                            style: TextStyle(
                                color: CupertinoColors.activeBlue,
                                fontSize: 16),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: AppTheme.margin * 2,
                  ),
                  Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: CupertinoColors.activeBlue,
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppTheme.margin * 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
