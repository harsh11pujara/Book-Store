import 'package:book_store/themes/theme.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  Widget authTextField(
      {required String label,
      required Color textFieldColor,
      required double verticalPadding,
      required TextEditingController controller,
      TextInputType? keyboard,
      TextCapitalization? textCapitalization,
      String? Function(String?)? validator,
      Widget? suffixIcon,
      bool? obscureText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(fontSize: 13),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(fontSize: 18),
          cursorColor: textFieldColor,
          keyboardType: keyboard,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          controller: controller,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(minWidth: 55),
            contentPadding: EdgeInsets.only(left: 25, top: verticalPadding, bottom: verticalPadding),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90), borderSide: BorderSide(color: textFieldColor, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90), borderSide: BorderSide(color: textFieldColor, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90), borderSide: BorderSide(color: textFieldColor, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90), borderSide: BorderSide(color: textFieldColor, width: 2)),
          ),
        )
      ],
    );
  }
}
