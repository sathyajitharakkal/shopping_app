// To parse this JSON data, do
//
//     final productResponse = productResponseFromJson(jsonString);

import 'dart:convert';

List<ProductResponse> productResponseFromJson(String str) => List<ProductResponse>.from(json.decode(str).map((x) => ProductResponse.fromJson(x)));

String productResponseToJson(List<ProductResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductResponse {
    ProductResponse({
        this.id = "",
        this.companyId = "",
        this.productId = "",
        this.categoryId = "",
        this.subcatId = "",
        this.price = "",
        this.sellingPrice = "",
        this.qty = "",
        this.status = "",
        this.company = "",
        this.proName = "",
        this.image = "",
        this.attribute = "",
        this.orderBy = "",
        this.createdTime = "",
        this.updatedTime = "",
    });

    String? id;
    String? companyId;
    String? productId;
    String? categoryId;
    String? subcatId;
    String? price;
    String? sellingPrice;
    String? qty;
    String? status;
    String? company;
    String? proName;
    String? image;
    String? attribute;
    String? orderBy;
    String? createdTime;
    String? updatedTime;

    factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        id: json["id"].toString(),
        companyId: json["company_id"].toString(),
        productId: json["product_id"].toString(),
        categoryId: json["category_id"].toString(),
        subcatId: json["subcat_id"].toString(),
        price: json["price"].toString(),
        sellingPrice: json["selling_price"].toString(),
        qty: json["qty"].toString(),
        status: json["status"].toString(),
        company: json["company"].toString(),
        proName: json["pro_name"].toString(),
        image: json["image"].toString(),
        attribute: json["attribute"].toString(),
        orderBy: json["order_by"].toString(),
        createdTime: json["created_time"].toString(),
        updatedTime: json["updated_time"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company_id": companyId,
        "product_id": productId,
        "category_id": categoryId,
        "subcat_id": subcatId,
        "price": price,
        "selling_price": sellingPrice,
        "qty": qty,
        "status": status,
        "company": company,
        "pro_name": proName,
        "image": image,
        "attribute": attribute,
        "order_by": orderBy,
        "created_time": createdTime,
        "updated_time": updatedTime,
    };
}
