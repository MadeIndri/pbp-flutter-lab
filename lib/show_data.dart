import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'package:counter_7/data.dart';


class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: const myDrawer(),
      body: ListView.builder(itemBuilder: (context, index){
        return Card(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dataBudget.budgets[index].judul,
                style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.left,
                ),
                Text(dataBudget.budgets[index].date.toString(),
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dataBudget.budgets[index].nominal.toString(),
                    style: const TextStyle(fontSize: 20),
                    ),
                    Text(dataBudget.budgets[index].jenis,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
        itemCount: dataBudget.budgets.length,
      ),
    );
  }
}