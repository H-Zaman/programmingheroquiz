import 'package:flutter/material.dart';
import 'package:programmingheroquiz/src/utilities/resources/resources.dart';

class CButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const CButton({
    Key? key,
    required this.onPressed,
    required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6)
      ),
      fillColor: Colors.white,
      constraints: BoxConstraints(
        minHeight: 42,
        minWidth: double.infinity
      ),
      child: Text(
        label,
        style: AppTextStyle.bold(
          fontSize: 24,
          color: AppColor.background
        )
      ),
    );
  }
}
