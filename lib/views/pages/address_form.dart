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

class AddressForm extends StatefulWidget {
  const AddressForm({Key? key}) : super(key: key);

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  String? selectedState;
  TextEditingController _addressController = TextEditingController();
  TextEditingController _landMarkController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  TextEditingController _pinCodeController = TextEditingController();

  late RegistrationVM _registrationVM;
  @override
  void didChangeDependencies() {
    _registrationVM = Provider.of<RegistrationVM>(context);
    super.didChangeDependencies();
  }

  final states = const [
    "Maharashtra",
    "Gujarat",
    "Karnataka",
    "Madhya Pradesh",
    "Delhi",
    "Others",
  ];

  void onSubmit() {
    bool isSuccess = _registrationVM.validateAllAddressFields(
        address: _addressController.text,
        landmark: _landMarkController.text,
        city: _cityController.text,
        state: selectedState ?? "",
        zipCode: _pinCodeController.text);

    if (isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Validation Success'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
          iconWidget: null, title: 'Your Address', trailing: "3/3"),
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
              TextFieldLabel(
                label: "Address",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter your address",
                  keyboardType: TextInputType.text,
                  controller: _addressController,
                  onChange: _registrationVM.validateAddress,
                  error: _registrationVM.addressError,
                  autofocus: true,
                );
              }),
              TextFieldLabel(
                label: "Landmark",
              ),
              Observer(builder: (_) {
                return Field(
                  "Ex- temple",
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[],
                  controller: _landMarkController,
                  onChange: _registrationVM.validateLandmark,
                  error: _registrationVM.landmarkError,
                );
              }),
              TextFieldLabel(
                label: "City",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter city name",
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[aA-zZ]")),
                  ],
                  controller: _cityController,
                  onChange: _registrationVM.validateCity,
                  error: _registrationVM.cityError,
                );
              }),
              TextFieldLabel(
                label: "State",
              ),
              Observer(builder: (_) {
                return DropDown(
                  placeholder: "Select state",
                  education: states,
                  onChanged: (value) {
                    selectedState = value;
                    _registrationVM.validateState(value);
                  },
                  error: _registrationVM.stateError,
                );
              }),
              TextFieldLabel(
                label: "Pin Code",
              ),
              Observer(builder: (_) {
                return Field(
                  "Enter your pin code",
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    LengthLimitingTextInputFormatter(6),
                  ],
                  controller: _pinCodeController,
                  onChange: _registrationVM.validateZipCode,
                  error: _registrationVM.pinCodeError,
                );
              }),
              SizedBox(
                height: AppTheme.margin * 3,
              ),
              NextButton(label: "Submit", onTap: onSubmit),
            ],
          ),
        ),
      ),
    );
  }
}
