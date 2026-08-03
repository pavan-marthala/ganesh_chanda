import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_details.freezed.dart';
part 'payment_details.g.dart';

@freezed
abstract class PaymentDetails with _$PaymentDetails {
  const factory PaymentDetails({
    @Default('') String upiId,
    @Default('') String bankName,
    @Default('') String accountHolderName,
    @Default('') String accountNumber,
    @Default('') String ifscCode,
    @Default('') String chequePayeeName,
  }) = _PaymentDetails;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) =>
      _$PaymentDetailsFromJson(json);
}
