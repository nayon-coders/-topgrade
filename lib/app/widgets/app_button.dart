import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utility/app_color.dart';


class AppButton extends StatelessWidget {
   AppButton({
    super.key, this.isLoading = false, required this.title, required this.onTap, this.width = 170, this.height = 50
  });

  final String title;
  final VoidCallback onTap;
  final double width;
  final double height;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () => null : onTap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: isLoading ? CircularProgressIndicator.adaptive(backgroundColor: AppColor.white,) : Text(title,
            style: GoogleFonts.finlandica(
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
    );
  }
}
