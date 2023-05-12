import 'dart:ui';

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
          Expanded(child: ListView()),
        ],
      ),
    );
  }
}
