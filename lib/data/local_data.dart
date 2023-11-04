
import 'package:apimodel/model/categoery_model.dart';

List<CategoryModel>getCategories(){

  List<CategoryModel> category = [];


   // #1
  CategoryModel categoryModel= CategoryModel();
  categoryModel.categoeryName ='Business';
  categoryModel .imageUrl ='https://images.livemint.com/img/2022/11/29/1600x900/1df36746-700f-11ed-9470-6981fab06e1e_1669744728301.jpg';
  category.add(categoryModel);

  // #2
   categoryModel= CategoryModel();
  categoryModel.categoeryName ='Entertainment';
  categoryModel .imageUrl ='https://www.apple.com/newsroom/videos/apple-celebrates-entertainment/posters/Apple-celebrates-entertainment-hero.jpg.large_2x.jpg';
  category.add(categoryModel);

  //#3
  categoryModel= CategoryModel();
  categoryModel.categoeryName ='Health';
  categoryModel.imageUrl = 'https://online.hbs.edu/Style%20Library/api/resize.aspx?imgpath=/online/PublishingImages/blog/health-care-economics.jpg&w=1200&h=630';
  category.add(categoryModel);

  //#4
  categoryModel= CategoryModel();
  categoryModel.categoeryName ='Science';
  categoryModel.imageUrl='https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg';
  category.add(categoryModel);

  //#5
  categoryModel= CategoryModel();
  categoryModel.categoeryName ='Sports';
  categoryModel.imageUrl = 'https://wearecardinals.com/wp-content/uploads/2020/04/u1Re9qgMfM8d6kumlW85PS6s55jQh5fbdmppgQsP.jpeg';
  category.add(categoryModel);

  //#6
  categoryModel=CategoryModel();
  categoryModel.categoeryName='Technology';
  categoryModel.imageUrl='https://www.skillstork.org/blog/wp-content/uploads/2022/11/modern-education-Skillstork-1568x882.jpg';
  category.add(categoryModel);

  return category;
}

