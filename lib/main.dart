import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_details.dart';

void main() {
  runApp(const MyApp());//entry
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key : key);//container for everything

  //This widget is the root of application
  @override
  Widget build(BuildContext context) {//A handle to the location of a widget in the widget tree
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const MyHomePage(title: 'List Tutorial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key : key);
  final String title;

  @override
  State<MyHomePage>createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  final List<String> names = [
    "fred",
    "george",
    "gilderoy lockhart"
  ];
//https://en.wikipedia.org/wiki/File:Lord_Rings_Fellowship_Ring.jpg
  final List<Movie> movies = [
    Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"),
    Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"),
    Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"),
  ];

  final List<Color> colors = [
    Colors.amber,
    Colors.blueAccent,
    Colors.purpleAccent,
  ];


  //The annotation @override marks an instance member as overriding a superclass member with the same name.
  //The intent of the @override notation is to catch situations where a superclass renames a member, and an independent subclass which used to override the member, could silently continue working using the superclass implementation.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.title),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          //ui here
          Expanded(//what does expanded mean???
            child: ListView.builder(//instead of hard coding children we can use a function to define what each item looks like , provide item count to say how many items in the list; dynamic
                itemBuilder: (_, index) {//build context and int // "context" || "_"
                  var movie = movies[index];
                  var color = colors[index];
                  final image = movie.image;//why make this final?
                  return ListTile(
                      title:Text(movie.title),
                      subtitle: Text("${movie.year} - ${movie.duration} Hours"),
                      leading: image != null ? Image.network(image): null,
                      tileColor: color,

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {return MovieDetails(id:index); }));
                      },
                  );
                },
                itemCount:names.length
            )
          )
        ],
        ),
      ),
    );
  }
}