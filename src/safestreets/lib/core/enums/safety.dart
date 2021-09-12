import 'package:json_annotation/json_annotation.dart';

enum Safety {
  @JsonValue(4)
  very_high,

  @JsonValue(3)
  high,

  @JsonValue(2)
  moderate,

  @JsonValue(1)
  low,

  @JsonValue(0)
  very_low
}
