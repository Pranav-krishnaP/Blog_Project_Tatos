import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Objects {
  String? group;
  String? profession;
  String? authorimage;
  String? courseimage;
  String? desc;
  String? author;
  String? title;
  String? date;

  Objects(
      {this.group,
      this.authorimage,
      this.profession,
      this.courseimage,
      this.desc,
      this.author,
      this.title,
      this.date});
}

class Fetchdetails extends GetxController {
  var isLoading = 1.obs;
  List<Objects> result = [];

  void fetchdata() async {
    String url =
        "http://localhost:1337/api/epilectuses?populate=courseimage,authorimage";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        List<Objects> res = [];
        for (var x in responseData['data']) {
          Objects obj = Objects(
              author: x['attributes']['author'],
              title: x['attributes']['title'],
              // ignore: prefer_interpolation_to_compose_strings
              courseimage: 'http://localhost:1337' +
                  x['attributes']['courseimage']['data']['attributes']
                      ['formats']['thumbnail']['url'],
              // ignore: prefer_interpolation_to_compose_strings
              authorimage: 'http://localhost:1337' +
                  x['attributes']['authorimage']['data']['attributes']['url'],
              desc: x['attributes']['description'],
              date: x['attributes']['date'],
              profession: x['attributes']['profession'],
              group: x['attributes']['group']);
          res.add(obj);
        }
        result = res;
        isLoading.value = 0;
      }
    } on Exception catch (_) {
      isLoading.value = -1;
      print("Error");
    }
  }
}

List<Objects> content = [
  Objects(
      group: "UI DESIGN",
      authorimage: "assets/images/author.png",
      profession: "UI Designer",
      courseimage: "assets/images/Rectangle 4.png",
      desc:
          "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
      author: "Leslie Alexander",
      title:
          "Understanding color theory: the color wheel and finding complementary colors",
      date: "July 2, 2021"),
  Objects(
      group: "UI DESIGN",
      authorimage: "assets/images/author.png",
      profession: "UI Designer",
      courseimage: "assets/images/Rectangle 4.png",
      desc:
          "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
      author: "Leslie Alexander",
      title:
          "Understanding color theory: the color wheel and finding complementary colors",
      date: "July 2, 2021"),
  Objects(
      group: "UI DESIGN",
      authorimage: "assets/images/author.png",
      profession: "UI Designer",
      courseimage: "assets/images/Rectangle 4.png",
      desc:
          "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
      author: "Leslie Alexander",
      title:
          "Understanding color theory: the color wheel and finding complementary colors",
      date: "July 2, 2021"),
  Objects(
      group: "UI DESIGN",
      authorimage: "assets/images/author.png",
      profession: "UI Designer",
      courseimage: "assets/images/Rectangle 4.png",
      desc:
          "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
      author: "Leslie Alexander",
      title:
          "Understanding color theory: the color wheel and finding complementary colors",
      date: "July 2, 2021"),
  Objects(
      group: "UI DESIGN",
      authorimage: "assets/images/author.png",
      profession: "UI Designer",
      courseimage: "assets/images/Rectangle 4.png",
      desc:
          "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
      author: "Leslie Alexander",
      title:
          "Understanding color theory: the color wheel and finding complementary colors",
      date: "July 2, 2021"),
];
