import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/text_style.dart';

class CustomTextFormField extends StatelessWidget {
  // controller
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // ui
  final String? title;
  final Widget? button;
  final TextStyle? textStyle;
  final double contentPaddingVertical;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;

  // restrict
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final int? maxLength;
  final int? maxLines;
  final bool realOnly;
  final bool enabled;

  const CustomTextFormField({
    Key? key,
    // controller
    required this.onChanged,
    required this.onSaved,
    required this.validator,
    this.onEditingComplete,
    this.controller,
    this.focusNode,
    // ui
    this.title,
    this.button,
    this.textStyle = MyTextStyle.descriptionRegular,
    this.obscureText = false,
    this.contentPaddingVertical = 8.0,
    this.hintText,
    this.suffixIcon,
    // restrict
    this.maxLength,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
    this.realOnly = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              title!,
              style: MyTextStyle.bodyTitleBold,
            ),
          ),
        if (title != null) const SizedBox(height: 8.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                // controller
                onChanged: onChanged,
                onSaved: onSaved,
                validator: validator,
                onEditingComplete: onEditingComplete,
                controller: controller,
                focusNode: focusNode,
                // ui
                style: textStyle,
                obscureText: obscureText,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: contentPaddingVertical,
                    horizontal: 12.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintText: hintText,
                  suffixIcon: suffixIcon,
                ),
                // restrict
                maxLength: maxLength,
                maxLines: maxLines,
                textInputAction: textInputAction,
                keyboardType: textInputType,
                inputFormatters: textInputType == TextInputType.number
                    ? [FilteringTextInputFormatter.digitsOnly]
                    : [],
                readOnly: realOnly,
                enabled: enabled,
              ),
            ),
            if (button != null) const SizedBox(width: 12.0),
            if (button != null) button!,
          ],
        ),
      ],
    );
  }
}
