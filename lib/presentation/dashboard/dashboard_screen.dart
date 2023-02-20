import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vascomm_tes/core/config/app_color.dart';
import 'package:vascomm_tes/core/config/app_typography.dart';
import 'package:vascomm_tes/core/config/asset_string.dart';
import 'package:vascomm_tes/core/config/const.dart';
import 'package:vascomm_tes/core/config/dimens.dart';
import 'package:vascomm_tes/core/util/app_util.dart';
import 'package:vascomm_tes/di/di_object.dart';
import 'package:vascomm_tes/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:vascomm_tes/presentation/dashboard/drawer_view.dart';
import 'package:vascomm_tes/presentation/widgets/app_text.dart';
import 'package:vascomm_tes/presentation/widgets/search_form_field.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboard";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _bloc = DIObject.dashboardBloc;

  @override
  void initState() {
    super.initState();
    _bloc.add(ChangeStateEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, state) {
        if (state is InitState) {}
        return Scaffold(
          appBar: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(color: PrimaryColor.base),
              backgroundColor: NeutralColor.white,
              actions: [
                InkWell(
                  child: Image.asset(
                    AssetString.icCart,
                    height: 22,
                    width: 22,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),

                Stack(
                  children: [
                    Center(
                      child: InkWell(
                        child: Image.asset(
                          AssetString.icNotif,
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ),
                    Positioned(
                      top:15,
                      right: 1,
                      child: Icon(Icons.circle,
                          color: AccentColor.red, size: 9),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
              ]),
          drawerScrimColor: PrimaryColor.base.withOpacity(0.8),
          drawer: DrawerView(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: Const.mediaWidth(context),
                            child: Card(
                              margin: const EdgeInsets.only(top: 24),
                              shadowColor: PrimaryColor.base,
                              surfaceTintColor: PrimaryColor.base,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          AppText(
                                            title: "Solusi, ",
                                            textStyle: AppTypography.gilroy18SB(),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          AppText(
                                            title: "Kesehatan Anda",
                                            textStyle: AppTypography.gilroy18B(),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: Dimens.space8,
                                      ),
                                      AppText(
                                        title:
                                        "Update informasi seputar kesehatan\nsemua bisa disini !",
                                        textStyle: AppTypography.proxima12R(),
                                      ),
                                      SizedBox(
                                        height: Dimens.space12,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: PrimaryColor.base,
                                            borderRadius:
                                            const BorderRadiusDirectional.all(
                                                Radius.circular(8))),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 16),
                                        child: AppText(
                                          title: "Selengkapnya",
                                          textStyle: AppTypography.gilroy12SB(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Image.asset(
                              AssetString.icCalendarImage,
                              width: 130,
                              height: 130,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: Const.mediaWidth(context),
                            child: Card(
                              margin: const EdgeInsets.only(top: 24),
                              shadowColor: NeutralColor.lightGrey,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        title: "Layanan Khusus",
                                        textStyle: AppTypography.gilroy18SB(),
                                      ),
                                      SizedBox(
                                        height: Dimens.space8,
                                      ),
                                      AppText(
                                        title:
                                        "Tes Covid 19, Cegah Corona\nSedini Mungkin",
                                        textStyle: AppTypography.proxima12R(),
                                      ),
                                      SizedBox(
                                        height: Dimens.space12,
                                      ),
                                      Row(children: [
                                        AppText(
                                          title: "Daftar Tes",
                                          textStyle: AppTypography.gilroy14B(
                                              color: PrimaryColor.base),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Icon(Icons.arrow_forward_rounded,
                                            color: PrimaryColor.base, size: 16),
                                      ])
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 18,
                            top: 0,
                            child: Image.asset(
                              AssetString.icVaccine,
                              width: 120,
                              height: 120,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: Const.mediaWidth(context),
                            child: Card(
                              margin: const EdgeInsets.only(top: 12),
                              shadowColor: NeutralColor.lightGrey,
                              surfaceTintColor: PrimaryColor.lighter,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, right: 16, bottom: 16, left: 124),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        title: "Track Pemeriksaan",
                                        textStyle: AppTypography.gilroy18SB(),
                                      ),
                                      SizedBox(
                                        height: Dimens.space8,
                                      ),
                                      AppText(
                                        title:
                                        "Kamu dapat mengecek progress\npemeriksaanmu disini",
                                        textStyle: AppTypography.proxima12R(),
                                      ),
                                      SizedBox(
                                        height: Dimens.space12,
                                      ),
                                      Row(children: [
                                        AppText(
                                          title: "Track",
                                          textStyle: AppTypography.gilroy14B(
                                              color: PrimaryColor.base),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Icon(Icons.arrow_forward_rounded,
                                            color: PrimaryColor.base, size: 16),
                                      ])
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            top: 0,
                            child: Image.asset(
                              AssetString.icMagnifier,
                              width: 80,
                              height: 67,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                ),

                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        padding: const EdgeInsets.all(12),
                        minWidth: 40,
                        color: NeutralColor.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99)),
                        child: Image.asset(
                          AssetString.icFilter,
                          width: 16,
                          height: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SearchFormField(
                        onChanged: (v){
                          _bloc.search=v;
                          _bloc.add(ChangeStateEvent());
                        },
                        width: Const.mediaWidth(context) - 112,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _bloc.productTab.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                _bloc.selectedTab = _bloc.productTab[index];
                                _bloc.add(ChangeStateEvent());
                              },
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(99)),
                              color:
                                  _bloc.selectedTab == _bloc.productTab[index]
                                      ? PrimaryColor.base
                                      : NeutralColor.white,
                              child: AppText(
                                  title: _bloc.productTab[index],
                                  textStyle: AppTypography.gilroy12SB(
                                      color: _bloc.selectedTab ==
                                              _bloc.productTab[index]
                                          ? NeutralColor.white
                                          : PrimaryColor.base)),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _bloc.getProductList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 160,
                              child: InkWell(
                                onTap: () {},
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              AssetString.icStar,
                                              height: 20,
                                              width: 20,
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            AppText(
                                                title: _bloc
                                                    .getProductList[index]
                                                    .rating,
                                                textStyle:
                                                    AppTypography.proxima16SB(
                                                        color: NeutralColor
                                                            .lightGrey)),
                                          ],
                                        ),
                                        Image.asset(
                                          _bloc.getProductList[index].image
                                              .toString(),
                                          height: 80,
                                          width: 80,
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AppText(
                                              title: _bloc
                                                  .getProductList[index].nama
                                                  .toString(),
                                              textStyle:
                                                  AppTypography.proxima14SB(
                                                      color:
                                                          PrimaryColor.base)),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          children: [
                                            AppText(
                                                title: AppUtil.toCurrency(
                                                    _bloc
                                                            .getProductList[
                                                                index]
                                                            .harga ??
                                                        0),
                                                textStyle:
                                                    AppTypography.proxima12SB(
                                                        color: AccentColor
                                                            .orange)),
                                            const Spacer(),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                              decoration: BoxDecoration(
                                                color: AccentColor.lightgreen,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: AppText(
                                                  title: _bloc
                                                      .getProductList[index]
                                                      .status,
                                                  textStyle: AppTypography
                                                      .proxima10R()),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                        title: "Pilih Tipe Layanan Kesehatan Anda",
                        textStyle:
                            AppTypography.gilroy18SB(color: PrimaryColor.base)),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _bloc.serviceTab.length,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                _bloc.selectedService =
                                    _bloc.serviceTab[index];
                                _bloc.add(ChangeStateEvent());
                              },
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(99)),
                              color: _bloc.selectedService ==
                                      _bloc.serviceTab[index]
                                  ? AccentColor.blue
                                  : NeutralColor.white,
                              child: AppText(
                                  title: _bloc.serviceTab[index],
                                  textStyle: AppTypography.gilroy12SB(
                                      color: _bloc.selectedService ==
                                              _bloc.serviceTab[index]
                                          ? PrimaryColor.base
                                          : PrimaryColor.base)),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        );
                      }),
                ),
                const SizedBox(
                  height: 30,
                ),
                ..._bloc.getServiceList.map((item) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Const.mediaWidth(context) - 190,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AppText(
                                              title: item.nama,
                                              textStyle:
                                              AppTypography.proxima14SB(
                                                  color: PrimaryColor
                                                      .base)),
                                        ),
                                        const SizedBox(height: 12,),
                                        AppText(
                                            title: AppUtil.toCurrency(item.harga ??
                                                0),
                                            textStyle:
                                            AppTypography.proxima12SB(
                                                color: AccentColor
                                                    .orange)),
                                        const SizedBox(height: 20,),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AssetString.icHospital,
                                              width: 14,
                                              height: 14,
                                            ),
                                            const SizedBox(width: 8,),
                                            AppText(
                                                title: item.lokasi,
                                                textStyle: AppTypography
                                                    .proxima14SB(
                                                    color: NeutralColor
                                                        .grey)),
                                          ],
                                        ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Image.asset(
                                              AssetString.icLocation,
                                              width: 14,
                                              height: 14,
                                            ),
                                            const SizedBox(width: 8,),
                                            AppText(
                                                title: item.kota,
                                                textStyle: AppTypography
                                                    .proxima12R(
                                                    color: NeutralColor.lightGrey)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Image.asset(item.img ?? "",
                                      height: 119,
                                      width: 140,
                                      fit: BoxFit.cover),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                ),

                const SizedBox(height: 30,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetString.icLoadMore, height: 16, width: 16,),
                    const SizedBox(width: 8,),
                    AppText(
                      title: "Tampilkan Lebih Banyak",
                      textStyle: AppTypography.proxima14SB(color: NeutralColor.lightGrey),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Stack(
                  children: [

                    Image.asset(AssetString.bgFooter, height: 110,
                      width: Const.mediaWidth(context),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
                      child: Row(
                        children: [
                          AppText(
                            title: "Ingin mendapat update\ndari kami ?",
                            textStyle: AppTypography.gilroy16SB(color: Colors.white),
                          ),
                          const Spacer(),
                          AppText(
                            title: "Dapatkan\nnotifikasi",
                            align: TextAlign.end,
                            textStyle: AppTypography.proxima14R(color: Colors.white),
                          ),
                          const SizedBox(width: 16,),
                          Image.asset(AssetString.icArrowRight, width: 16, height: 16,)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
