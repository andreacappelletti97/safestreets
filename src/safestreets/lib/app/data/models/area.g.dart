// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) {
  return Area(
    numberOfViolations: json['numberOfViolations'] as int,
    safety: _$enumDecodeNullable(_$SafetyEnumMap, json['safety']),
    areaID: json['areaID'] as int,
  );
}

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'areaID': instance.areaID,
      'safety': _$SafetyEnumMap[instance.safety],
      'numberOfViolations': instance.numberOfViolations,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SafetyEnumMap = {
  Safety.very_high: 4,
  Safety.high: 3,
  Safety.moderate: 2,
  Safety.low: 1,
  Safety.very_low: 0,
};
