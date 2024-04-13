import 'package:flutter/material.dart';

class DefaultTextFieldOutlined extends StatelessWidget {
  String text;
  IconData icon;
  EdgeInsetsGeometry margin;
  Function(String text) onChanged;
  String? Function(String?)? validator;

  DefaultTextFieldOutlined({
    required this.text,
    required this.icon,
    required this.onChanged,
    this.validator,
    this.margin = const EdgeInsets.only(
      top: 50,
      bottom: 20,
      left: 20,
      right: 20,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: margin,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: TextFormField(
        validator: validator,
        onChanged: (text) {
          onChanged(text);
        },
        decoration: InputDecoration(
            label: Text(text),
            // border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 35, 110, 171), width: 1)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color.fromARGB(255, 37, 101, 202), width: 1)),
            prefixIcon: Container(
              margin: EdgeInsets.only(top: 12),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Icon(icon),
                  Container(height: 20, width: 1, color: Colors.grey)
                ],
              ),
            )),
      ),
    );
  }
}
