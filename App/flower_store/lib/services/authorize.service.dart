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
    _httpService.post<LoginModel, AccountModel>('$controller/login', model);
}