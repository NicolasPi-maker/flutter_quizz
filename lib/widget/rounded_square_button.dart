import 'package:flutter/material.dart';

class RoundedSquareButton extends StatefulWidget {
  const RoundedSquareButton(
    {
      super.key,
      required this.buttonText,
      this.textColor,
      this.backgroundColor,
      this.onPressedCallback
    }
  );

  final String buttonText;
  final Color? textColor;
  final Color? backgroundColor;
  final Function? onPressedCallback;

  @override
  State<RoundedSquareButton> createState() => _RoundedSquareButtonState();
}

class _RoundedSquareButtonState extends State<RoundedSquareButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor ?? Colors.lightBlueAccent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(10, 10))
          ),
      ),
      onPressed: () { widget.onPressedCallback!(); },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: widget.textColor ?? Colors.white,
            fontSize: 20
          ),
        ),
      )
    );
  }
}
