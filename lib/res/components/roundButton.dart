import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/res/colors.dart';

Widget roundButton({final String? title, final bool? loading, final VoidCallback?onpress }) {
  return InkWell(
    onTap: onpress,
    child: Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(color: AppColors.blackColor,borderRadius: BorderRadius.circular(20)),
      child: loading!?const CircularProgressIndicator(): Center(child: Text(title!,style: const TextStyle(color: AppColors.whiteColor),)),
    ),
  );
}
