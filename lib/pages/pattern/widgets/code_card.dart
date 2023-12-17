import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeCard extends StatelessWidget {
  const CodeCard({required this.codeText, super.key});

  final String codeText;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Text(codeText),
      ),
    );
  }
}
