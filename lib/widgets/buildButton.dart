import 'package:flutter/material.dart';

Widget BuildButton({VoidCallback? onTap, required String text, Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: MaterialButton(
      color: color,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
