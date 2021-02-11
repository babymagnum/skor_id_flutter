import 'package:pln_flutter/model/standart.dart';
import 'package:pln_flutter/networking/request/login_request.dart';
import 'package:pln_flutter/networking/service/base_service.dart';
import '../../main.dart';

class HttpService extends BaseService {
  
  Future<Standart> login(LoginRequest body) async {
    return await postJsonBody('${MyApp.BASE_API}/api/login', body.getBody());
  }

}