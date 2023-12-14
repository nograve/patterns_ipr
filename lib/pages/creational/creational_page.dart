import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/widgets/pattern_card.dart';
import 'package:snowfall/snowfall.dart';

class CreationalPage extends StatefulWidget {
  const CreationalPage({super.key});

  static const routeName = '/';

  @override
  State<CreationalPage> createState() => _CreationalPageState();
}

class _CreationalPageState extends State<CreationalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Creational patterns'),
      ),
      body: SnowfallWidget(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.only(left: 12.w, top: 12.h, right: 12.w),
          child: ListView.separated(
            itemCount: 4,
            separatorBuilder: (_, __) => SizedBox(height: 6.h),
            itemBuilder: (_, __) => const PatternCard(),
          ),
        ),
      ),
    );
  }
}
