import 'package:flutter/material.dart';
import 'package:mac_bro_test/core/theme/app_utils.dart';

import '../../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color color;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry alignment;

  const CustomButton({
    Key? key,
    required this.onTap,
    this.height = 52,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.borderRadius,
    this.color = AppColors.darkGrey,
    this.alignment = Alignment.center,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          onPrimary: AppColors.darkGrey,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
        ).copyWith(
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 0;
            },
          ),
        ),
        child: Container(
          height: height,
          padding: padding,
          alignment: alignment,
          child: child,
        ),
      ),
    );
  }
}
