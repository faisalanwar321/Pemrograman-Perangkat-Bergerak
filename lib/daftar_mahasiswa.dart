import 'package:flutter/material.dart';
import 'form_mahasiswa.dart'; // ambil dataMahasiswa dari sini

class DaftarMahasiswaPage extends StatelessWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Mahasiswa")),
      body: dataMahasiswa.isEmpty
          ? const Center(child: Text("Belum ada data mahasiswa."))
          : ListView.builder(
        itemCount: dataMahasiswa.length,
        itemBuilder: (context, index) {
          final m = dataMahasiswa[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text("${m.nama} (${m.npm})"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: ${m.email}"),
                  Text("Alamat: ${m.alamat}"),
                  Text("Tgl Lahir: ${m.tglLahir}"),
                  Text("Jam Bimbingan: ${m.jamBimbingan}"),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const FormMahasiswaPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
