import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/pages/behavioral/data/behavioral_patterns.dart';
import 'package:patterns_ipr/widgets/pattern_card.dart';

class BehavioralPage extends StatefulWidget {
  const BehavioralPage({super.key});

  static const routeName = '/behavioral';

  @override
  State<BehavioralPage> createState() => _BehavioralPageState();
}

class _BehavioralPageState extends State<BehavioralPage> {
  final _routes = [
    BehavioralPatterns.iterator,
    BehavioralPatterns.observer,
    BehavioralPatterns.state,
    BehavioralPatterns.strategy,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Behavioral patterns'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, top: 12.h, right: 12.w),
        child: ListView.separated(
          itemCount: 4,
          separatorBuilder: (_, __) => SizedBox(height: 6.h),
          itemBuilder: (_, index) => PatternCard(
            currentRoute: BehavioralPage.routeName,
            pattern: _routes[index],
          ),
        ),
      ),
    );
  }
}
