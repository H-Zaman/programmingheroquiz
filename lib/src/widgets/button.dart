import 'package:flutter/material.dart';
import 'package:programmingheroquiz/src/utilities/resources/resources.dart';
import 'package:programmingheroquiz/src/widgets/widgets.dart';

class CButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool loading;
  const CButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(loading) return ;
        onPressed.call();
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6)
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          constraints: loading ? BoxConstraints(
            minHeight: 52,
            maxHeight: 52,
            minWidth: 52,
            maxWidth: 52,
          ) : BoxConstraints(
            minHeight: 52,
            maxHeight: 52,
            minWidth: 100,
            maxWidth: MediaQuery.of(context).size.width
          ),
          child: AnimatedCrossFade(
            duration: Duration(milliseconds: 500),
            crossFadeState: loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: Loader(
              color: AppColor.background,
            ),
            secondChild: Center(
              child: Text(
                label,
                style: AppTextStyle.bold(
                  fontSize: 24,
                  color: AppColor.background
                )
              ),
            ),
          )
        ),
      ),
    );
  }
}
