import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:registration_x/Core/custom_type.dart';
import 'package:registration_x/Core/enums.dart';

import '../style/themes.dart';

class Field extends StatelessWidget {
  final String label;
  final String? error;
  final bool autofocus;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Function(String value) onChange;

  Field(this.label,
      {this.error,
      this.controller,
      this.autofocus = false,
      required this.onChange,
      this.inputFormatters,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppTheme.widgetHeight,
          child: CupertinoTextField(
            onChanged: onChange,
            keyboardType: keyboardType,
            autofocus: autofocus ,
            inputFormatters: inputFormatters,
            controller: controller ?? TextEditingController(),
            cursorColor: Theme.of(context).cursorColor,
            decoration:
                AppTheme.getBoxDecoration(context, isError: error != null),
            padding:
                EdgeInsets.symmetric(horizontal: AppTheme.widgetHeight / 3),
            placeholder: label,
            style: Theme.of(context).textTheme.bodyText2,
            placeholderStyle: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Theme.of(context).indicatorColor),
          ),
        ),
        if (error != null)
          SizedBox(
            height: AppTheme.margin,
          ),
        if (error != null)
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
                  error ?? "Error",
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

class TextFieldLabel extends StatelessWidget {
  final String label;
  const TextFieldLabel({Key? key, this.label = "Email"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppTheme.margin,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(
          height: AppTheme.margin,
        ),
      ],
    );
  }
}

class RadioGroup extends StatefulWidget {
  final List<RadioItem> radioItems;
  Function<T>(T value) onChange;
  RadioGroup({
    Key? key,
    required this.radioItems,
    required this.onChange,
  }) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  var _radioValue1;

  void _handleRadioValueChange1(value) {
    widget.onChange(value);
    setState(() {
      _radioValue1 = value ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var i = 0; i < widget.radioItems.length; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<dynamic>(
                  value: widget.radioItems[i].key,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
                Text(
                  widget.radioItems[i].label,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String label;
  final String? error;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String value) onChange;

  PasswordField(this.label,
      {this.error,
      this.controller,
      required this.onChange,
      this.keyboardType = TextInputType.text});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

bool showPassword = false;

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: AppTheme.widgetHeight,
          child: CupertinoTextField(
            onChanged: widget.onChange,
            keyboardType: widget.keyboardType,
            obscureText: showPassword,
            suffix: widget.controller?.text.length != 0
                ? IconButton(
                    splashRadius: 20,
                    icon: Icon(
                      !showPassword
                          ? CupertinoIcons.eye_slash
                          : CupertinoIcons.eye,
                      color: Theme.of(context).unselectedWidgetColor,
                    ),
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                  )
                : SizedBox(),
            controller: widget.controller ?? TextEditingController(),
            cursorColor: Theme.of(context).cursorColor,
            decoration: AppTheme.getBoxDecoration(context,
                isError: widget.error != null),
            padding:
                EdgeInsets.symmetric(horizontal: AppTheme.widgetHeight / 3),
            placeholder: widget.label,
            style: Theme.of(context).textTheme.bodyText2,
            placeholderStyle: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Theme.of(context).indicatorColor),
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

class NextButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final bool loading;

  NextButton({required this.onTap, this.label = "Next", this.loading = false});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        if (onTap != null && !loading) onTap();
      },
      disabledColor: Theme.of(context).disabledColor,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: loading
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 3,
              )
            : Text(
                label,
                style: Theme.of(context).textTheme.button,
              ),
      ),
    );
  }
}

class DropDown extends StatefulWidget {
  final List<String> education;
  final String placeholder;
  final String? error;
  final Function(String value) onChanged;

  DropDown(
      {Key? key,
      required this.education,
      required this.onChanged,
      this.placeholder = "",
      this.error})
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
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.error != null
                  ? Theme.of(context).errorColor
                  : Color(0x33000000),
              width: 1.2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward,
                  color: Theme.of(context).indicatorColor),
              iconSize: 20,
              elevation: 8,
              hint: Text(
                widget.placeholder,
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
