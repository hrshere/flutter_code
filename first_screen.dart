import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:listview_navigation_api/modal_class/modal_class_one.dart';

import 'package:listview_navigation_api/api/api_service_one.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Photo>>(
      future: ServiceApi.fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('An error has occurred!'),
          );
        } else if (snapshot.hasData) {
          return PhotosList(photos: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: ListTile(
            dense: true,
            leading: Image.network(photos[index].thumbnailUrl),
            title: Text(photos[index].title),
            onTap: () => {
              Navigator.pushNamed(context, '/second',
                  arguments: Photo(albumId: photos[index].albumId, id: photos[index].id, title: photos[index].title, url: photos[index].url, thumbnailUrl: photos[index].thumbnailUrl)
              )
            },
          ),
        );
      },
    );
  }
}
