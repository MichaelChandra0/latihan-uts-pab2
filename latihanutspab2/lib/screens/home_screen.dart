import 'package:flutter/material.dart';
import 'package:latihanutspab2/services/latihan_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LatihanServices _latihanServices = LatihanServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('latihan uts')),
      body: Column(
        children: [
          Text("LATIHAN UTS"),
          Expanded(
            child: FutureBuilder(
              future: _latihanServices.getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>> items = snapshot.data!;
                  return ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("Nama: ${items[index]["name"]}"),
                        trailing: Text("Bio: ${items[index]["bio"]}"),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("TIDAK ADA DATA"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
