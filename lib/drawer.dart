import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/show_data.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : Column(
        children: [
          ListTile(
            title: const Text('Program Counter'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage()),);
            }
          ),
          ListTile(
              title: const Text('Form Budget'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyFormPage()),);
              }
          ),
          ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShowData()),);
              }
          ),
        ],
      ),
    );
  }
}