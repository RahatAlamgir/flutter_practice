import 'package:flutter_riverpod/legacy.dart';

class SliderModel {
  final double value;
  final bool isDone;

  SliderModel({required this.value, this.isDone = false});

  SliderModel copyWith({double? value, bool? isDone}) {
    return SliderModel(
      value: value ?? this.value,
      isDone: isDone ?? this.isDone,
    );
  }

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      value: (json['value'] as num?)!.toDouble(),
      isDone: json['isDone'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {'value': value, 'isDone': isDone};
}

final sliderProvider = StateProvider<SliderModel>(
  (ref) => SliderModel(value: 1),
);
