import 'package:e_commerce_complete_app/utilities/assets.dart';

class Product {
  final String id;
  final String title;
  final String imgURL;
  final int price;
  final String category;
  final int? discountValue;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.imgURL,
    required this.price,
    required this.category,
    this.discountValue,
    this.rate,
  });
}

List<Product> getProducts = [
  Product(
    id: '1',
    title: "Brock Wegner",
    imgURL: AppAssets.tompProductAsset1,
    price: 150,
    category: 'Clothes',
    discountValue: 50,
  ),
  Product(
    id: '2',
    title: "T-Shirt",
    imgURL: AppAssets.tompProductAsset2,
    price: 110,
    category: 'Clothes',
  ),
  Product(
    id: '3',
    title: "T-Shirt",
    imgURL: AppAssets.tompProductAsset3,
    price: 85,
    category: 'Clothes',
  ),
  Product(
    id: '4',
    title: "T-Shirt",
    imgURL: AppAssets.tompProductAsset4,
    price: 170,
    category: 'Clothes',
    discountValue: 35,
  ),
  Product(
    id: '5',
    title: "T-Shirt",
    imgURL: AppAssets.tompProductAsset5,
    price: 105,
    category: 'Clothes',
  ),
];
