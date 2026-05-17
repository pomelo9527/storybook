import 'package:flutter/material.dart';

class ReadingOverlay extends StatelessWidget {

  final List<String> sentences;
  final int currentIndex;

  const ReadingOverlay({
    super.key,
    required this.sentences,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Wrap(

        spacing: 10,

        children: List.generate(
          sentences.length,
          (index) {

            final active =
                index == currentIndex;

            return AnimatedContainer(

              duration:
                  const Duration(
                      milliseconds: 300),

              padding:
                  const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: active
                    ? Colors.yellow
                    : Colors.white,
                borderRadius:
                    BorderRadius.circular(
                        12),
              ),

              child: Text(
                sentences[index],
              ),
            );
          },
        ),
      ),
    );
  }
}