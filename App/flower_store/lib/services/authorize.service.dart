import 'package:flower_store/models/authorize/login.model.dart';
import 'package:flower_store/models/authorize/signup.model.dart';
import 'package:flower_store/services/https.service.dart';

class AuthorizeService {
  final HttpService _httpService = HttpService();
  final String controller = 'Accounts';

  constructor() {
    
  }
  Future<bool> signup(AccountModel model) =>
    _httpService.post<AccountModel, bool>(('$controller/signup'), model);

  Future<AccountModel> login(LoginModel model) => 
    _httpService.post<LoginModel, AccountModel>('$controller/login', model, returnType: AccountModel());


  // Future<AccountModel> login(LoginModel model) async {
  //   final jsonBody = await _httpService.post('$controller/login', model);
  //   AccountModel result = AccountModel();

  //   if(jsonBody is Map) {
  //     Map<String, Object> stringObjectMap = jsonBody.map(
  //       (key, value) {
  //         if (key is! String) {
  //           throw ArgumentError('All keys must be of type String');
  //         }
  //         if (value is! Object) {
  //           throw ArgumentError('All values must be of type Object');
  //         }
  //         return MapEntry(key, value);
  //       },
  //     );
  //     result.fromJson(stringObjectMap);
  //   }
  //   return result;
  // }
}