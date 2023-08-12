import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qrlog_frontend/app/core/values/colors.dart';

import '../../core/theme/text_theme.dart';

class AtomTextField extends StatefulWidget {
  const AtomTextField({
    Key? key,
    this.controller,
    this.backgroundColor = grey30,
    this.textColor = grey50,
    this.isObscureText = false,
    this.isUnderlined = true,
    this.withBorder = false,
    this.underlineColor = Colors.grey,
    this.leftPadding = 4,
    this.suffixIconPng,
    this.prefixIconSvg,
    this.prefixIconSvgSize = 17,
    this.prefixIconSvgPaddingRight = 0,
    this.hintText,
    this.validator,
    this.isRequired = false,
    this.onTap,
    this.onChanged,
    this.height = 51,
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.withOverlayError = false,
    this.prefix,
    this.startHorizontalPosition = 0.0,
    this.showPropertyName = true,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool isObscureText;
  final bool isUnderlined;
  final bool withBorder;
  final Color underlineColor;
  final Color backgroundColor;
  final Color textColor;
  final String? suffixIconPng;
  final String? prefixIconSvg;
  final double prefixIconSvgSize;
  final double prefixIconSvgPaddingRight;
  final String? hintText;
  final double leftPadding;
  final String? Function(String?)? validator;
  final bool isRequired;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final double height;
  final TextInputType textInputType;
  final int? maxLines;
  final bool withOverlayError;
  final Widget? prefix;
  final double startHorizontalPosition;
  final bool showPropertyName;

  @override
  _AtomTextFieldState createState() => _AtomTextFieldState();
}

class _AtomTextFieldState extends State<AtomTextField> {
  FocusNode myFocusNode = FocusNode();
  late bool isValidData;
  late String? errorMsg;
  late LayerLink layerLink;
  GlobalKey inputKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;

  @override
  void initState() {
    layerLink = LayerLink();
    isValidData = true;
    errorMsg = null;
    myFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    closeOverlay();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: !widget.withBorder
                  ? null
                  : Border.all(
                      color: widget.underlineColor,
                      width: 1,
                    ),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: widget.leftPadding, right: 4.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: (!widget.isUnderlined || !myFocusNode.hasFocus) &&
                          isValidData
                      ? null
                      : Border(
                          bottom: BorderSide(
                            color: isValidData || !widget.withOverlayError
                                ? primaryColor
                                : Colors.red,
                            width: 2.0,
                          ),
                        ),
                ),
                child: Row(
                  children: [
                    if (widget.prefixIconSvg != null)
                      Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: widget.prefixIconSvgPaddingRight),
                        child: SvgPicture.asset(
                          widget.prefixIconSvg!,
                          height: widget.prefixIconSvgSize,
                          width: widget.prefixIconSvgSize,
                        ),
                      ),
                    if (widget.prefix != null) widget.prefix!,
                    Expanded(
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if (widget.withOverlayError) {
                            if (hasFocus) {
                              initOverlay(context);
                            } else {
                              closeOverlay();
                            }
                          }
                        },
                        child: CompositedTransformTarget(
                          link: layerLink,
                          child: TextFormField(
                            key: inputKey,
                            controller: widget.controller,
                            keyboardType: widget.textInputType,
                            maxLines: widget.maxLines,
                            onTap: widget.onTap,
                            onChanged: (value) {
                              if (widget.onChanged != null) {
                                widget.onChanged!.call(value);
                              }
                              validate(value);
                            },
                            focusNode: myFocusNode,
                            expands: widget.maxLines == null ? true : false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: widget.prefixIconSvg != null ? 4 : 12,
                                  bottom: 0,
                                  top: widget.maxLines == null ? 16 : 0),
                              border: InputBorder.none,
                              hintText: widget.hintText,
                              hintStyle: TextStyle(
                                  color: widget.textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto"),
                              errorStyle: styleRedAccentColor,
                              errorMaxLines: 2,
                            ),
                            validator: validate,
                            cursorColor: Colors.black,
                            obscureText: widget.isObscureText,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        ),
                      ),
                    ),
                    if (widget.suffixIconPng != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Image.asset(
                          widget.suffixIconPng!,
                          height: 30,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (errorMsg != null && !widget.withOverlayError)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              errorMsg ?? "",
              style: const TextStyle(color: Colors.red),
            ),
          )
      ],
    );
  }

  String? validate(String? value) {
    String? oldMsg = errorMsg;

    if (widget.isRequired && value!.trim().isEmpty) {
      errorMsg = widget.showPropertyName
          ? "the-field".tr + widget.hintText! + "is-required".tr
          : "this-field".tr + "is-required".tr;
    } else {
      errorMsg = null;
    }

    if (errorMsg == null && widget.validator != null) {
      errorMsg = widget.validator!(value);
    }

    if (errorMsg == null) {
      isValidData = true;
    } else {
      isValidData = false;
    }

    if (widget.withOverlayError) {
      if (myFocusNode.hasFocus) {
        initOverlay(context);
      } else {
        closeOverlay();
      }
    }

    if (oldMsg != errorMsg) {
      setState(() {});
    }
    return isValidData
        ? null
        : widget.withOverlayError
            ? ""
            : "";
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => isValidData
          ? const SizedBox()
          : FittedBox(
              fit: BoxFit.cover,
              child: CompositedTransformFollower(
                link: layerLink,
                offset: Offset(widget.startHorizontalPosition, 55),
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Material(
                    color: Colors.transparent,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            errorMsg ?? "",
                            style: const TextStyle(color: white),
                          ),
                        )),
                  ),
                ),
              ),
            ),
    );
  }

  void initOverlay(context) {
    closeOverlay();
    _overlayEntry = _createOverlayEntry();
    _overlayState = Overlay.of(context!);
    _overlayState!.insert(_overlayEntry!);
  }

  void closeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
