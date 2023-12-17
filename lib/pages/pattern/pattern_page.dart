import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page_arguments.dart';
import 'package:patterns_ipr/pages/pattern/widgets/code_card.dart';
import 'package:patterns_ipr/res/style/styles.dart';
import 'package:share_plus/share_plus.dart';

class PatternPage extends StatelessWidget {
  const PatternPage({required this.arguments, super.key});

  static const routeName = 'pattern';

  final PatternPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    final pattern = arguments.pattern;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          /// Share button
          IconButton(
            onPressed: _onSharePressed,
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
              /// Pattern image
              Container(
                height: 180.r,
                width: 180.r,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(pattern.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 6.h),

              /// Pattern name
              Text(
                pattern.name,
                style: Styles.headlineSmall24,
              ),
              SizedBox(height: 6.h),

              /// Pattern description
              Text(
                pattern.description,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),

              /// Code realisation
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8.w),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Code realisation',
                      style: Styles.titleMedium18,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CodeCard(codeText: pattern.code),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSharePressed() {
    Share.share(
      arguments.pattern.code,
    );
  }
}
