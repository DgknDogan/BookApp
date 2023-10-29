import 'package:bookapp/Features/Book/BooksRepository/response.dart';
import 'package:dio/dio.dart';
import '../Models/category_model.dart';
import '../Models/product_model.dart';

class BooksRepositery {
  final Map<String, List<String>> bookCoverUrlList = {};

  Dio dio = Dio();

  Future<ResponseModel<List<Category>>> categoryRequest() async {
    Response response;
    response =
        await dio.get("https://assign-api.piton.com.tr/api/rest/categories");
    List<dynamic> data = response.data["category"];

    final isSuccess = response.statusCode == 200;

    final result = ResponseModel(
      errorMessage: !isSuccess ? response.data["error"] : null,
      model: isSuccess
          ? data.map((category) => Category.fromJson(category)).toList()
          : null,
    );

    return result;
  }

  Future<Map<String, ResponseModel<List<Product>>>> productRequest() async {
    Response response;
    ResponseModel<List<Category>> categoriesList = await categoryRequest();
    Map<String, ResponseModel<List<Product>>> resultList = {};

    for (var i = 1; i < categoriesList.model!.length + 1; i++) {
      response =
          await dio.get("https://assign-api.piton.com.tr/api/rest/products/$i");

      List<dynamic> data = response.data["product"];

      final isSuccess = response.statusCode == 200;

      final result = ResponseModel(
        errorMessage: !isSuccess ? "No Products Found" : null,
        model: isSuccess
            ? data.map((product) => Product.fromJson(product)).toList()
            : null,
      );

      resultList.addEntries(
          {categoriesList.model![i - 1].name.toString(): result}.entries);
    }

    return resultList;
  }

  Future<Map<String, ResponseModel<String>>> getProductCovers() async {
    Response response;
    ResponseModel<List<Category>> categoriesList = await categoryRequest();
    Map<String, ResponseModel<List<Product>>> productsList =
        await productRequest();

    Map<String, ResponseModel<String>> resultList = {};

    for (var i = 0; i < categoriesList.model!.length; i++) {
      for (var j = 0;
          j <
              productsList[categoriesList.model?[i].name.toString()]!
                  .model!
                  .length;
          j++) {
        response = await dio.post(
          "https://assign-api.piton.com.tr/api/rest/cover_image",
          data: {
            "fileName": productsList[categoriesList.model?[i].name.toString()]!
                .model![j]
                .cover
                .toString()
          },
        );
        String data = response.data["action_product_image"]["url"];

        final result = ResponseModel(model: data, errorMessage: null);
        resultList.addEntries({
          productsList[categoriesList.model?[i].name.toString()]!
              .model![j]
              .cover
              .toString(): result
        }.entries);
      }
    }

    return resultList;
  }
}
