import 'package:patterns_ipr/data/models/pattern_model.dart';
import 'package:patterns_ipr/generated/assets.dart';

class CreationalPatterns {
  static final factoryMethod = PatternModel(
    name: 'Factory Method',
    description:
        'Factory Method is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of objects that will be created.',
    imagePath: Assets.imagesFactoryMethod,
  );

  static final builder = PatternModel(
    name: 'Builder',
    description:
        'Builder is a creational design pattern that lets you construct complex objects step by step. The pattern allows you to produce different types and representations of an object using the same construction code.',
    imagePath: Assets.imagesBuilder,
  );

  static final prototype = PatternModel(
    name: 'Prototype',
    description:
        'Prototype is a creational design pattern that lets you copy existing objects without making your code dependent on their classes.',
    imagePath: Assets.imagesPrototype,
  );

  static final singleton = PatternModel(
    name: 'Singleton',
    description:
        'Singleton is a creational design pattern that lets you ensure that a class has only one instance, while providing a global access point to this instance.',
    imagePath: Assets.imagesSingleton,
  );
}
