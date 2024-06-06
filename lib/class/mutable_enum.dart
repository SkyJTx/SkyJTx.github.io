abstract class MutableEnum {
  static final _baseHashValue = 'MutableEnum'.hashCode;
  static List<MutableEnum> values = [];

  String name;
  int get index => values.indexOf(this);

  MutableEnum(this.name);

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) => other is MutableEnum && other.name == name;

  @override
  int get hashCode => Object.hashAll([_baseHashValue, name.hashCode]);
}