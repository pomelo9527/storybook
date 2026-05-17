import 'package:flutter/material.dart';

class ReaderControls extends StatelessWidget {

  const ReaderControls({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(16),

      child: Row(

        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.skip_previous),
          ),

          const SizedBox(width: 20),

          ElevatedButton.icon(
            onPressed: () {},
            icon:
                const Icon(Icons.play_arrow),
            label: const Text("AI朗读"),
          ),

          const SizedBox(width: 20),

          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }
}