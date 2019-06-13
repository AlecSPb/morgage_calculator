import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

part 'mort_gage_type.g.dart';

class MortGageType extends EnumClass {
  const MortGageType._(String name) : super(name);

  static const MortGageType annuity = _$annuity;
  static const MortGageType differentiated = _$differentiated;

  static BuiltSet<MortGageType> get values => _$values;

  static MortGageType valueOf(String name) => _$valueOf(name);
}
