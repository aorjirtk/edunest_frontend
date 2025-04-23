

import 'package:flutter/widgets.dart';
import 'package:my_flutter_app/styles/font_size.dart';

class AppTheme{
  AppTheme._();

    static TextStyle titleStyle({Color? Color, bool isBold = false})=> 
        TextStyle(fontSize: titleSize, color: Color, fontWeight: isBold ? FontWeight.bold: FontWeight.normal);

    static TextStyle subTitleStyle({ Color? Color, bool isBold = false}) => TextStyle(
        fontSize: subTitleSize, color: Color, fontWeight: isBold ? FontWeight.bold: FontWeight.normal);

    static TextStyle headerStyle({Color? Color})=> TextStyle(fontSize: headerSize, color: Color, fontWeight: FontWeight.bold);
}