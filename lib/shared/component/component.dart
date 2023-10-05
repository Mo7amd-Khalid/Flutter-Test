import 'package:flutter/material.dart';

void showMyDialog({
  required BuildContext context,
  bool barrierDismissible = true,
  Widget? title,
  required Widget content,
  List<Widget>? actions,
  Icon? titleIcon,
  Color? background,

}){
  AlertDialog alertDialog = AlertDialog(
    title: title,
    content: content,
    actions: actions,
    icon: titleIcon,
    backgroundColor: background,
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => alertDialog,

  );
}

Widget MyButton({
  required Function() onPress,
  ShapeBorder? shape,
  Color? color,
  required Widget child,
  double? height,
  double? width,
  double radius = 0,
  double padding = 0,
  double margin = 0,
}) => Container(
  margin: EdgeInsets.all(margin),
  child:   MaterialButton(
    onPressed: onPress,
    shape: shape,
    height: height,
    color: color,
    minWidth: width,
    padding: EdgeInsets.all(padding),
    child: child,
  ),
);

Widget MyTextFormField({
  required TextEditingController controller,
  Function(String x)? onChange,
  String? Function(String?)? validate,
  TextInputType? keyboard,
  TextDirection? direction,
  Widget? prefixIcon,
  Widget? suffixIcon,
  InputBorder? border,
  Widget? label,
}) => TextFormField(
  controller: controller,
  onChanged: onChange,
  keyboardType: keyboard,
  textDirection: direction,
  validator: validate,
  decoration: InputDecoration(
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    border: border,
    label: label,
  ),
);




Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);

Widget myDivider2() => Container(
  width: 1.0,
  height: 40,
  color: Colors.grey[300],
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void showMySnackBar({
  required BuildContext context,
  required Widget content,
  int seconds = 4,
  double? width,
  SnackBarAction? action,
}){
  var sBar = SnackBar(
    content: content,
    duration: Duration(seconds: seconds),
    action: action,
    width: width,
  );
  ScaffoldMessenger.of(context).showSnackBar(sBar);
}
