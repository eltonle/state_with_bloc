import 'package:flutter/material.dart';
import 'package:state_with_bloc/locator.dart';
import 'package:state_with_bloc/models/controller/meme_controller.dart';

import '../../models/meme_model.dart';

class MemeView extends StatefulWidget {
  const MemeView({super.key});

  @override
  State<MemeView> createState() => _MemeViewState();
}

class _MemeViewState extends State<MemeView> {
  Meme? visibleMeme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('getit'),
        centerTitle: true,
      ),
      body: Container(
        child: visibleMeme != null
            ? Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Category ${visibleMeme!.category}",
                          style: const TextStyle(fontSize: 36),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: Image.network(visibleMeme!.image),
                        ),
                        const SizedBox(height: 8),
                        Text("Caption: ${visibleMeme!.caption}"),
                      ],
                    ),
                  ),
                ),
              )
            : const Center(child: Text("No Meme loaded yet")),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.skip_next),
        onPressed: () async {
          // TODO 5: Locate the service with GetIt and call getNextMeme
          Meme meme = await locator.get<MemeController>().getNextMemes();
          // TODO 7: Use setState to update the visibleMeme
          setState(() {
            visibleMeme = meme;
          });
        },
      ),
    );
  }
}
