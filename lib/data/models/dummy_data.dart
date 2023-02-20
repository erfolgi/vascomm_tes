import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/data/models/product/product_item.dart';
import 'package:vascomm_tes/data/models/service/service_item.dart';

class DummyData{
  static List<ProductItem> getProduct() =>[
    ProductItem(
      nama: "Layanan A",
      harga: 10000,
      status: "Ready Stok",
      rating: "5",
      image: AssetString.sampleProduct,
        tipe: "Layanan Kesehatan"
    ),
    ProductItem(
        nama: "Layanan B",
        harga: 10000,
        status: "Ready Stok",
        rating: "5",
        image: AssetString.sampleProduct,
        tipe: "Layanan Kesehatan"
    ),
    ProductItem(
        nama: "Layanan C",
        harga: 10000,
        status: "Ready Stok",
        rating: "5",
        image: AssetString.sampleProduct,
      tipe: "Layanan Kesehatan"
    ),


    ProductItem(
        nama: "Alat A1",
        harga: 10000,
        status: "Ready Stok",
        rating: "5",
        image: AssetString.sampleProduct,
        tipe: "Alat Kesehatan"
    ),
    ProductItem(
        nama: "Alat B1",
        harga: 10000,
        status: "Ready Stok",
        rating: "5",
        image: AssetString.sampleProduct,
        tipe: "Alat Kesehatan"
    ),
    ProductItem(
        nama: "Alat C1",
        harga: 10000,
        status: "Ready Stok",
        rating: "5",
        image: AssetString.sampleProduct,
        tipe: "Alat Kesehatan"
    ),
  ];

  static List<ServiceItem> getServices() =>[
    ServiceItem(
        nama: "PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja",
        harga: 1200000,
        lokasi: "Lenmarc Surabaya",
        kota: "Dukuh Pakis, Surabaya",
        img: AssetString.sampleServiceA,
        tipe: "Satuan"
    ),
    ServiceItem(
        nama: "PCR Swab Test (Drive Thru) Hasil 15 menit",
        harga: 1200000,
        lokasi: "RS Dr. Soetomo",
        kota: "Surabaya",
        img: AssetString.sampleServiceA,
        tipe: "Satuan"
    ),

    ServiceItem(
        nama: "PCR Swab Test Paket Karantina",
        harga: 2400000,
        lokasi: "Rs Premier",
        kota: "Surabaya",
        img: AssetString.sampleServiceB,
        tipe: "Paket Pemeriksaan"
    ),


    ServiceItem(
        nama: "PCR Swab Test Paket Karantina Hotel",
        harga: 2400000,
        lokasi: "Novotel Surabaya",
        kota: "Surabaya",
        img: AssetString.sampleServiceB,
        tipe: "Paket Pemeriksaan"
    )

  ];
}