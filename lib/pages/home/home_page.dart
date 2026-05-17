import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../reader/pdf_reader_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> pickPdf(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      final path = result.files.single.path;

      if (path != null && context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PdfReaderPage(
              pdfPath: path,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: Center(
        child: ElevatedButton(
          onPressed: () => pickPdf(context),
          child: const Text("选择 PDF 绘本"),
        ),
      ),
    );
  }
}