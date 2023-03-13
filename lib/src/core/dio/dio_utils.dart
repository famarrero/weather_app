import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/core/services_manager/logger_service.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';

///This request call the computation function, catch dio possible error and map into [Failure]
///If computation function return null this method return [NullValueFromApiFailure]
Future<Either<Failure, T>> safeRequest<T>(
  FutureOr<T?> Function() computation,
) async {
  try {
    final response = await computation();

    if (response != null) {
      return right(response);
    } else {
      return left(
        NullValueFromApiFailure(S.current.nullResponseForServer),
      );
    }
  } on DioError catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return left(
          UnauthorizedFailure(
            message: S.current.unauthorized,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 403) {
        return left(
          ForbiddenFailure(
            message: S.current.invalidToken,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 404) {
        return left(
          NotFoundFailure(
            message: S.current.nothingFound,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 500) {
        return left(
          InternalServerFailure(
            message: S.current.internalServerError,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 502) {
        return left(
          BadGatewayFailure(
            message: S.current.badGateway,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 503) {
        return left(
          ServiceUnavailableFailure(
            message: S.current.serviceUnavailable,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 504) {
        return left(
          GatewayTimeOutFailure(
            message: S.current.gatewayTimeOut,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else {
        return left(
          DioServerFailure(
            message:
                'Error ${e.response?.statusCode} ${S.current.fromApi.toLowerCase()}: ${e.response!.data}',
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      }
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      return left(
        DioRequestFailure(
          message: '${S.current.unknownConnectionErrorFromApi}: ${e.message}',
          errorType: e.type,
        ),
      );
    }
  } catch (e) {
    injector<LoggerService>().printErrorLog(e.toString());
    return left(
      UnknownFailure(message: '${S.current.unknownConnectionErrorFromApi}: $e'),
    );
  }
}

Future<Either<Failure, T?>> safeRequestWhitNull<T>(
  FutureOr<T?> Function() computation,
) async {
  try {
    final response = await computation();

    return right(response);
  } on DioError catch (e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return left(
          UnauthorizedFailure(
            message: S.current.unauthorized,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 403) {
        return left(
          ForbiddenFailure(
            message: S.current.invalidToken,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 404) {
        return left(
          NotFoundFailure(
            message: S.current.nothingFound,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 500) {
        return left(
          InternalServerFailure(
            message: S.current.internalServerError,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 502) {
        return left(
          BadGatewayFailure(
            message: S.current.badGateway,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 503) {
        return left(
          ServiceUnavailableFailure(
            message: S.current.serviceUnavailable,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else if (e.response!.statusCode == 504) {
        return left(
          GatewayTimeOutFailure(
            message: S.current.gatewayTimeOut,
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      } else {
        return left(
          DioServerFailure(
            message:
                'Error ${e.response?.statusCode} ${S.current.fromApi.toLowerCase()}: ${e.response!.data}',
            errorType: e.type,
            statusCode: e.response?.statusCode,
          ),
        );
      }
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      return left(
        DioRequestFailure(
          message: '${S.current.unknownConnectionErrorFromApi}: ${e.message}',
          errorType: e.type,
        ),
      );
    }
  } catch (e) {
    injector<LoggerService>().printErrorLog(e.toString());
    return left(
      UnknownFailure(message: '${S.current.unknownConnectionErrorFromApi}: $e'),
    );
  }
}
