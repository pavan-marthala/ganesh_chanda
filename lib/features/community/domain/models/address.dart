import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    @Default('') String street,
    @Default('') String locality,
    @Default('') String city,
    @Default('') String district,
    @Default('') String state,
    @Default('') String country,
    @Default('') String pinCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
