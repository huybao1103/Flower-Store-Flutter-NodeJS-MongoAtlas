import 'package:flower_store/models/product/product.model.dart';
import 'package:flower_store/services/https.service.dart';

class ProductService {
  final HttpService _httpService = HttpService();

  Future<List<ProductModel>> getAll() async {
    try {
      final response = await _httpService.dio.post('${_httpService.headerUrl}Product/getall-product');
      if (response.statusCode == 200) {
        List<ProductModel> products = (response.data as List)
            .map((product) => ProductModel.empty().fromJson(product))
            .toList();
        return products;
      } else {
        throw Exception('Không thể tải sản phẩm');
      }
    } catch (e) {
      throw Exception('Không thể tải sản phẩm: $e');
    }
  }

  Future<List<ProductModel>> getProductFavorite() async {
    try {
      final response = await _httpService.dio.get('${_httpService.headerUrl}Product/get-favorite-products');
      if (response.statusCode == 200) {
        List<ProductModel> favoriteProducts = (response.data as List)
            .map((product) => ProductModel.empty().fromJson(product))
            .toList();
        return favoriteProducts;
      } else {
        throw Exception('Không thể tải sản phẩm yêu thích');
      }
    } catch (e) {
      throw Exception('Không thể tải sản phẩm yêu thích: $e');
    }
  }

  Future<void> toggleFavorite(String productId, bool isFavorite) async {
    try {
      final response = await _httpService.dio.post(
        '${_httpService.headerUrl}Product/toggle-favorite',
        data: {'id': productId, 'isFavorite': isFavorite},
      );

      if (response.statusCode != 200) {
        throw Exception('Không thể cập nhật trạng thái yêu thích');
      }
    } catch (e) {
      throw Exception('Không thể cập nhật trạng thái yêu thích: $e');
    }
  }
}
