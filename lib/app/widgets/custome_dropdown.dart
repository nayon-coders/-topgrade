import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kuwait_elearing/utility/app_color.dart';



class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({super.key,
    required this.items,
    this.value,
    required this.hint,
    required this.onChange,
    this.selectedItemBuilder,
    this.fillColor = Colors.white,
    this.borderSide =BorderSide.none,
  });

  final List<T> items;
  final T? value;
  final String hint;
  final ValueChanged<T?>onChange;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Color fillColor;
  final BorderSide? borderSide;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: DropdownButtonFormField2<T>(
        isExpanded: true,
        decoration: InputDecoration(
          fillColor: AppColor.inputFieldColor,
          filled: true,
          contentPadding:EdgeInsets.zero,
          border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: borderSide ?? BorderSide(color: Colors.grey.shade100, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide:  borderSide ?? BorderSide(color: Colors.grey.shade100, width: 1), // এখানে রঙ কমানো যাবে
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: borderSide ?? BorderSide(color: Colors.grey.shade100, width: 1),// ফোকাস হলে রঙ থাকবে
          ),


        ),


        items:items.map((item) => DropdownMenuItem<T>(
          value: item,
          child: Text("$item",style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),),
        )).toList(),

        value: value,
        hint: Text(hint, style: TextStyle(fontSize: 14,fontWeight:FontWeight.w400,color: Colors.black,),),
        onChanged: onChange,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData:  ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color:Colors.grey,
          ),
          iconSize: 25,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade100)
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        dropdownSearchData: DropdownSearchData(

        ),


      ),
    );
  }
}
