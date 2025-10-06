class Mahasiswa {
  final String nama;
  final String nim;

  Mahasiswa({required this.nama, required this.nim});
}

// ✅ list global untuk menampung data mahasiswa
List<Mahasiswa> daftarMahasiswa = [];
