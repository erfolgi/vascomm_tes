class ServiceItem {
  String? nama;
  int? harga;
  String? lokasi;
  String? kota;
  String? img;
  String? tipe;

  ServiceItem(
      {this.nama, this.harga, this.lokasi, this.kota, this.img, this.tipe});

  ServiceItem.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    harga = json['harga'];
    lokasi = json['lokasi'];
    kota = json['kota'];
    img = json['img'];
    tipe = json['tipe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['harga'] = harga;
    data['lokasi'] = lokasi;
    data['kota'] = kota;
    data['img'] = img;
    data['tipe'] = tipe;
    return data;
  }
}
