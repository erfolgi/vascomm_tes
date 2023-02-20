class ProductItem {
  String? nama;
  int? harga;
  String? status;
  String? rating;
  String? image;
  String? tipe;

  ProductItem(
      {this.nama, this.harga, this.status, this.rating, this.image, this.tipe});

  ProductItem.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    harga = json['harga'];
    status = json['status'];
    rating = json['rating'];
    image = json['image'];
    tipe = json['tipe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = nama;
    data['harga'] = harga;
    data['status'] = status;
    data['rating'] = rating;
    data['image'] = image;
    data['tipe'] = tipe;
    return data;
  }
}
