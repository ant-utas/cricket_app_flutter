class Movie
{
  String title;
  int year;
  double duration;
  String? image;//note that image is "optional" bbecause of ?, and doesn't need the "required keyword below

  Movie({required this.title, required this.year, required this.duration, this.image});//constructor
}