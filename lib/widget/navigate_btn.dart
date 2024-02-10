import 'package:flutter/material.dart';
import 'package:task_2_rutvikraval/utils/custColors.dart';

class NavigateBtn extends StatefulWidget {
  final Function onPressed;
  final String text;
  const NavigateBtn({super.key, required this.onPressed, required this.text});

  @override
  State<NavigateBtn> createState() => _NavigateBtnState();
}

class _NavigateBtnState extends State<NavigateBtn> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      // height:  32,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.whiteColor),
            elevation: MaterialStateProperty.all(0),
        ),
        child: Text(
          widget.text,
          style:  TextStyle(
            color: AppColors.main_red_Color,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {
          widget.onPressed();
        },
      ),
    );
  }
}
