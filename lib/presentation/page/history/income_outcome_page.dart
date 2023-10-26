import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:money_record/config/app_color.dart';

class IncomeOutcomePage extends StatelessWidget {
  const IncomeOutcomePage({super.key, required this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Text(type),
            Expanded(
                child: Container(
              height: 40,
              margin: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.chart.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: '2022-06-01'),
                style: const TextStyle(color: Colors.white),
                textAlignVertical: TextAlignVertical.center,
                onTap: () {},
              ),
            ))
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.fromLTRB(
                16, index == 0 ? 16 : 8, 16, index == 9 ? 16 : 8),
            child: Row(
              children: [
                DView.spaceWidth(),
                const Text(
                  '22 Jun 2022',
                  style: TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Expanded(
                    child: Text(
                  'Rp 200.000,',
                  style: TextStyle(
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  textAlign: TextAlign.end,
                )),
                PopupMenuButton(
                  itemBuilder: (context) => [],
                  onSelected: (value) => {},
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
