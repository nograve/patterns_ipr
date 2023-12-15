import 'package:patterns_ipr/data/models/pattern_model.dart';
import 'package:patterns_ipr/generated/assets.dart';

class BehavioralPatterns {
  static final iterator = PatternModel(
    name: 'Iterator',
    description:
        'Iterator is a behavioral design pattern that lets you traverse elements of a collection without exposing its underlying representation (list, stack, tree, etc.).',
    imagePath: Assets.imagesIterator,
  );

  static final observer = PatternModel(
    name: 'Observer',
    description:
        'Observer is a behavioral design pattern that lets you define a subscription mechanism to notify multiple objects about any events that happen to the object they’re observing.',
    imagePath: Assets.imagesObserver,
  );

  static final state = PatternModel(
    name: 'State',
    description:
        'State is a behavioral design pattern that lets an object alter its behavior when its internal state changes. It appears as if the object changed its class.',
    imagePath: Assets.imagesState,
  );

  static final strategy = PatternModel(
    name: 'Strategy',
    description:
        'Strategy is a behavioral design pattern that lets you define a family of algorithms, put each of them into a separate class, and make their objects interchangeable.',
    imagePath: Assets.imagesStrategy,
  );
}
