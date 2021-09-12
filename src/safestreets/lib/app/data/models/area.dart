import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:safestreets/core/enums/safety.dart';

import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable()
class Area extends Equatable {
  final int areaID;
  final Safety safety;
  final int numberOfViolations;

  const Area({
    @required this.numberOfViolations,
    @required this.safety,
    @required this.areaID,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);

  @override
  List<Object> get props => [
        safety,
        numberOfViolations,
        areaID,
      ];
}
