import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:registration_x/viewmodel/registration_vm.dart';
import 'package:registration_x/views/style/themes.dart';
import 'package:registration_x/views/widgets/common_widgets.dart';
import 'package:registration_x/views/widgets/custom_app_bar.dart';

class EducationInfoForm extends StatefulWidget {
  const EducationInfoForm({Key? key}) : super(key: key);

  @override
  _EducationInfoFormState createState() => _EducationInfoFormState();
}

class _EducationInfoFormState extends State<EducationInfoForm> {
  String? educationLevel;

  TextEditingController _yearOfPassingController = TextEditingController();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  LengthLimitingTextInputFormatter(4),
                ],
                controller: _yearOfPassingController,
                onChange: _registrationVM.validatePhone,
                error: _registrationVM.phoneError,
              );
            }),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final List<String> education;
  final String? error;
  final Function(String value) onChanged;

  DropDown(
      {Key? key, required this.education, required this.onChanged, this.error})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropDownState extends State<DropDown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0x33000000),
              width: 0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward,
                  color: Theme.of(context).indicatorColor),
              iconSize: 24,
              elevation: 16,
              hint: Text(
                'Select your education',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Theme.of(context).indicatorColor),
              ),
              style: Theme.of(context).textTheme.headline3,
              underline: Container(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
                widget.onChanged(newValue!);
              },
              items: widget.education
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        if (widget.error != null)
          SizedBox(
            height: AppTheme.margin,
          ),
        if (widget.error != null)
          Row(
            children: [
              Icon(
                Icons.error_outline,
                size: 18,
                color: Theme.of(context).errorColor,
              ),
              SizedBox(
                width: AppTheme.margin * 0.75,
              ),
              Expanded(
                child: Text(
                  widget.error ?? "Error",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Theme.of(context).errorColor),
                ),
              ),
            ],
          )
      ],
    );
  }
}
