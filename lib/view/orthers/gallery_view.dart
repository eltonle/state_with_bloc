import 'package:flutter/material.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({super.key});

  get itemBuilder => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Galery image',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return GridTile(
              footer: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.black38,
                ),
                child: Center(
                  child: Text(
                    "Customer $index",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                ),
              ),
              child: Ink.image(
                image: AssetImage("assets/images/people$index.jpeg"),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
