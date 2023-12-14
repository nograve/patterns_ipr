import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/generated/assets.dart';

class PatternCard extends StatefulWidget {
  const PatternCard({super.key});

  @override
  State<PatternCard> createState() => _PatternCardState();
}

class _PatternCardState extends State<PatternCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Container(
              width: 60.r,
              height: 60.r,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.imagesAdapter)),
              ),
            ),
          ),
          SizedBox(
            width: 180.w,
            child: const Column(
              children: [
                Text('Adapter'),
                Text(
                  'Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: _onSeeMorePressed,
            child: const Text('Details'),
          ),
        ],
      ),
    );
  }

  void _onSeeMorePressed() {}
}
