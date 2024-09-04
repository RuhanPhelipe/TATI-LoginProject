import 'package:tati0814/common/errors/errors_classes.dart';
import 'package:tati0814/common/errors/errors_messagens.dart';
import 'package:tati0814/common/validators/base_validator.dart';

final class MinLengthStrValidator extends BaseValidator<String?> {
  final int minLength;

  MinLengthStrValidator({this.minLength = 3});

  @override
  bool validate(String? validation) {
    return switch (validation) {
      null => throw DefaultError(MessagesError.nullStringError),
      String _ when validation.length >= minLength =>
        nextValidator?.validate(validation) ?? true,
      _ => throw DefaultError(
          '${MessagesError.shoterStringError} - ($minLength Caracteres)'),
    };
  }
}
