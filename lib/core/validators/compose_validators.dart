typedef FieldValidator = String? Function(String? value);

FieldValidator composeValidators(List<FieldValidator> validators) {
  return (String? value) {
    for (final validator in validators) {
      final error = validator(value);
      if (error != null) {
        return error;
      }
    }

    return null;
  };
}
