import 'package:newsify/models/category_model.dart';

List<CategoriesModel> getCategories() {
  CategoriesModel categoriesModel = CategoriesModel();
  List<CategoriesModel> categories = [];

  categoriesModel.imgUrl =
      "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80";
  categoriesModel.name = "Business";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/274937/pexels-photo-274937.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.name = "Entertainment";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/3880204/pexels-photo-3880204.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.name = "General";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/48604/pexels-photo-48604.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.name = "Health";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/355938/pexels-photo-355938.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.name = "Science";

  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  //

  //
  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/2834917/pexels-photo-2834917.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categoriesModel.name = "Sports";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  categoriesModel.imgUrl =
      "https://images.pexels.com/photos/2777898/pexels-photo-2777898.jpeg?auto=compress&cs=tinysrgb&h=650&w=940";
  categoriesModel.name = "Technology";
  categories.add(categoriesModel);
  categoriesModel = CategoriesModel();

  return categories;
}
