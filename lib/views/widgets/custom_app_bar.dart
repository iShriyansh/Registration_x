import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:registration_x/views/style/themes.dart';

AppBar customAppBar(BuildContext context,
        {Widget? iconWidget,
        String title = "Create Profile",
        String trailing = "1/5"}) =>
    AppBar(
      elevation: 1,
      automaticallyImplyLeading: true,
      brightness: Theme.of(context).brightness == Brightness.dark
          ? Brightness.dark
          : Brightness.light,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              iconWidget ?? SizedBox(),
              iconWidget != null
                  ? SizedBox(
                      width: AppTheme.margin * 2,
                    )
                  : SizedBox(),
              Text(
                title,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Log in",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: AppTheme.margin,
              ),
              Text(
                trailing,
                style: Theme.of(context).textTheme.subtitle2,
              )
            ],
          )
        ],
      ),
    );
