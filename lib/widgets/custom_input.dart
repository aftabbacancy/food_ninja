import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInput extends StatefulWidget {
  final String prefixIcon;
  final String labelText;
  final bool password;
  final TextEditingController controller;

  const CustomInput({
    super.key,
    required this.labelText,
    this.prefixIcon = "",
    required this.controller,
    this.password = false,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _passwordVisible = false;

  setPasswordVisible() {
    setState(() {
      _passwordVisible = true;
    });
  }

  setPasswordHidden() {
    setState(() {
      _passwordVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(
          color: Color.fromRGBO(59, 59, 59, 1),
        ),
        obscureText: widget.password
            ? !_passwordVisible
                ? true
                : false
            : false,
        enableSuggestions: !widget.password,
        autocorrect: !widget.password,
        controller: widget.controller,
        decoration: widget.prefixIcon == ""
            ? InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(28, 22, 28, 22),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(244, 244, 244, 1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(244, 244, 244, 0.8),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(59, 59, 59, 0.2),
                ),
              )
            : InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 17, 16, 17),
                  child: SvgPicture.asset(
                    widget.prefixIcon,
                    width: 16,
                    height: 20,
                  ),
                ),
                suffixIcon: widget.password
                    ? IconButton(
                        onPressed: () {
                          _passwordVisible
                              ? setPasswordHidden()
                              : setPasswordVisible();
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )
                    : null,
                contentPadding: const EdgeInsets.fromLTRB(28, 22, 28, 22),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(244, 244, 244, 1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(244, 244, 244, 0.8),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(59, 59, 59, 0.2),
                ),
              ),
      ),
    );
  }
}
