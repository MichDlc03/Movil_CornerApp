import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:liga_corner_app/dtos/responses/requests/players_responses.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class PlayersProvider extends ChangeNotifier {
  bool isLoading = true;

  final logger = Logger();

  List<PlayersResponseDto>? _players; //propiedad privada

  List<PlayersResponseDto>? get players =>
      _players; // obtener datos del usuario

  Future fetchUser() async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.ligasabatinadefutbol.com.mx/api/players?team_id=4&limit=1'));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final json = jsonDecode(response.body);
        final List<dynamic> data = json['data'];
        _players = data.map((e) => PlayersResponseDto.fromMap(e)).toList();
        isLoading = false;
        notifyListeners();
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
