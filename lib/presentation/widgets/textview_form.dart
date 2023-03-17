import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

typedef FieldValueChange = Function(String value);
class GrayGetTextField extends StatefulWidget {
  final String hint;
  final bool obscure, isVisible;
  final TextEditingController? controller;
  final Function(String? value) onValidate;
  final Function(String? value) valueDidChange;
  final TextInputType inputType;

  const GrayGetTextField({
    Key? key,
    required this.hint,
    required this.obscure,
    this.controller,
    required this.onValidate,
    required this.valueDidChange,
    this.isVisible = false, required this.inputType,
  }) : super(key: key);

  @override
  State<GrayGetTextField> createState() => _GrayGetTextFieldState();
}

class _GrayGetTextFieldState extends State<GrayGetTextField> {
  late bool _obscure;
  @override
  void initState() {
    _obscure = widget.obscure;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) => widget.onValidate(val),
      decoration: InputDecoration(
          fillColor: AppColors.mediumBlueGrey,
          filled: true,
          border: InputBorder.none,
            labelStyle: const TextStyle(color: AppColors.mediumTeal),
        suffixIcon: widget.isVisible
            ? _obscure
            ? IconButton(
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            icon: const Icon(Icons.visibility_off_outlined))
            : IconButton(
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            icon: const Icon(Icons.remove_red_eye))
            : null,
        hintText: widget.hint,
        isDense: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
      obscureText: _obscure,
      keyboardType: widget.inputType,
    );
  }
}