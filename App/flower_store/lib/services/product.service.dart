
import 'package:flower_store/models/product/product.model.dart';
import 'package:flower_store/services/https.service.dart';

class ProductService {
  final HttpService _httpService = HttpService();
  final String controller = 'Product';

  constructor() {
    
  }
  Future<List<ProductModel>> getAll(ProductModel model) => 
    _httpService.post<ProductModel, List<ProductModel>>('$controller/getall-product', model);
}