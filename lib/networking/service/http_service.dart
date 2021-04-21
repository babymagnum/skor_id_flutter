import 'package:skor_id_flutter/model/standart.dart';
import 'package:skor_id_flutter/networking/request/login_request.dart';
import 'package:skor_id_flutter/networking/request/register_request.dart';
import 'package:skor_id_flutter/networking/request/update_user_request.dart';
import 'package:skor_id_flutter/networking/service/base_service.dart';
import '../../main.dart';
import '../../model/login.dart';
import '../../model/register.dart';
import '../../model/standart.dart';

class HttpService extends BaseService {
  
  Future<Login> login(LoginRequest body) async {
    return await postJsonBody('${MyApp.BASE_API}/auth/login', body.getBody());
  }

  Future<Register> register(RegisterRequest body) async {
    return await postJsonBody('${MyApp.BASE_API}/auth/register', body.getBody());
  }

  Future<Standart> updateUser(UpdateUserRequest body) async {
    return await putJsonBody('${MyApp.BASE_API}/user/me', body.getBody());
  }
}