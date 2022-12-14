


import 'package:login/custom-http/custom_http.dart';
import 'package:login/model/all_order_model.dart';
import 'package:login/model/category_model.dart';
import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categoryList = [];

  getCategoryData() async {

    categoryList = await CustomeHttpRequest.fetchAllCategory();
    notifyListeners();
  }
}
