import 'package:json_annotation/json_annotation.dart';

enum ImageType {
  @JsonValue(1)
  png,
  
  @JsonValue(2)
  jpg,
  
  @JsonValue(3)
  jpeg,
  
  @JsonValue(4)
  wepb,
}