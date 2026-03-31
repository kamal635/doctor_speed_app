import '../errors/failure.dart';

sealed class Result<T> {
  const Result();

  R fold<R>({
    required R Function(T value) onOk,
    required R Function(Failure failure) onErr,
  }) {
    switch (this) {
      case Ok<T>(:final value):
        return onOk(value);
      case Err<T>(:final failure):
        return onErr(failure);
    }
  }

  bool get isOk => this is Ok<T>;

  bool get isErr => this is Err<T>;

  T? get valueOrNull {
    return switch (this) {
      Ok<T>(:final value) => value,
      Err<T>() => null,
    };
  }

  Failure? get failureOrNull {
    return switch (this) {
      Ok<T>() => null,
      Err<T>(:final failure) => failure,
    };
  }
}

final class Ok<T> extends Result<T> {
  const Ok(this.value);

  final T value;
}

final class Err<T> extends Result<T> {
  const Err(this.failure);

  final Failure failure;
}
