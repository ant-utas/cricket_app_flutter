import 'package:flutter/material.dart';

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
                        if (_formKey.currentState?.validate() ?? false) {
                          //save the movie

                          //return to previous screen
                          Navigator.pop(context);//unwind type beat
                        }
                      },
                        icon: const Icon(Icons.save), label: const Text("Save Values")
                      ),
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
