import 'package:flutter/material.dart';
class Movie
{
  String title;
  int year;
  double duration;
  String? image;//note that image is "optional" bbecause of ?, and doesn't need the "required keyword below

  Movie({required this.title, required this.year, required this.duration, this.image});//constructor
}

class MovieModel extends ChangeNotifier {

  final List<Movie> items = [];
  MovieModel()
  {
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
    add(Movie(title: "Lord of the Rings", year: 2001, duration: 9001, image: "https://upload.wikimedia.org/wikipedia/en/f/fb/Lord_Rings_Fellowship_Ring.jpg"));
  }
  void removeAll()
  {
    items.clear();//array function to remove all items in list
    update();
  }
  void add(Movie item)
  {
    items.add(item);
    update();
  }
  void update()
  {
    notifyListeners();//update any listeners, tells the widgets that are listening to this model to rebuild
  }
}