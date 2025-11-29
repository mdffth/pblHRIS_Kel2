import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../services/api_service.dart';
import '../../../routes/app_routes.dart';
import 'package:tracer_study_test_api/routes/app_routes.dart';


class HrdListPage extends StatefulWidget {
  const HrdListPage({super.key});

  @override
  State<HrdListPage> createState() => _HrdListPageState();
}

class _HrdListPageState extends State<HrdListPage> {
  List data = [];
  bool loading = false;

  Future<void> loadData() async {
    setState(() => loading = true);
    data = await ApiService.getSurat();
    setState(() => loading = false);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Approval HRD")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadData,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final s = data[index];
                  return ListTile(
                    title: Text("${s['nama']} - ${s['jenis_surat']}"),
                    subtitle: Text(s['tanggal'] ?? ''),
                    trailing: Text(s['status'] ?? ''),
                    onTap: () async {
                      await context.push(AppRoutes.detailSurat, extra: s);
                      await loadData();
                    },
                  );
                },
              ),
            ),
    );
  }
}
