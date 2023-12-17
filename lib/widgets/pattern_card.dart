import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/application/router/router.dart';
import 'package:patterns_ipr/data/models/pattern_model.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page_arguments.dart';

class PatternCard extends StatefulWidget {
  const PatternCard({
    required this.currentRoute,
    required this.pattern,
    super.key,
  });

  final PatternModel pattern;

  final String currentRoute;

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {
  @override
  Widget build(BuildContext context) {
    final pattern = widget.pattern;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Pattern image
            Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: Container(
                width: 60.r,
                height: 60.r,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(pattern.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 180.w,
              child: Column(
                children: [
                  /// Pattern name
                  Text(pattern.name),
                  SizedBox(height: 2.h),

                  /// Pattern description
                  Text(
                    pattern.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            /// Details button
            TextButton(
              onPressed: _onDetailsPressed,
              child: const Text('Details'),
            ),
          ],
        ),
      ),
    );
  }

  void _onDetailsPressed() {
    final pattern = widget.pattern;

    router.go(
      '${widget.currentRoute}/${PatternPage.routeName}',
      extra: PatternPageArguments(pattern: pattern),
    );
  }
}
