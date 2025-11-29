import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/home/screens/home_screen.dart';
import '../features/letter/screens/letter_list_screen.dart';
import '../features/letter/screens/letter_create_screen.dart';
import '../features/letter/screens/letter_detail_screen.dart';
import '../features/letter/screens/letter_template_form_screen.dart';
import '../features/letter/models/letter_format.dart';

import '../features/form/screen/form_surat_page.dart';
import '../features/form/screen/hrd_list_page.dart';
import '../features/form/screen/hrd_detail_page.dart';

class AppRoutes {
  static const formSurat = "/form-surat";
  static const hrdList = "/hrd-list";
  static const detailSurat = "/detail-surat";
}

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FormSuratPage(),
    ),

    GoRoute(
      path: AppRoutes.formSurat,
      builder: (context, state) => const FormSuratPage(),
    ),
    // Create template baru
    GoRoute(
      path: '/letter/template/create',
      builder: (context, state) => const LetterTemplateFormScreen(),
    ),
    // Edit template
    GoRoute(
      path: '/letter/template/edit',
      builder: (context, state) {
        final template = state.extra as LetterFormat;
        return LetterTemplateFormScreen(template: template);
      },
    ),
    // Generate surat dari template
    GoRoute(
      path: '/letter/create',
      builder: (context, state) {
        final extra = state.extra as LetterFormat;
        return LetterCreateScreen(jenisSurat: extra);
      },
    ),

    GoRoute(
      path: AppRoutes.detailSurat,
      builder: (context, state) =>
          HrdDetailPage(surat: state.extra as Map<String, dynamic>),
    ),
  ],
);
