import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omwaynews/config/app_colors.dart';


class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;
  final bool isPassword;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isRequired;
  final VoidCallback? onTap;
  final bool readOnly;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? hintStyle;
  final bool isFilled;
  final bool isNewLabel;
  final TextAlign? textAlign;
  final double? borderRadius;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool? autoFocus;
  final double? fontSize;
  final bool? isEdit;

  final TextInputAction? textInputAction;
  final Color? titleColor;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.isPassword = false,
    this.validator,
    this.isEdit = false,
    this.keyboardType,
    this.focusNode,
    this.hintText,
    this.fontSize,
    this.isRequired = false,
    this.readOnly = false,
    this.onTap,
    this.maxLines,
    this.contentPadding,
    this.suffixIcon,
    this.isFilled = true,
    // this.labelStyle,
    this.isNewLabel = false,
    this.prefixIcon,
    this.onSubmitted,
    this.onChanged,
    this.initialValue,
    this.autoFocus = false,
    this.textInputAction,
    this.textAlign,
    this.prefixText,
    this.borderRadius,
    this.hintStyle,
    this.titleColor,
    this.inputFormatters,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          Row(
            children: [
              Text(
                widget.labelText,
                style: widget.isNewLabel
                    ? TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: widget.fontSize ?? 12,
                        color: widget.titleColor ?? AppColors.blueColor)
                    : null,
              ),
              widget.isRequired
                  ? const Text(
                      ' *',
                      style: TextStyle(color: AppColors.redColor),
                    )
                  : const SizedBox.shrink()
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
        TextFormField(
          textAlign: TextAlign.start,
          initialValue: widget.initialValue,
          readOnly: widget.readOnly,
          keyboardType: widget.keyboardType,
          obscureText: (widget.isPassword) ? _showPassword : false,
          controller: widget.controller,
          autofocus: widget.autoFocus ?? false,
          validator: widget.validator,
          focusNode: widget.focusNode,
          cursorColor: AppColors.primaryColor,
          onTap: widget.onTap,
          style: TextStyle(
              color: widget.readOnly
                  ? AppColors.labelTextColor
                  : AppColors.labelTextColor,
              fontSize: 14.0,
              fontWeight: widget.readOnly ? FontWeight.w500 : FontWeight.w500),
          maxLines: widget.maxLines ?? 1,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatters,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            prefixText: widget.prefixText,
            prefixStyle:
                const TextStyle(color: AppColors.primaryColor, fontSize: 16),
            fillColor:
                widget.isFilled ? AppColors.textFillColor : Colors.white10,
            filled: true,
            errorMaxLines: 2,
            border: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.borderColor, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.borderColor, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.redColor, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.borderColor, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.0),
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ??
                const TextStyle(
                    color: AppColors.hintTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon ??
                (widget.isPassword
                    ? InkWell(
                        onTap: () =>
                            setState(() => _showPassword = !_showPassword),
                        child: _showPassword
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                size: 18.0,
                                color: AppColors.labelTextColor,
                              )
                            : const Icon(Icons.visibility_outlined,
                                size: 18.0, color: AppColors.labelTextColor),
                      )
                    : null),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
          ),
          onFieldSubmitted: widget.onSubmitted,
        ),
      ],
    );
  }
}
