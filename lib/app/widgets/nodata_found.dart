
import 'package:flutter/material.dart';

import 'app_style.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image.asset("assets/images/nodata.png",
            height: 100, width: 100,
          ),
        ),
        SizedBox(height: 10,),
        Center(
          child: Text("No Data Found",
            style: normalText(),
          ),
        )
      ],
    );
  }
}