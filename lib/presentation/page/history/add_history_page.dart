import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/config/app_format.dart';
import 'package:money_record/presentation/controller/history/c_add_history.dart';

class AddHistoryPage extends StatelessWidget {
  const AddHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cAddHistory = Get.put(CAddHistory());

    final controllerName = TextEditingController();
    final controllerPrice = TextEditingController();

    return Scaffold(
      appBar: DView.appBarLeft('Tambah Baru'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Tanggal'),
          Row(
            children: [
              Obx(() {
                return Text(cAddHistory.date);
              }),
              DView.spaceWidth(),
              ElevatedButton.icon(
                onPressed: () async {
                  DateTime? result = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023, 01, 01),
                      lastDate: DateTime(DateTime.now().year + 1));

                  if (result != null) {
                    cAddHistory
                        .setDate(DateFormat('yyyy-MM-dd').format(result));
                  }
                },
                icon: const Icon(Icons.event),
                label: const Text('Pilih'),
              )
            ],
          ),
          DView.spaceHeight(),
          const Text(
            'Tipe',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DView.spaceHeight(4),
          Obx(() {
            return DropdownButtonFormField(
              value: cAddHistory.type,
              items: ['Pemasukan', 'Pengeluaran'].map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (value) {
                cAddHistory.setType(value);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), isDense: true),
            );
          }),
          DView.spaceHeight(),
          DInput(
            controller: controllerName,
            hint: 'Jualan',
            title: 'Sumber/Objek Pengeluaran',
          ),
          DView.spaceHeight(),
          DInput(
            controller: controllerPrice,
            hint: '30000',
            title: 'Harga',
            inputType: TextInputType.number,
          ),
          DView.spaceHeight(),
          ElevatedButton(
              onPressed: () {
                cAddHistory.addItem({
                  'name': controllerName.text,
                  'price': controllerPrice.text
                });

                controllerName.clear();
                controllerPrice.clear();
              },
              child: const Text('Tambah Ke Items')),
          DView.spaceHeight(),
          Center(
            child: Container(
              height: 5,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.bg,
              ),
            ),
          ),
          DView.spaceHeight(),
          const Text(
            'Items',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          DView.spaceHeight(8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: GetBuilder<CAddHistory>(builder: (_) {
              return Wrap(
                runSpacing: 8,
                spacing: 8,
                children: List.generate(_.items.length, (index) {
                  return Chip(
                    label: Text(_.items[index]['name']),
                    deleteIcon: const Icon(Icons.clear),
                    onDeleted: () {},
                  );
                }),
              );
            }),
          ),
          DView.spaceHeight(),
          Row(
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              DView.spaceWidth(8),
              Text(
                AppFormat.currency('300000'),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold, color: AppColor.primary),
              )
            ],
          ),
          DView.spaceHeight(30),
          Material(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Center(
                  child: Text('SUBMIT',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
