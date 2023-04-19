import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movierating/screen/home/modal/home_modal.dart';

class Api
{
  List Movielist =[];

  Future<List> MovieApi(String name)
  async {
    String link = "https://imdb8.p.rapidapi.com/auto-complete?q=$name";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri,headers: {"X-RapidAPI-Key":"1bae965847msh1c51a72299723cep1e06cfjsn63a623c0d4b6","X-RapidAPI-Host":"imdb8.p.rapidapi.com"});
    var json = jsonDecode(response.body);
    var movie = Movie.fromJson(json);
    Movielist = movie.d!;
    return Movielist;
  }
}