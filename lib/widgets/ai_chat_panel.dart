import 'package:flutter/material.dart';

class AIChatPanel extends StatefulWidget {

  const AIChatPanel({super.key});

  @override
  State<AIChatPanel> createState() =>
      _AIChatPanelState();
}

class _AIChatPanelState
    extends State<AIChatPanel> {

  final controller =
      TextEditingController();

  final List<String> messages = [
    "你好呀，我是故事姐姐～",
  ];

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        const SizedBox(height: 30),

        const Text(
          "故事姐姐",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        Expanded(

          child: ListView.builder(

            itemCount: messages.length,

            itemBuilder: (_, index) {

              return ListTile(
                title:
                    Text(messages[index]),
              );
            },
          ),
        ),

        Padding(

          padding: const EdgeInsets.all(12),

          child: Row(

            children: [

              Expanded(

                child: TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(
                    hintText: "问故事姐姐...",
                  ),
                ),
              ),

              IconButton(

                onPressed: () {

                  setState(() {

                    messages.add(
                      controller.text,
                    );

                    messages.add(
                      "这是 AI 回答示例",
                    );

                    controller.clear();
                  });
                },

                icon:
                    const Icon(Icons.send),
              )
            ],
          ),
        )
      ],
    );
  }
}