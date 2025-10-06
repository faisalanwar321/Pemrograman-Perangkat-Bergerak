import 'package:flutter/material.dart';

class MatkulPage extends StatefulWidget {
  const MatkulPage({super.key});

  @override
  State<MatkulPage> createState() => _MatkulPageState();
}

class _MatkulPageState extends State<MatkulPage> {
  final _formKey = GlobalKey<FormState>();
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _sksController = TextEditingController();

  String? _output;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Mata Kuliah")),
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
                      controller: _kodeController,
                      decoration: const InputDecoration(
                        labelText: "Kode Matkul",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Wajib diisi" : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                        labelText: "Nama Matkul",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Wajib diisi" : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _sksController,
                      decoration: const InputDecoration(
                        labelText: "SKS Matkul",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _output =
                            "Kode Matkul: ${_kodeController.text}\n"
                                "Nama Matkul: ${_namaController.text}\n"
                                "SKS: ${_sksController.text}";
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
