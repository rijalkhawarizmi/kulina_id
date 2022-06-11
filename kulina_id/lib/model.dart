class DataModel {
  List<Data>? data;
  int? page;
  int? size;
  int? total;

  DataModel({this.data, this.page, this.size, this.total});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    page = json['page'];
    size = json['size'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['size'] = this.size;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? pageUrl;
  String? originalPageUrl;
  String? media;
  bool? isActive;
  int? orders;
  int? bannerVariantId;
  Variant? variant;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.pageUrl,
      this.originalPageUrl,
      this.media,
      this.isActive,
      this.orders,
      this.bannerVariantId,
      this.variant,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pageUrl = json['page_url'];
    originalPageUrl = json['original_page_url'];
    media = json['media'];
    isActive = json['is_active'];
    orders = json['orders'];
    bannerVariantId = json['banner_variant_id'];
    variant =
        json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['page_url'] = this.pageUrl;
    data['original_page_url'] = this.originalPageUrl;
    data['media'] = this.media;
    data['is_active'] = this.isActive;
    data['orders'] = this.orders;
    data['banner_variant_id'] = this.bannerVariantId;
    if (this.variant != null) {
      data['variant'] = this.variant!.toJson();
    }
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Variant {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Variant({this.id, this.name, this.slug, this.createdAt, this.updatedAt});

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
