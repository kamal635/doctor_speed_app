import '../errors/failure.dart';
import '../errors/failure_code.dart';
import '../result/result.dart';
import 'network_exception_mapper.dart';
import 'request_cancellation.dart';

typedef NetworkRequest<T> = Future<T> Function();

Future<Result<T>> executeNetworkRequest<T>(NetworkRequest<T> request) async {
  try {
    final value = await request();
    return Ok(value);
  } catch (error, stackTrace) {
    if (isRequestCancelled(error)) {
      rethrow;
    }

    return Err(mapNetworkException(error, stackTrace));
  }
}

bool isConnectivityFailure(Failure failure) {
  return failure.code == FailureCode.network ||
      failure.code == FailureCode.timeout;
}
