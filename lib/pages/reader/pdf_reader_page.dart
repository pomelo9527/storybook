import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

import '../../widgets/reader_controls.dart';
import '../../widgets/reading_overlay.dart';
import '../../widgets/ai_chat_panel.dart';

class PdfReaderPage extends StatefulWidget {

  final String pdfPath;

  const PdfReaderPage({
    super.key,
    required this.pdfPath,
  });

  @override
  State<PdfReaderPage> createState() =>
      _PdfReaderPageState();
}

class _PdfReaderPageState
    extends State<PdfReaderPage> {

  late PdfControllerPinch controller;

  final List<String> sentences = [
    "小兔子正在森林里散步",
    "它看到了很多小动物",
    "太阳慢慢落山了",
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    controller = PdfControllerPinch(
      document: PdfDocument.openFile(
        widget.pdfPath,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Row(

          children: [

            Expanded(

              flex: 7,

              child: Stack(

                children: [

                  PdfViewPinch(
                    controller: controller,
                    scrollDirection:
                        Axis.horizontal,
                  ),

                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 30,
                    child: ReadingOverlay(
                      sentences: sentences,
                      currentIndex:
                          currentIndex,
                    ),
                  )
                ],
              ),
            ),

            Expanded(

              flex: 3,

              child: Container(

                color: Colors.white,

                child: const AIChatPanel(),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar:
          const ReaderControls(),
    );
  }
}