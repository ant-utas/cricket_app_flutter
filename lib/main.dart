import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  const MyHomePage({Key? key, required this.title}) : super(key : key);
  final String title;

  @override
  State<MyHomePage>createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{/*
  final List<String> names = [
    "fred",
    "george",
    "gilderoy lockhart"
  ];*/

  final List<Color> colors = [
    Colors.amber,
    Colors.blueAccent,
    Colors.purpleAccent,
  ];


  //The annotation @override marks an instance member as overriding a superclass member with the same name.
  //The intent of the @override notation is to catch situations where a superclass renames a member, and an independent subclass which used to override the member, could silently continue working using the superclass implementation.
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieModel>(
      builder: (context, movieModel, _)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text("Edit Movie"),
            ),

          );
        }
    );
  }

  Scaffold buildScaffold(BuildContext context, MovieModel movieModel, _) {
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
                  var movie = movieModel.items[index];
                  var colorpos = index%colors.length;
                  var color = colors[colorpos];
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
                itemCount:movieModel.items.length
            )
        )
      ],
      ),
    ),
  );
  }
}