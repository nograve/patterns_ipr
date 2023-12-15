import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patterns_ipr/pages/creational/data/creational_patterns.dart';
import 'package:patterns_ipr/widgets/pattern_card.dart';
import 'package:snowfall/snowfall.dart';

class CreationalPage extends StatefulWidget {
  const CreationalPage({super.key});

  static const routeName = '/creational';

  @override
  State<CreationalPage> createState() => _CreationalPageState();
}

class _CreationalPageState extends State<CreationalPage> {
  bool _snowflakesEnabled = true;

  final _patterns = [
    CreationalPatterns.factoryMethod,
    CreationalPatterns.builder,
    CreationalPatterns.prototype,
    CreationalPatterns.singleton,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creational patterns'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onSnowfallButtonPressed,
        child: Icon(
          _snowflakesEnabled ? Icons.cloud : Icons.cloud_outlined,
          color: Colors.grey,
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              SnowfallWidget(
                isEnabled: _snowflakesEnabled,
                numberOfSnowflakes: 10,
                color: Colors.grey,
                maxSize: 50,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 12.h, right: 12.w),
                  child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (_, __) => SizedBox(height: 6.h),
                    itemBuilder: (_, index) => PatternCard(
                      currentRoute: CreationalPage.routeName,
                      pattern: _patterns[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSnowfallButtonPressed() {
    setState(() {
      _snowflakesEnabled = !_snowflakesEnabled;
    });
  }
}
