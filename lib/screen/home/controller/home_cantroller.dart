import 'package:get/get.dart';
import 'package:movierating/utils/api_helper.dart';


class HomeController extends GetxController
{
  List movielink=[
    'https://m.media-amazon.com/images/M/MV5BMjI2Njg2Y2EtZjgwMC00ZGVkLWJmMWYtYjVhYjk2ZTkwNWE1XkEyXkFqcGdeQXVyMTMxMjA5NDU1._V1_UY209_CR13,0,140,209_AL_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDRiOWNjYjUtMDI0ZC00MDMyLTkwZDItNTU5NWQ1NjEyNGYxXkEyXkFqcGdeQXVyMTIyNzY0NTMx._V1_UX140_CR0,0,140,209_AL_.jpg',
    'https://m.media-amazon.com/images/M/MV5BNDA5OWE3YTUtNjU0Mi00MWI0LTg3ODgtYmUwNzdkNTdiOWQ2XkEyXkFqcGdeQXVyOTI3MzI4MzA@._V1_UY209_CR8,0,140,209_AL_.jpg',
    'https://m.media-amazon.com/images/M/MV5BODUwNDNjYzctODUxNy00ZTA2LWIyYTEtMDc5Y2E5ZjBmNTMzXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_UY209_CR8,0,140,209_AL_.jpg',
    'https://m.media-amazon.com/images/M/MV5BYTEyYjgzNmUtM2QyYi00MWMwLWExMDctZmY1NmZhNGY5MWNiXkEyXkFqcGdeQXVyOTcwMTQxMTM@._V1_UY209_CR13,0,140,209_AL_.jpg',
  ];

  List moviename=[
    'Kgf 2',
    'Vikram',
    'Bhediya ',
    'RRR',
    'Vikram Vedha',
  ];

  List seriesLink=[
    'https://m.media-amazon.com/images/M/MV5BOGFiZjU5NGEtNTAwNS00ZjI2LTg0YTktNjg0ODFlM2E0NGVhXkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_UX140_CR0,0,140,209_AL_.jpg',
    'https://m.media-amazon.com/images/M/MV5BM2QzMWM5OTgtZDE1MC00ZmMyLWIyODItMmQ4NjNlZGRjYTUzXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_UY209_CR0,0,140,209_AL_.jpg',
    'https://m.media-amazon.com/images/M/MV5BNDYyNjYyYzItMmIyZi00ODgwLWFjMGEtNzk4Y2E4NDA3MmFkXkEyXkFqcGdeQXVyMTI1NDEyNTM5._V1_UY209_CR35,0,140,209_AL_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZGMxZjczODgtYWE0NS00MzZlLWI4NDItNTc5YmE5ZDlmNmU2XkEyXkFqcGdeQXVyODU4NzI4NDI@._V1_UY209_CR0,0,140,209_AL_.jpg',
  ];

  List seriesname=[
    'Yellowstone',
    'Inventing Anna',
    'The Fame Game',
    'Anatomy of a Scandal',
  ];

  String name='';
  List movie = [];

  RxInt index=0.obs;

  Future<List> MovieJson(String name)
  async {
    Api api = Api();
    movie = await api.MovieApi(name);
    return movie;
  }
}