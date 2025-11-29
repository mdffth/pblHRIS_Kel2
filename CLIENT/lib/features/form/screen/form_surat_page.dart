import 'package:flutter/material.dart';

class FormSuratPage extends StatefulWidget {
  const FormSuratPage({super.key});

  @override
  State<FormSuratPage> createState() => _FormSuratPageState();
}

class _FormSuratPageState extends State<FormSuratPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jabatanController = TextEditingController();

  String? selectedJenisSurat;
  DateTime? selectedDate;

  final List<String> jenisSuratList = ["Izin", "Sakit", "Tugas"];

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Widget input box cantik
  Widget inputBox({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffb5d8ff)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // soft blue background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffe7f2ff),
              Color(0xffd3e8ff),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),

                  // JUDUL
                  const Text(
                    "Form Pengajuan Surat",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1e6ab3),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // NAMA
                  inputBox(
                    child: TextField(
                      controller: namaController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nama",
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // JABATAN
                  inputBox(
                    child: TextField(
                      controller: jabatanController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Jabatan",
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                   // DEPARTEMEN
                  inputBox(
                    child: TextField(
                      controller: jabatanController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Departemen",
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // JENIS SURAT DROPDOWN
                  inputBox(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedJenisSurat,
                        hint: const Text(
                          "Pilih Jenis Surat",
                          style: TextStyle(color: Colors.blue),
                        ),
                        isExpanded: true,
                        items: jenisSuratList.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedJenisSurat = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // TANGGAL
                  GestureDetector(
                    onTap: pickDate,
                    child: inputBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            selectedDate == null
                                ? "Pilih Tanggal"
                                : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          const Icon(Icons.calendar_month, color: Colors.blue),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // BUTTON AJUKAN
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4da3ff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shadowColor: Colors.black.withOpacity(0.2),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Ajukan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
