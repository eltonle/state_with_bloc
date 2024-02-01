import 'package:flutter/material.dart';
import 'package:state_with_bloc/cell/grid_cell.dart';
import 'package:state_with_bloc/repositories/orders/network_request.dart';
import 'package:state_with_bloc/view/orthers/photo_detail_view.dart';

import '../../models/photo_model.dart';

class Photoview extends StatefulWidget {
  const Photoview({super.key});

  @override
  State<Photoview> createState() => _PhotoviewState();
}

class _PhotoviewState extends State<Photoview> {
  gridView(AsyncSnapshot<List<PhotoModel>> snapshot) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1,
        children: snapshot.data!.map((photo) {
          return GestureDetector(
            child: GridTile(
              child: GridCell(photo: photo),
            ),
            onTap: () {
              // gotoDetailPage(context, photo);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) =>
                      PhotoDetailView(photo: photo),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  // gotoDetailPage(BuildContext context, PhotoModel photo) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute<void>(
  //       builder: (BuildContext context) => PhotoDetailView(photo: photo),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid view with service"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: FutureBuilder(
              future: NetworkRequest.fetchPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return gridView(snapshot);
                }
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
