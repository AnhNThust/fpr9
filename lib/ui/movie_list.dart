import 'package:flutter/material.dart';
import 'package:fpr9/blocs/movies_bloc.dart';

class Movielist extends StatefulWidget {
  @override
  _MovielistState createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  final bloc = MoviesBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //load data to Bloc
    bloc.fetchAllMovies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //close Bloc
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phim phổ biến"),
      ),

      //Get data from Stream
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          //Show loading data trước khi get data
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

Widget buildList(AsyncSnapshot snapshot) {
  return GridView.builder(
    itemCount: snapshot.data.results.length,
    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3),
    itemBuilder: (BuildContext context, int index) {
      return GridTile(
        child: InkResponse(
          enableFeedback: true,
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data
                .results[index].poster_path}',
            fit: BoxFit.cover,
          ),
          onTap: () {},
        ),
      );
    },
  );
}
