import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomPhoneTextField extends StatefulWidget {
  final String? Function(String? value)? validator;
  final String? labelText;
  final bool? showError;
  final TextEditingController controller;
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
  final BuildContext? context;
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
  final bool required;

  const CustomPhoneTextField({
    Key? key,
    this.labelText,
    this.showError,
    this.validator,
    required this.controller,
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
    this.context,
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
    this.required = false,
  }) : super(key: key);

  @override
  State<CustomPhoneTextField> createState() => _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends State<CustomPhoneTextField> {
  String? _prefixText;
  var focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          _prefixText = '+998 ';
        });
      } else {
        if (widget.controller.text.isEmpty) {
          setState(() {
            _prefixText = null;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RichText(
              text: TextSpan(
                text: widget.labelText ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
                children: widget.required
                    ? [
                        const TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.red,
                          ),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        TextFormField(
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          style: AppTextStyles.appTitleSearch,
          obscureText: widget.obscureText ?? false,
          readOnly: widget.readOnly,
          controller: widget.controller,
          focusNode: focusNode,
          onTap: widget.onTap,
          autofocus: widget.autoFocus,
          textCapitalization: TextCapitalization.none,
          onChanged: widget.onChanged,
          onFieldSubmitted: (term) => _fieldFocusChange(
            context,
            focusNode,
            widget.nextFocus,
          ),
          obscuringCharacter: '*',
          textInputAction: widget.inputAction,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixText: widget.suffixText,
            suffixStyle: widget.suffixStyle ??
                const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkGrey,
                ),
            suffixIcon: widget.suffixIcon,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
            isDense: true,
            filled: true,
            prefixText: _prefixText,
            prefixStyle: AppTextStyles.searchNotFound,
            hintText: _prefixText == null ? widget.hintText : 'XX XXX XX XX',
            fillColor: widget.fillColor ?? AppColors.grey,
            hintStyle:
                AppTextStyles.searchNotFound.copyWith(color: AppColors.grey),
            focusedBorder: widget.focusedBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.assets, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
            enabledBorder: widget.enabledBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
            errorBorder: widget.errorBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            focusedErrorBorder: widget.focusedErrorBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.red, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
            errorText: widget.showError ?? false ? widget.errorText : null,
          ),
          cursorColor: AppColors.assets,
          keyboardType: widget.keyboardType,
          onEditingComplete: widget.onComplete,
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
