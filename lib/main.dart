import 'package:cricket_app/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'List Tutorial'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  final List<Color>colors = [
    const Color.fromRGBO(208, 5, 240, 100),//purple
    const Color.fromRGBO(60, 5, 240, 100),//blue
    const Color.fromRGBO(5, 170, 240, 100),//light blue
    const Color.fromRGBO(5, 240, 158, 100),//teal
    const Color.fromRGBO(29, 240, 5, 100),//green
    const Color.fromRGBO(177, 240, 5, 100),//lime
    const Color.fromRGBO(240, 189, 5, 100),//dandelion
    const Color.fromRGBO(240, 52, 5, 100),//blood orange
    const Color.fromRGBO(240, 5, 5, 100),//red af
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieModel>(
        builder:buildScaffold
    );
  }

  Scaffold buildScaffold(BuildContext context, MovieModel movieModel, _) {//context, movie model to consume, blank/omit parameter
    return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          //YOUR UI HERE
          Expanded(
            child: Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    //returns WIDGET
                    //BUILDER allows us to assign children using a function rather than hard-coding
                    //CONTEXT : act on behalf of calling/parent widget
                    var movie = movieModel.items[index];
                    var color = colors[index%colors.length];
                    final image = movie.image;
                    return ListTile(
                      title:Text(movie.title),
                      subtitle: Text("${movie.year} - ${movie.duration} Hours"),
                      tileColor: color,
                      leading: image != null ? Image.network(image) : null,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) { return MovieDetails(id:index); }));
                      },
                    );
                  },
                  itemCount:movieModel.items.length
              ),
            )
          )
        ],
      ),
    ),
  );
  }
}