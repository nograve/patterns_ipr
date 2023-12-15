import 'package:patterns_ipr/data/models/pattern_model.dart';
import 'package:patterns_ipr/generated/assets.dart';

class StructuralPatterns {
  static final adapter = PatternModel(
    name: 'Adapter',
    description:
        'Adapter is a structural design pattern that allows objects with incompatible interfaces to collaborate.',
    imagePath: Assets.imagesAdapter,
  );

  static final bridge = PatternModel(
    name: 'Bridge',
    description:
        'Bridge is a structural design pattern that lets you split a large class or a set of closely related classes into two separate hierarchies—abstraction and implementation—which can be developed independently of each other.',
    imagePath: Assets.imagesBridge,
  );

  static final decorator = PatternModel(
    name: 'Decorator',
    description:
        'Decorator is a structural design pattern that lets you attach new behaviors to objects by placing these objects inside special wrapper objects that contain the behaviors.',
    imagePath: Assets.imagesDecorator,
  );

  static final facade = PatternModel(
    name: 'Facade',
    description:
        'Facade is a structural design pattern that provides a simplified interface to a library, a framework, or any other complex set of classes.',
    imagePath: Assets.imagesFacade,
  );
}
