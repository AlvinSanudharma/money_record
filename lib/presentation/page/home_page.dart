import 'dart:ui';

import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:money_record/config/app_asset.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/presentation/controller/c_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(CUser());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Row(
              children: [
                Image.asset(AppAsset.profile),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Obx(() {
                        return Text(
                          cUser.data.name ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        );
                      })
                    ],
                  ),
                ),
                Builder(builder: (ctx) {
                  return Material(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.chart,
                    child: InkWell(
                        onTap: () {
                          Scaffold.of(ctx).openEndDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.menu,
                            color: AppColor.primary,
                          ),
                        )),
                  );
                })
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
            children: [
              Text(
                'Pengeluaran Hari Ini',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              DView.spaceHeight(),
              Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 4,
                color: AppColor.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
                      child: Text(
                        'Rp 500.000,00',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondary),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 30),
                      child: Text(
                        '+20% dibanding kemarin',
                        style: TextStyle(color: AppColor.bg, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 0, 16),
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Selengkapnya',
                            style: TextStyle(
                                color: AppColor.primary, fontSize: 16),
                          ),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
