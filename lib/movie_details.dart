import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key, required this.id}) : super(key: key);//why convert key to a super parameter???

  final int id;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final yearController = TextEditingController();
  final durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<MovieModel>(context, listen:false).items;
    var movie = movies[widget.id];
    titleController.text = movie.title;
    yearController.text = movie.year.toString();
    durationController.text = movie.duration.toString();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Movie!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //display movie id
            Text("Movie Index  ${widget.id}"),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Title"),
                      controller: titleController,
                      autofocus: true,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Year"),
                      controller: yearController,
                      autofocus: true,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Duration"),
                      controller: durationController,
                      autofocus: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(onPressed: () {
                        if (_formKey.currentState?.validate() ?? false)
                        {
                          //update the movie object
                          movie.title = titleController.text;
                          movie.year = int.parse(yearController.text); //good code would validate these
                          movie.duration = double.parse(durationController.text); //good code would validate these

                          //update the model
                          Provider.of<MovieModel>(context, listen:false).update();

                          //return to previous screen
                          Navigator.pop(context);
                        }
                      }, icon: const Icon(Icons.save), label: const Text("Save Values")),
                    )
                  ]
                )
              )
            )
          ]
        )
      ),
    );
  }
}
