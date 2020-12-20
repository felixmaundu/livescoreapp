// To parse this JSON data, do
//
//     final topScoresModel = topScoresModelFromJson(jsonString);

import 'dart:convert';

TopScoresModel topScoresModelFromJson(String str) => TopScoresModel.fromJson(json.decode(str));

String topScoresModelToJson(TopScoresModel data) => json.encode(data.toJson());

class TopScoresModel {
    TopScoresModel({
        this.success,
        this.data,
    });

    final bool success;
    final Data data;

    TopScoresModel copyWith({
        bool success,
        Data data,
    }) => 
        TopScoresModel(
            success: success ?? this.success,
            data: data ?? this.data,
        );

    factory TopScoresModel.fromJson(Map<String, dynamic> json) => TopScoresModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.competition,
        this.goalscorers,
    });

    final Competition competition;
    final List<Goalscorer> goalscorers;

    Data copyWith({
        Competition competition,
        List<Goalscorer> goalscorers,
    }) => 
        Data(
            competition: competition ?? this.competition,
            goalscorers: goalscorers ?? this.goalscorers,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        competition: Competition.fromJson(json["competition"]),
        goalscorers: List<Goalscorer>.from(json["goalscorers"].map((x) => Goalscorer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "competition": competition.toJson(),
        "goalscorers": List<dynamic>.from(goalscorers.map((x) => x.toJson())),
    };
}

class Competition {
    Competition({
        this.id,
        this.name,
    });

    final String id;
    final String name;

    Competition copyWith({
        String id,
        String name,
    }) => 
        Competition(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Goalscorer {
    Goalscorer({
        this.playerId,
        this.name,
        this.teamId,
        this.goals,
        this.assists,
        this.played,
        this.competitionId,
        this.seasonId,
        this.editionId,
        this.team,
    });

    final String playerId;
    final String name;
    final String teamId;
    final String goals;
    final String assists;
    final String played;
    final String competitionId;
    final String seasonId;
    final String editionId;
    final Team team;

    Goalscorer copyWith({
        String playerId,
        String name,
        String teamId,
        String goals,
        String assists,
        String played,
        String competitionId,
        String seasonId,
        String editionId,
        Team team,
    }) => 
        Goalscorer(
            playerId: playerId ?? this.playerId,
            name: name ?? this.name,
            teamId: teamId ?? this.teamId,
            goals: goals ?? this.goals,
            assists: assists ?? this.assists,
            played: played ?? this.played,
            competitionId: competitionId ?? this.competitionId,
            seasonId: seasonId ?? this.seasonId,
            editionId: editionId ?? this.editionId,
            team: team ?? this.team,
        );

    factory Goalscorer.fromJson(Map<String, dynamic> json) => Goalscorer(
        playerId: json["player_id"],
        name: json["name"],
        teamId: json["team_id"],
        goals: json["goals"],
        assists: json["assists"],
        played: json["played"],
        competitionId: json["competition_id"],
        seasonId: json["season_id"],
        editionId: json["edition_id"],
        team: Team.fromJson(json["team"]),
    );

    Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "name": name,
        "team_id": teamId,
        "goals": goals,
        "assists": assists,
        "played": played,
        "competition_id": competitionId,
        "season_id": seasonId,
        "edition_id": editionId,
        "team": team.toJson(),
    };
}

class Team {
    Team({
        this.id,
        this.name,
        this.stadium,
        this.location,
    });

    final String id;
    final String name;
    final String stadium;
    final String location;

    Team copyWith({
        String id,
        String name,
        String stadium,
        String location,
    }) => 
        Team(
            id: id ?? this.id,
            name: name ?? this.name,
            stadium: stadium ?? this.stadium,
            location: location ?? this.location,
        );

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        stadium: json["stadium"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stadium": stadium,
        "location": location,
    };
}
