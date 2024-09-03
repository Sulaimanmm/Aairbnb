class ProductList {
  final List<Category> data;

  ProductList({required this.data});

  factory ProductList.fromJson(Map<String, dynamic> json) {
    var categoryList = json['data'] as List;
    List<Category> categoryData = categoryList.map((i) => Category.fromJson(i)).toList();

    return ProductList(data: categoryData);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()).toList(),
    };
  }
}

class Category {
  final int id;
  final String categoryName;
  final String categoryDesc;
  final String categoryIcon;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final int? parentCategoryId;
  final List<Product> products;

  Category({
    required this.id,
    required this.categoryName,
    required this.categoryDesc,
    required this.categoryIcon,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.parentCategoryId,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var productList = json['products'] as List;
    List<Product> productData = productList.map((i) => Product.fromJson(i)).toList();

    return Category(
      id: json['id'],
      categoryName: json['category_name'],
      categoryDesc: json['category_desc'],
      categoryIcon: json['category_icon'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      parentCategoryId: json['parent_category_id'],
      products: productData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_name': categoryName,
      'category_desc': categoryDesc,
      'category_icon': categoryIcon,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'parent_category_id': parentCategoryId,
      'products': products.map((v) => v.toJson()).toList(),
    };
  }
}

class Product {
  final int id;
  final String name;
  final List<String> image;
  final String desc;
  final String startDate;
  final String endDate;
  final String price;
  final String latitude;
  final String longitude;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final Pivot pivot;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.pivot,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    var imageList = json['image'].cast<String>();

    return Product(
      id: json['id'],
      name: json['name'],
      image: imageList,
      desc: json['desc'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      price: json['price'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'desc': desc,
      'start_date': startDate,
      'end_date': endDate,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'pivot': pivot.toJson(),
    };
  }
}

class Pivot {
  final int categoryId;
  final int productId;

  Pivot({
    required this.categoryId,
    required this.productId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      categoryId: json['category_id'],
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'product_id': productId,
    };
  }
}
