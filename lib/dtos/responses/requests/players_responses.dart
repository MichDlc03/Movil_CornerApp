// To parse this JSON data, do
//
//     final playersResponseDto = playersResponseDtoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlayersResponseDto playersResponseDtoFromMap(String str) =>
    PlayersResponseDto.fromMap(json.decode(str));

String playersResponseDtoToMap(PlayersResponseDto data) =>
    json.encode(data.toMap());

class PlayersResponseDto {
  PlayersResponseDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nick,
    required this.teamId,
    required this.photos,
    required this.position,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String nick;
  final String teamId;
  final List<Photo> photos;
  final Position position;

  factory PlayersResponseDto.fromMap(Map<String, dynamic> json) =>
      PlayersResponseDto(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        nick: json["nick"],
        teamId: json["team_id"],
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromMap(x))),
        position: Position.fromMap(json["position"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "nick": nick,
        "team_id": teamId,
        "photos": List<dynamic>.from(photos.map((x) => x.toMap())),
        "position": position.toMap(),
      };
}

class Photo {
  Photo({
    required this.phFilename,
  });

  final String phFilename;

  factory Photo.fromMap(Map<String, dynamic> json) => Photo(
        phFilename: json["ph_filename"],
      );

  Map<String, dynamic> toMap() => {
        "ph_filename": phFilename,
      };
}

class Position {
  Position({
    required this.pId,
    required this.pName,
    required this.ordering,
  });

  final int pId;
  final String pName;
  final String ordering;

  factory Position.fromMap(Map<String, dynamic> json) => Position(
        pId: json["p_id"],
        pName: json["p_name"],
        ordering: json["ordering"],
      );

  Map<String, dynamic> toMap() => {
        "p_id": pId,
        "p_name": pName,
        "ordering": ordering,
      };
}
