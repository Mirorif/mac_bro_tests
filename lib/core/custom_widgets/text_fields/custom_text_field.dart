import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final String? autoFillHints;
  final String? Function(String? value)? validator;
  final String? labelText;
  final bool? showError;
  final bool required;
  final TextEditingController? controller;
  final bool autoFocus;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final bool? obscureText;
  final Function()? onTap, onComplete;
  final bool readOnly;
  final String? suffixText;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? suffixStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder,
      enabledBorder,
      errorBorder,
      focusedErrorBorder;
  final TextAlign textAlign;
  final int maxLines;
  final bool isInitialHint;
  final bool isEditSale;

  const CustomTextField(
      {Key? key,
        this.autoFillHints,
      this.validator,
      this.labelText,
      this.showError,
      this.controller,
      this.autoFocus = false,
      this.onChanged,
      this.keyboardType,
      this.prefixText,
      this.errorText,
      this.inputAction,
      this.currentFocus,
      this.nextFocus,
      this.obscureText,
      this.hintText,
      this.onTap,
      this.readOnly = false,
      this.suffixText,
      this.suffixIcon,
      this.suffixStyle,
      this.prefixIcon,
      this.inputFormatters,
      this.fillColor,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.errorBorder,
      this.focusedErrorBorder,
      this.onComplete,
      this.textAlign = TextAlign.start,
      this.maxLines = 1,
      this.required = false,
      this.isInitialHint = false,
      this.isEditSale = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          RichText(
            text: TextSpan(
              text: labelText!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.darkGrey,
              ),
              children: required
                  ? [
                      const TextSpan(
                        text: ' *',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ]
                  : [],
            ),
          ),
        if (labelText != null) const SizedBox(height: 12),
        TextFormField(
          autofillHints: [autoFillHints?? ''],
          validator: validator,
          inputFormatters: inputFormatters,
          style: isInitialHint
              ? const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrey,
                )
              : const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrey,
                ),
          obscureText: obscureText ?? false,
          readOnly: readOnly,
          controller: controller,
          focusNode: currentFocus,
          onTap: onTap,
          autofocus: autoFocus,
          textCapitalization: TextCapitalization.none,
          onChanged: onChanged,
          onFieldSubmitted: (term) => _fieldFocusChange(
            context,
            currentFocus,
            nextFocus,
          ),
          textAlign: textAlign,
          obscuringCharacter: '*',
          maxLines: maxLines,
          textInputAction: inputAction,
          decoration: InputDecoration(
            suffixText: suffixText,
            suffixStyle: suffixStyle ??
                const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrey,
                ),
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
            isDense: true,
            filled: true,
            prefixText: prefixText,
            prefixStyle: AppTextStyles.appTitleSearch,
            hintText: hintText,
            fillColor: fillColor ?? AppColors.grey,
            hintStyle: isInitialHint
                ? const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  )
                : const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
            focusedBorder: focusedBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.assets, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            enabledBorder: enabledBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            errorBorder: errorBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            focusedErrorBorder: focusedErrorBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            errorText: showError ?? false ? errorText : null,
          ),
          cursorColor: AppColors.assets,
          keyboardType: keyboardType,
          onEditingComplete: onComplete,
        ),
      ],
    );
  }

  _fieldFocusChange(
    BuildContext context,
    FocusNode? currentFocus,
    FocusNode? nextFocus,
  ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}
