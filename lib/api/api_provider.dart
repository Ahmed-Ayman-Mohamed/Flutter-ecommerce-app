

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';

class ApiProvider {

  Products? productsList;

  Future<Products?> getProducts() async {
    try{
      final dio = Dio();
      Response response = await dio.get(
        "https://dummyjson.com/products",
        queryParameters: {"limit": 30},
      );
      productsList = Products.fromJson(response.data);
       print(productsList?.products?[0].title);

      return productsList;
    }catch(e){
      if(e is DioException){
        print(e.response?.data);
      }
    }
    return null;
  }

  List? categoryList;

  getAllCategory() async {

    try{
      final dio = Dio();
      
      Response response = await dio.get("https://dummyjson.com/products/category-list");

      categoryList = response.data;
      print(categoryList?[0]);
      return categoryList;
      
    }catch(e){
      if(e is DioException){
        print(e.response?.data);
      }
      return null;
    }
  }

  Future<Products> getProductsByCategory(String category) async {
    final _dio = Dio();
    try {
      final response = await _dio.get('https://dummyjson.com/products/category/$category');
      if (response.statusCode == 200) {
        return Products.fromJson(response.data);
      } else {
        throw Exception('Failed to load products');
      }
    } on DioError catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }

  userLogin({required String userName, required String userPassword}) async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();

    FormData userData = FormData.fromMap({"username": userName, "password": userPassword});
    try{
      final dio = Dio();
      Response response = await dio.post("https://dummyjson.com/auth/login",data:userData);
      print(response.data);

      await preferences.setString("userToken", response.data['token']);
      String? userToken = preferences.getString("userToken");
      print("UserToken => $userToken");

    }catch(e){
      if(e is DioException){
        print(e.response?.data);
      }
    }
  }
}
