import 'package:counter_7/main.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/model/data.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int nominal = 0;
  String? _pilih;
  DateTime _tanggal = DateTime.now();
  List<String> _jenis = ['Pemasukan', 'Pengeluaran'];

  bool isNumeric(String value){
    if (value==null){
      return false;
    }
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
      ),
      // Menambahkan drawer menu
      drawer: const myDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh : Beli Sate Pacil",
                      labelText: "Judul",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.title),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul= value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh : 15000",
                      labelText: "Nominal",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.attach_money),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        nominal = value! as int;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      if (!isNumeric(value)) {
                        return 'Nominal harus berupa angka';
                      }
                      nominal = int.parse(value);
                      return null;
                    },
                  ),  //
                ),
                Padding (
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: DropdownButton(
                      value: _pilih,
                      hint: const Text('Pilih Jenis'),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: _jenis.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _pilih = value ?? "";
                        });
                      },
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    child: Text("Pilih tanggal"),
                    onPressed: () {
                      showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1980), lastDate: DateTime(2080)).then((date){
                        setState((){
                          _tanggal = date!;
                        });
                      });
                    },
                  ),
                ),
                Center(
                  child: Text("Pilihan Tanggal: " + _tanggal.toString().split(' ')[0],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                TextButton(
                  child: const Text("Simpan", style: TextStyle(color: Colors.cyanAccent),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white12),
                  ),
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      dataBudget.tambahBudget(
                        judul: _judul,
                        nominal: nominal,
                        jenis: _pilih,
                        date: _tanggal);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyFormPage()),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}