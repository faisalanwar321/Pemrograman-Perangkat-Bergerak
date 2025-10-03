import 'package:flutter/material.dart';

class DosenPage extends StatefulWidget {
  const DosenPage({super.key});

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {
  final _formKey = GlobalKey<FormState>();
  final _nidnController = TextEditingController();
  final _namaController = TextEditingController();
  final _homebaseController = TextEditingController();
  final _emailController = TextEditingController();
  final _notlpController = TextEditingController();

  String? _output;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Dosen")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nidnController,
                      decoration: const InputDecoration(
                        labelText: "NIDN",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Wajib diisi" : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                        labelText: "Nama",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Wajib diisi" : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _homebaseController,
                      decoration: const InputDecoration(
                        labelText: "Home Base",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _notlpController,
                      decoration: const InputDecoration(
                        labelText: "No Tlp",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _output =
                            "NIDN: ${_nidnController.text}\n"
                                "Nama: ${_namaController.text}\n"
                                "Home Base: ${_homebaseController.text}\n"
                                "Email: ${_emailController.text}\n"
                                "No Tlp: ${_notlpController.text}";
                          });
                        }
                      },
                      child: const Text("Simpan"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (_output != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      _output!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
