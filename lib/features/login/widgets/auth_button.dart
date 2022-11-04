import 'package:flutter/material.dart';
import 'package:promina/core/resources/values_manager.dart';

Widget authButton(
        {required BuildContext context,
        authButtonText,
        VoidCallback? onPressed}) =>
    Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            "$authButtonText",
            style: const TextStyle(
                color: Colors.white,
              fontSize: AppSize.s20,
            ),
          ),
        ));
