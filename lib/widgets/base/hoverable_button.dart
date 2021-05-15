import 'package:flutter/material.dart';
// ignore: prefer_relative_imports
import 'package:flutter_boilerplate_starter/constants/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HoverableButton extends StatefulWidget {
  final String text;
  final Color defaultColor;
  final Color hoverColor;
  final double size;
  final IconData iconData;
  final Function onPressed;

  const HoverableButton({
    @required this.text,
    @required this.defaultColor,
    @required this.hoverColor,
    @required this.size,
    @required this.iconData,
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  _HoverableButtonState createState() => _HoverableButtonState();
}

class _HoverableButtonState extends State<HoverableButton> {
  Color currentButtonColor;

  @override
  void initState() {
    currentButtonColor = widget.defaultColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: MouseRegion(
        onHover: (event) {
          setState(() => currentButtonColor = widget.hoverColor);
        },
        onExit: (evevnt) {
          setState(() => currentButtonColor = widget.defaultColor);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              widget.iconData,
              color: currentButtonColor,
              size: widget.size,
            ),
            if (widget.text != null)
              Text(
                widget.text,
                style: AppTextStyles.h1.copyWith(
                  color: currentButtonColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}
