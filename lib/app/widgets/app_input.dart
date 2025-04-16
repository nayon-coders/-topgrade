import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuwait_elearing/utility/app_color.dart';
class AppInput extends StatelessWidget {
   AppInput({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
     this.onChanged,
     this.onTap,
     this.keyboardType = TextInputType.text,
     this.suffixIcon,
      this.prefixIcon,
     this.readOnly = false,
     this.maxLine = 1,
     this.titleColor = AppColor.primaryColor,
     this.filledColor = AppColor.inputFieldColor,
     this.filledTextColor = AppColor.primaryColor
  });

  final String title;
  final String hintText;
  final TextEditingController controller;
  String? Function(String?)? validator;
   Function(String)? onChanged;
   Function()? onTap;
   final TextInputType keyboardType;
   final Widget? prefixIcon;
   final Widget? suffixIcon;
   final bool readOnly;
   final int maxLine;
   final Color titleColor;
   final Color filledColor;
   final Color filledTextColor;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: GoogleFonts.finlandica(
              color: titleColor,
              fontSize: 16,
              fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: 5,),
        SizedBox(
          //height: maxLine > 1 ? 100 : 40,
          child: TextFormField(
            maxLines: maxLine,
             controller: controller,
            readOnly: readOnly,
            onChanged: onChanged,
            onTap: onTap,
            keyboardType: keyboardType,
            style: GoogleFonts.finlandica(
                color: filledTextColor,
                fontSize: 13,
                fontWeight: FontWeight.w600
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              hintText:hintText,
              filled: true,
              fillColor: filledColor,
              border: OutlineInputBorder(
                  borderRadius:  maxLine > 1 ? BorderRadius.circular(30) : BorderRadius.circular(100),
                  borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius:  maxLine > 1 ? BorderRadius.circular(30) : BorderRadius.circular(100),
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius:  maxLine > 1 ? BorderRadius.circular(30) : BorderRadius.circular(100),
                  borderSide: BorderSide.none
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon
            ),
            validator: (v){
              if(v!.isEmpty) {
                return "Filled must not be empty";
              } else
                return null;
            },
          ),
        )
      ],
    );
  }
}