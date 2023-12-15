import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page_arguments.dart';

class PatternPage extends StatelessWidget {
  const PatternPage({required this.arguments, super.key});

  static const routeName = 'pattern';

  final PatternPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
        child: Column(
          children: [
            Container(
              height: 180.r,
              width: 180.r,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(arguments.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(arguments.patternName),
            SizedBox(height: 12.h),
            Text(
              arguments.patternDescription,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
