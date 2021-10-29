import 'dart:ui';
import 'package:flutter/material.dart';


class DropDownTextField extends StatefulWidget {
  final List<String> items;
  final String label;
  final ValueSetter<String> onSave;
  DropDownTextField({
    Key key,
    this.items,
    this.label,
    this.onSave,
  }) : super(key: key);

  @override
  _DropDownTextFieldState createState() => _DropDownTextFieldState();
}

class _DropDownTextFieldState extends State<DropDownTextField> {
  @override
  Widget build(BuildContext context) {
    String value = widget.items[0];
    var items = [...widget.items];
    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
        ));
   
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: 
                TextStyle(
                    fontSize:  15,
                    color: Color(0xff363636).withOpacity(0.5),
                    fontWeight: FontWeight.w500),
            contentPadding:
                EdgeInsets.symmetric(horizontal:  0, vertical:  8),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFF707070).withOpacity(0.5), width: 2.0)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFF707070).withOpacity(0.18), width: 2.0)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0)),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFF707070).withOpacity(0.5), width: 2.0)),
          ),
          value: value,
          isExpanded: true,
          items: items.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() => value = value);
            widget.onSave(value);
          }),
    );
  }
}
