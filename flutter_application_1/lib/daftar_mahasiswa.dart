import 'package:flutter/material.dart';
import 'data_mahasiswa.dart';

class DaftarMahasiswaPage extends StatefulWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  State<DaftarMahasiswaPage> createState() => _DaftarMahasiswaPageState();
}

class _DaftarMahasiswaPageState extends State<DaftarMahasiswaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Mahasiswa")),
      body: ListView.builder(
        itemCount: daftarMahasiswa.length,
        itemBuilder: (context, index) {
          final mhs = daftarMahasiswa[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(mhs.nama),
              subtitle: Text("NIM: ${mhs.nim}"),
            ),
          );
        },
      ),
    );
  }

  // ✅ biar refresh setelah balik dari form
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {});
  }
}
