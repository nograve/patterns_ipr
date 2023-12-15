import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:patterns_ipr/data/models/pattern_model.dart';
import 'package:patterns_ipr/pages/pattern/pattern_page.dart';

class PatternCard extends StatefulWidget {
  const PatternCard({required this.pattern, super.key});

  final PatternModel pattern;

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {
  @override
  Widget build(BuildContext context) {
    final pattern = widget.pattern;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Container(
                width: 60.r,
                height: 60.r,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(pattern.imagePath)),
                ),
              ),
            ),
            SizedBox(
              width: 180.w,
              child: Column(
                children: [
                  Text(pattern.name),
                  Text(
                    pattern.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
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
    context.pushNamed(PatternPage.routeName);
  }
}
