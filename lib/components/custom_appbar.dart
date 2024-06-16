// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omwaynews/config/app_colors.dart';
import 'package:omwaynews/config/asset_path.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String titletext;
  final VoidCallback? onLeadingTap;
  final bool? isCenterTitle;
  final Color? statusBarColor;
  final Brightness? statusBarBrightness;
  final Brightness? statusBarIconBrightness;
  const CustomAppBar({
    super.key,
    required this.titletext,
    this.onLeadingTap,
    this.isCenterTitle,
    this.statusBarColor,
    this.statusBarBrightness,
    this.statusBarIconBrightness,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titletext,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black2cColor,
              fontFamily: "Poppins")),
      centerTitle: isCenterTitle,
      leading: InkWell(
        onTap: onLeadingTap ??
            () {
              Navigator.of(context).pop();
            },
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              AssetPath.arrowBackIcon,
              color: AppColors.primaryColor,
              height: 14.18,
              width: 18.78,
            ),
          ),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: statusBarColor ?? AppColors.appBarColor,
          statusBarBrightness: statusBarBrightness ?? Brightness.light,
          statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark),
    );
  }
}
