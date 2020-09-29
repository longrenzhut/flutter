import 'package:demo/base/utils/Adapt.dart';
import 'package:demo/base/utils/MyColors.dart';
import 'package:flutter/material.dart';

class EditView extends TextField{



  EditView({TextEditingController controller,
    int size = 10,
    Color color = MyColors.white,
    Color hintColor = MyColors.white,
    TextAlign textAlign = TextAlign.start,
    bool readOnly = false,
    bool autofocus = false,
    int maxLines,
    int minLines = 1,
    int maxLength,
    TextInputType keyboardType,
    ValueChanged<String> onChanged,
    EdgeInsetsGeometry padding,
    String hint = "",
  }):super(controller : controller,
      style: TextStyle(
          fontSize: Adapt.setTextSp(size),
          color: color
      ),
      textAlign: textAlign,
      readOnly: readOnly,
      maxLines: maxLines,
      autofocus: autofocus,
      minLines: minLines,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: padding,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintStyle: TextStyle(
              fontSize: Adapt.setTextSp(size),
              color: hintColor
          )
      )
  );


}
