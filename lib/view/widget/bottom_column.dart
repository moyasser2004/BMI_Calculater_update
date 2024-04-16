import 'package:bmi_end/view/widget/third_row.dart';
import 'package:flutter/material.dart';

import '../../core/const/app_const.dart';


class BottomColumn extends StatelessWidget {
  const BottomColumn({
    super.key,
    required this.age,
    required this.weight,
    required this.height,
    required this.isMale
  });

  final bool isMale;
  final String age;
  final String weight;
  final String height;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex: 3,
        child:Column(
          children: [
            ThirdRow(
              h: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(age,style: const TextStyle(fontSize: 13),),
                      const SizedBox(width: 12,),
                      Icon(isMale?Icons.face:Icons.face_4,color: Colors.tealAccent,)
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text("Age",style: TextStyle(fontSize: 13,fontFamily: appFontFamily),),
                ],
              ),
            ),
            ThirdRow(
              h: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(weight,style: const TextStyle(fontSize: 13),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text("Weight",style: TextStyle(fontSize: 11,fontFamily: appFontFamily),),
                ],
              ),
            ),
            ThirdRow(
               h: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height,style: const TextStyle(fontSize: 13),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const Text("Height",style: TextStyle(fontSize: 11,fontFamily: appFontFamily),),
                ],
              ),
            ),
          ],
        )
    );
  }
}
