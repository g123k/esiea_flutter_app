import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled5/api/model/product_api.dart';

part 'off_api.g.dart';

@RestApi()
abstract class OFFAPI {
  factory OFFAPI(Dio dio, {required String baseUrl}) = _OFFAPI;

  @GET('/getProduct')
  Future<OFFServerResponse> loadProduct(@Query('barcode') String barcode);
}

class OFFAPIManager {
  static OFFAPIManager? _instance;

  /// Singleton
  factory OFFAPIManager() {
    _instance ??= OFFAPIManager._();
    return _instance!;
  }

  final OFFAPI api;

  OFFAPIManager._()
      : api = OFFAPI(
          Dio(),
          baseUrl: 'https://api.formation-android.fr/v2/',
        );

  Future<OFFServerResponse> loadProduct(String barcode) async {
    assert(barcode.isNotEmpty);
    return api.loadProduct(barcode);
  }
}
