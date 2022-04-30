import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  Future<Album> futureAlbum = fetchAlbum();
  //print(futureAlbum);
  //print(futureAlbum);
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://luana.host/api/apientrega/municipiopedentes/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  int userId;
  //int id;
  String title;

  Album({
    required this.userId,
    //required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['municipio'] as int,
      //id: json['municipio'] as int,
      title: json['message'] as String,
    );
  }
}
