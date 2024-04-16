import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_dat_test_app/src/theme.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.title,
    this.subTitle,
    this.prefix,
    this.focusNode,
    this.controller,
    this.readOnly = false,
    this.inputFormatter,
    this.labelText,
    this.helperText,
    this.labelStyle,
    this.textInputAction,
    this.isEmail = false,
    this.isPhone = false,
    this.isPassword = false,
    this.autovalidate = false,
    this.isDark = false,
    this.isMoney = false,
    this.textColor = Colors.black,
    this.maxLength,
    this.maxLines,
    this.suffix,
    this.suffixIcon,
    this.prefixWidget,
    this.onChanged,
    this.onEditingComplete,
    this.validator,
    this.margin = 0,
    this.onTap,
    this.keyboardType,
  });

  final String? labelText, helperText, prefix, title, subTitle;
  final TextEditingController? controller;
  final Color? textColor;
  final FocusNode? focusNode;
  final Widget? suffix, suffixIcon, prefixWidget;
  final bool? isEmail, isPhone, readOnly, isPassword;
  final bool? autovalidate, isMoney, isDark;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final double? margin;
  final int? maxLength;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatter;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isObscure = true;
  bool _isFocused = false;
  FocusNode myFocusNode = FocusNode();
  bool isValdid = true;

  @override
  Widget build(BuildContext context) {
    final customTextStyle = TextStyle(
      fontSize: 13,
      color: _isFocused ? appColors.purple : appColors.textColor,
      fontWeight: FontWeight.w400,
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (widget.title == null)
            const SizedBox.shrink()
          else if (widget.subTitle == null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                widget.title ?? '',
                style: customTextStyle,
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RichText(
                text: TextSpan(
                  text: widget.title ?? '',
                  children: [
                    TextSpan(
                      text: widget.subTitle,
                      style: customTextStyle.copyWith(color: appColors.green),
                    )
                  ],
                  style: customTextStyle,
                ),
              ),
            ),
          FocusScope(
            child: Focus(
              onFocusChange: (hasFocus) {
                setState(() {
                  _isFocused = hasFocus;
                });
              },
              child: TextFormField(
                focusNode: myFocusNode,
                maxLength: widget.maxLength,
                textAlignVertical: TextAlignVertical.center,
                textInputAction: widget.textInputAction,
                autovalidateMode: widget.autovalidate!
                    ? AutovalidateMode.onUserInteraction
                    : null,
                controller: widget.controller,
                obscureText: widget.isPassword! && _isObscure,
                maxLines: widget.isPassword! ? 1 : widget.maxLines,
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                validator: widget.validator,
                inputFormatters: widget.inputFormatter ?? [],
                cursorColor: appColors.textColor,
                readOnly: widget.readOnly!,
                onEditingComplete: widget.onEditingComplete,
                keyboardType: widget.keyboardType ??
                    (widget.isEmail!
                        ? TextInputType.emailAddress
                        : widget.isPhone!
                            ? TextInputType.phone
                            : widget.isMoney!
                                ? TextInputType.number
                                : TextInputType.text),
                style: TextStyle(
                  color: appColors.textColor,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  isCollapsed: true,
                  filled: true,
                  fillColor: Colors.grey.withOpacity(.1),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 16, 15),
                  hintText: widget.labelText,
                  helperText: widget.helperText,
                  prefixText: widget.prefix,
                  prefixIcon: widget.prefixWidget,
                  suffix: widget.suffixIcon,
                  suffixIcon: widget.isPassword!
                      ? GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
                          child: _isObscure
                              ? Icon(
                                  Icons.visibility_outlined,
                                  size: 13,
                                  color: appColors.purple,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  size: 13,
                                  color: appColors.purple,
                                ),
                        )
                      : widget.suffix,
                  counterStyle: const TextStyle(fontSize: 0),
                  errorStyle: TextStyle(
                    color: appColors.red,
                    fontWeight: FontWeight.w300,
                  ),
                  hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: appColors.black.withOpacity(.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: _isFocused
                          ? appColors.purple
                          : Colors.grey.withOpacity(.1),
                      width: 1.12,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: appColors.red,
                      width: 1.12,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: appColors.red,
                      width: 1.12,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: _isFocused
                          ? appColors.purple
                          : Colors.grey.withOpacity(.1),
                      width: .5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: const Color(0xFF4F4F4F).withOpacity(0.4),
                      width: 1.12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class AppPhoneField extends StatefulWidget {
//   const AppPhoneField({
//     Key? key,
//     required this.controller,
//     this.focusNode,
//     this.title,
//     this.onInputChanged,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String? title;
//   final FocusNode? focusNode;
//   final Function(PhoneNumber)? onInputChanged;

//   @override
//   State<AppPhoneField> createState() => _AppPhoneFieldState();
// }

// class _AppPhoneFieldState extends State<AppPhoneField> {
//   String initialCountry = 'NG';
//   PhoneNumber number = PhoneNumber(isoCode: 'NG');

//   bool _isFocused = false;
//   FocusNode myFocusNode = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (widget.title == null)
//           const SizedBox.shrink()
//         else
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Text(
//               widget.title ?? '',
//               style: TextStyle(
//                 fontSize: 13,
//                 color: _isFocused ? appColors.purple : appColors.textColor,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         FocusScope(
//           onFocusChange: (hasFocus) {
//             setState(() {
//               _isFocused = hasFocus;
//             });
//           },
//           child: InternationalPhoneNumberInput(
//             onInputChanged: widget.onInputChanged,

//             maxLength: 13,

//             countries: const ['NG', 'dfd'],
//             onInputValidated: (bool value) {
//               log(value.toString());
//             },
//             //+2349088318078
//             selectorConfig: const SelectorConfig(
//               selectorType: PhoneInputSelectorType.DROPDOWN,
//               showFlags: true,
//               leadingPadding: 0,
//             ),
//             ignoreBlank: false,
//             validator: Validator.phone,
//             autoValidateMode: AutovalidateMode.disabled,
//             selectorTextStyle: TextStyle(
//               color: appColors.textColor,
//               fontWeight: FontWeight.w400,
//             ),
//             initialValue: number,
//             textFieldController: widget.controller,
//             formatInput: false,
//             keyboardType: const TextInputType.numberWithOptions(
//                 signed: true, decimal: true),
//             focusNode: myFocusNode,
//             textStyle: TextStyle(
//               color: appColors.textColor,
//               fontWeight: FontWeight.w400,
//             ),
//             spaceBetweenSelectorAndTextField: 0,
//             inputDecoration: InputDecoration(
//               contentPadding: const EdgeInsets.fromLTRB(20, 15, 16, 15),
//               filled: true,
//               hintText: 'Phone Number',
//               hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
//                     color: appColors.black.withOpacity(.3),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//               errorStyle: TextStyle(
//                 color: appColors.red,
//                 fontWeight: FontWeight.w300,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(5),
//                   bottomRight: Radius.circular(5),
//                 ),
//                 borderSide: BorderSide(
//                   color: _isFocused
//                       ? appColors.purple
//                       : Colors.grey.withOpacity(.1),
//                   width: 1.12,
//                 ),
//               ),
//               errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide(
//                   color: appColors.red,
//                   width: 1.12,
//                 ),
//               ),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide(
//                   color: appColors.red,
//                   width: 1.12,
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//                 borderSide: BorderSide(
//                   color: _isFocused
//                       ? appColors.purple
//                       : Colors.grey.withOpacity(.1),
//                   width: .5,
//                 ),
//               ),
//               disabledBorder: OutlineInputBorder(
//                 borderRadius: const BorderRadius.only(
//                   topRight: Radius.circular(5),
//                   bottomRight: Radius.circular(5),
//                 ),
//                 borderSide: BorderSide(
//                   color: const Color(0xFF4F4F4F).withOpacity(0.4),
//                   width: 1.12,
//                 ),
//               ),
//               enabledBorder: const OutlineInputBorder(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(5),
//                   bottomRight: Radius.circular(5),
//                 ),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             inputBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(5),
//               borderSide: BorderSide(
//                 color:
//                     _isFocused ? appColors.purple : Colors.grey.withOpacity(.1),
//                 width: 1.12,
//               ),
//             ),
//             onSaved: (PhoneNumber number) {
//               log('On Saved: $number');
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
