import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafas/constant/my_colors.dart';

// class CustomTextField extends StatefulWidget {
//   const CustomTextField({
//     super.key,
//     required this.controller,
//     this.validator,
//     this.focusNode,
//     this.onChanged,
//     this.onSubmitted,
//     this.label,
//     this.hint,
//     this.fillColor,
//     this.isPasswordField = false,
//     this.isEmailField = false,
//     this.icon,
//     this.keyBordType,
//   });
//
//   final bool isEmailField;
//   final bool isPasswordField;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final Function(String?)? onChanged;
//   final Function(String?)? onSubmitted;
//   final String? label;
//   final String? hint;
//   final Color? fillColor;
//   final IconData? icon;
//   final FocusNode? focusNode;
//   final TextInputType? keyBordType;
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         border: Border(top: BorderSide(color: Colors.grey.shade300)),
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade400,
//             offset: Offset(0, 8),
//             blurRadius: 5,
//             spreadRadius: 0.5,
//             blurStyle: BlurStyle.inner,
//           ),
//         ],
//       ),
//       child: TextFormField(
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         focusNode: widget.focusNode,
//         controller: widget.controller,
//         validator: widget.validator,
//         onChanged: widget.onChanged,
//         keyboardType: widget.keyBordType,
//         onFieldSubmitted: widget.onSubmitted,
//         obscureText: widget.isPasswordField ? _obscureText : false,
//         obscuringCharacter: '*',
//         decoration: InputDecoration(
//           icon: Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: Icon(widget.icon),
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           label: widget.label == null ? null : Text(widget.label!),
//           hintText: widget.hint,
//           suffixIcon:
//               widget.isPasswordField
//                   ? IconButton(
//                     icon: Icon(
//                       _obscureText ? Icons.visibility_off : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _obscureText = !_obscureText;
//                       });
//                     },
//                   )
//                   : null,
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24.r),
//             borderSide: BorderSide(color: MyColors.greenNeon),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24.r),
//             borderSide: BorderSide(color: MyColors.greenNeon),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(24.r),
//             borderSide: BorderSide(color: MyColors.greenNeon),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.hint,
    this.fillColor,
    this.isPasswordField = false,
    this.isEmailField = false,
    this.isSearchField = false,
  });

  final bool isEmailField;
  final bool isSearchField;
  final bool isPasswordField;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final String? label;
  final String? hint;
  final Color? fillColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      style: TextStyle(color: MyColors.greenNeon),
      obscureText: widget.isPasswordField ? _obscureText : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        prefix: SizedBox(width: 20.w),
        prefixIcon: widget.isSearchField ? Icon(Icons.search) : null,
        contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.h),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: widget.label == null ? null : Text(widget.label!),
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
        fillColor: widget.fillColor,
        suffixIcon:
            widget.isPasswordField
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : widget.isEmailField
                ? Icon(Icons.email)
                : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: MyColors.greenNeon),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: MyColors.greenNeon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: MyColors.greenNeon),
        ),
      ),
    );
  }
}
