import '../errors/errors_classes.dart';
import '../errors/errors_messagens.dart';
import 'base_validator.dart';

final class EmptyStrValidator extends BaseValidator<String?> {
  EmptyStrValidator();

  @override
  bool validate(String? validation) {
    return switch (validation) {
      null => throw DefaultError(MessagesError.nullStringError),
      String v when v.trim().isEmpty => throw DefaultError('${MessagesError.emptyFieldError}'), 
      _ => nextValidator?.validate(validation) ?? true,
    };
  }
}
