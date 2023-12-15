import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/pages/structural/data/structural_patterns.dart';
import 'package:patterns_ipr/widgets/pattern_card.dart';

class StructuralPage extends StatefulWidget {
  const StructuralPage({super.key});

  static const routeName = '/structural';

  @override
  State<StructuralPage> createState() => _StructuralPageState();
}

class _StructuralPageState extends State<StructuralPage> {
  final _patterns = [
    StructuralPatterns.adapter,
    StructuralPatterns.bridge,
    StructuralPatterns.decorator,
    StructuralPatterns.facade,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Structural patterns'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, top: 12.h, right: 12.w),
        child: ListView.separated(
          itemCount: 4,
          separatorBuilder: (_, __) => SizedBox(height: 6.h),
          itemBuilder: (_, index) => PatternCard(
            currentRoute: StructuralPage.routeName,
            pattern: _patterns[index],
          ),
        ),
      ),
    );
  }
}
