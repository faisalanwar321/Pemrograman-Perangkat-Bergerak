import 'package:flutter/material.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool _darkMode = false;
  bool _notifikasiAktif = true;
  String _bahasa = "Indonesia";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pengaturan Aplikasi")),
      body: ListView(
        children: [
          // ✅ Dark Mode
          SwitchListTile(
            title: const Text("Mode Gelap"),
            value: _darkMode,
            onChanged: (val) {
              setState(() {
                _darkMode = val;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      _darkMode ? "Mode Gelap Aktif" : "Mode Gelap Nonaktif"),
                ),
              );
            },
            secondary: const Icon(Icons.dark_mode),
          ),

          const Divider(),

          // ✅ Pilihan Bahasa
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Bahasa"),
            subtitle: Text(_bahasa),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("Pilih Bahasa"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text("Indonesia"),
                          onTap: () {
                            setState(() => _bahasa = "Indonesia");
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          title: const Text("English"),
                          onTap: () {
                            setState(() => _bahasa = "English");
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          // ✅ Notifikasi
          SwitchListTile(
            title: const Text("Notifikasi"),
            value: _notifikasiAktif,
            onChanged: (val) {
              setState(() {
                _notifikasiAktif = val;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(_notifikasiAktif
                      ? "Notifikasi Aktif"
                      : "Notifikasi Dimatikan"),
                ),
              );
            },
            secondary: const Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
