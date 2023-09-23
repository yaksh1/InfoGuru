import 'package:infoguru/models/category_model.dart';

List<CategoryModel> getCategories() {
  CategoryModel categoryModel = new CategoryModel();
  List<CategoryModel> category = new List<CategoryModel>.empty(growable: true);

  //! business
  categoryModel.categoryName = "Buisness";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1664575602276-acd073f104c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";

  // add the model
  category.add(categoryModel);

  // restate
  categoryModel = new CategoryModel();

  //!technology
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";

  // add the model
  category.add(categoryModel);

  // restate
  categoryModel = new CategoryModel(); 
  
  //! Entertainment
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80";

  // add the model
  category.add(categoryModel);

  // restate
  categoryModel = new CategoryModel(); 
  
  //! general
  categoryModel.categoryName = "Genral";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80";

  // add the model
  category.add(categoryModel);

  // restate
  categoryModel = new CategoryModel(); 

  return category;
}
