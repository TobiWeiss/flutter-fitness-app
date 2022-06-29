import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class HoverableTextInput extends StatefulWidget {
  final double width;
  final String labelText;
  final String suffixText;
  final Color defaultColor;
  final Color hoverColor;
  final Function(String change) onChanged;
  final IconData iconData;

  const HoverableTextInput(
      {@required this.width,
      @required this.labelText,
      @required this.onChanged,
      @required this.iconData,
      @required this.defaultColor,
      @required this.hoverColor,
      this.suffixText});

  @override
  _HoverableTextInputState createState() => _HoverableTextInputState();
}

class _HoverableTextInputState extends State<HoverableTextInput> {
  Color currentInputColor;

  @override
  void initState() {
    currentInputColor = widget.defaultColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: MouseRegion(
        onHover: (event) {
          setState(() => currentInputColor = widget.hoverColor);
        },
        onExit: (event) {
          setState(() => currentInputColor = widget.defaultColor);
        },
        child: TextField(
          cursorColor: currentInputColor,
          style: AppTextStyles.regularCopy.copyWith(color: currentInputColor),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: currentInputColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: currentInputColor),
            ),
            hoverColor: AppColors.red,
            prefixIcon: Icon(widget.iconData, color: currentInputColor),
            suffixText: widget.suffixText != null ? 's' : null,
            suffixStyle:
                AppTextStyles.regularCopy.copyWith(color: currentInputColor),
            labelText: widget.labelText,
            labelStyle: AppTextStyles.regularCopyBold
                .copyWith(color: currentInputColor),
          ),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
