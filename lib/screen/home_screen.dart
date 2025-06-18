import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/severices/movie%20_repo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MovieDataModel?> collectionFuture;

  @override
  void initState() {
    super.initState();
    collectionFuture = fetchCollection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MovieDataModel?>(
        future: collectionFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            final collection = snapshot.data!;
            return ListView.builder(
              itemCount: collection.parts?.length,
              itemBuilder: (context, index) {
                final movie = collection.parts?[index];
                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie?.title ?? ""),
                  subtitle: Text('Release Date: ${movie?.releaseDate}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data found.'));
          }
        },
      ),
    );
  }
}
