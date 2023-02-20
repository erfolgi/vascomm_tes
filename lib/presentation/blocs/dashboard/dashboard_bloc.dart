import 'package:bloc/bloc.dart';
import 'package:vascomm_tes/data/models/dummy_data.dart';
import 'package:vascomm_tes/data/models/product/product_item.dart';
import 'package:vascomm_tes/data/models/service/service_item.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final productTab = [
    "All Product",
    "Layanan Kesehatan",
    "Alat Kesehatan"
  ];

  final serviceTab = [
    "Satuan",
    "Paket Pemeriksaan"
  ];

  final List<ProductItem>  _productList = DummyData.getProduct();
  List<ProductItem> getProductList =  DummyData.getProduct();
  String search ="";
  String selectedTab ="All Product";


  final List<ServiceItem>  _serviceList = DummyData.getServices();
  List<ServiceItem> getServiceList =  DummyData.getServices();
  String selectedService ="Satuan";

  DashboardBloc() : super(InitState()) {
    on<ChangeStateEvent>((event, emit) {
      getProductList = _productList.where((i) =>
      (i.tipe==selectedTab || selectedTab =="All Product")
      && (i.nama??"").toLowerCase().contains(search.toLowerCase())
      ).toList();

      getServiceList = _serviceList.where((i) =>
      (i.tipe==selectedService)

      ).toList();
      emit(InitState());
    });
  }
}
