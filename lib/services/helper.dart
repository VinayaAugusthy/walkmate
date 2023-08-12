import 'dart:convert';

import 'package:walkmate/models/sneakers_model.dart';
import 'package:http/http.dart' as http;

class Hepler {
  // Future<List<Sneakers>> getMaleSneakers() async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
  //   final maleList = sneakersFromJson(data);
  //   return maleList;
  // }

  // Future<List<Sneakers>> getFemaleSneakers() async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
  //   final femaleList = sneakersFromJson(data);
  //   return femaleList;
  // }

  // Future<List<Sneakers>> getKidsSneakers() async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
  //   final kidsList = sneakersFromJson(data);
  //   return kidsList;
  // }

  // Future<Sneakers> getMaleSneakersById(String id) async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

  //   final maleList = sneakersFromJson(data);

  //   final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

  //   return sneaker;
  // }

  // Future<Sneakers> getFemaleSneakersById(String id) async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");

  //   final maleList = sneakersFromJson(data);

  //   final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

  //   return sneaker;
  // }

  // Future<Sneakers> getKidsSneakersById(String id) async {
  //   final data =
  //       await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

  //   final maleList = sneakersFromJson(data);

  //   final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

  //   return sneaker;
  // }

  Future<List<Product>> getMaleSneakers() async {
    String uri = 'https://dummyjson.com/mens-shoes/';

    final url = Uri.parse(uri);
    List maleSneakers = [];
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      for (var comingSoon in results) {
        maleSneakers.add(comingSoon);
      }
    }
    return Product.maleSneakersFromJson(maleSneakers);
  }
}
