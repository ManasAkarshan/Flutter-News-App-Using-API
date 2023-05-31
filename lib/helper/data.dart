import 'package:newz/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category = [];
  CategoryModel categoryModel = const CategoryModel(categoryName: 'Business', imageUrl: "https://images.unsplash.com/photo-1570126646281-5ec88111777f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=841&q=80");
  category.add(categoryModel);

  //2
  categoryModel = const CategoryModel(categoryName: "Entertainment", imageUrl: "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80" );
  category.add(categoryModel);

  //3
  categoryModel = const CategoryModel(categoryName: "General", imageUrl: "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60");
  category.add(categoryModel);
  //4
  categoryModel = const CategoryModel(categoryName: "Health", imageUrl: "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80");
  category.add(categoryModel);
  //5
  categoryModel = const CategoryModel(categoryName: "Science", imageUrl: "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80");
  category.add(categoryModel);

  //6
  categoryModel = const CategoryModel(categoryName: "Sports", imageUrl: "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80");
  category.add(categoryModel);

  //7
  categoryModel = const CategoryModel(categoryName: "Technology", imageUrl: "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80");
  category.add(categoryModel);

  return category;
}