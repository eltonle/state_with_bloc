// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:state_with_bloc/models/photo_model.dart';

class PhotoDetailView extends StatefulWidget {
  final PhotoModel photo;

  const PhotoDetailView({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  State<PhotoDetailView> createState() => _PhotoDetailViewState();
}

class _PhotoDetailViewState extends State<PhotoDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'image${widget.photo.id}',
              child: FadeInImage.assetNetwork(
                placeholder: "assets/images/no_image.jpeg",
                image: widget.photo.url,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
