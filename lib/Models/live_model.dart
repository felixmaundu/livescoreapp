
// To parse this JSON data, do
//
//     final liveModel = liveModelFromJson(jsonString);

import 'dart:convert';

LiveModel liveModelFromJson(String str) => LiveModel.fromJson(json.decode(str));

String liveModelToJson(LiveModel data) => json.encode(data.toJson());

class LiveModel {
    LiveModel({
        this.success,
        this.data,
    });

    final bool success;
    final Data data;

    LiveModel copyWith({
        bool success,
        Data data,
    }) => 
        LiveModel(
            success: success ?? this.success,
            data: data ?? this.data,
        );

    factory LiveModel.fromJson(Map<String, dynamic> json) => LiveModel(
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
        this.match,
    });

    final List<Match> match;

    Data copyWith({
        List<Match> match,
    }) => 
        Data(
            match: match ?? this.match,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        match: List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "match": List<dynamic>.from(match.map((x) => x.toJson())),
    };
}

class Match {
    Match({
        this.competitionId,
        this.status,
        this.htScore,
        this.ftScore,
        this.etScore,
        this.lastChanged,
        this.id,
        this.leagueName,
        this.awayId,
        this.score,
        this.competitionName,
        this.events,
        this.homeId,
        this.awayName,
        this.added,
        this.time,
        this.homeName,
        this.leagueId,
        this.location,
        this.fixtureId,
        this.scheduled,
    });

    final int competitionId;
    final String status;
    final String htScore;
    final String ftScore;
    final String etScore;
    final DateTime lastChanged;
    final int id;
    final String leagueName;
    final int awayId;
    final String score;
    final String competitionName;
    final dynamic events;
    final int homeId;
    final String awayName;
    final DateTime added;
    final String time;
    final String homeName;
    final int leagueId;
    final String location;
    final int fixtureId;
    final String scheduled;

    Match copyWith({
        int competitionId,
        String status,
        String htScore,
        String ftScore,
        String etScore,
        DateTime lastChanged,
        int id,
        String leagueName,
        int awayId,
        String score,
        String competitionName,
        dynamic events,
        int homeId,
        String awayName,
        DateTime added,
        String time,
        String homeName,
        int leagueId,
        String location,
        int fixtureId,
        String scheduled,
    }) => 
        Match(
            competitionId: competitionId ?? this.competitionId,
            status: status ?? this.status,
            htScore: htScore ?? this.htScore,
            ftScore: ftScore ?? this.ftScore,
            etScore: etScore ?? this.etScore,
            lastChanged: lastChanged ?? this.lastChanged,
            id: id ?? this.id,
            leagueName: leagueName ?? this.leagueName,
            awayId: awayId ?? this.awayId,
            score: score ?? this.score,
            competitionName: competitionName ?? this.competitionName,
            events: events ?? this.events,
            homeId: homeId ?? this.homeId,
            awayName: awayName ?? this.awayName,
            added: added ?? this.added,
            time: time ?? this.time,
            homeName: homeName ?? this.homeName,
            leagueId: leagueId ?? this.leagueId,
            location: location ?? this.location,
            fixtureId: fixtureId ?? this.fixtureId,
            scheduled: scheduled ?? this.scheduled,
        );

    factory Match.fromJson(Map<String, dynamic> json) => Match(
        competitionId: json["competition_id"],
        status: json["status"],
        htScore: json["ht_score"],
        ftScore: json["ft_score"],
        etScore: json["et_score"],
        lastChanged: DateTime.parse(json["last_changed"]),
        id: json["id"],
        leagueName: json["league_name"],
        awayId: json["away_id"],
        score: json["score"],
        competitionName: json["competition_name"],
        events: json["events"],
        homeId: json["home_id"],
        awayName: json["away_name"],
        added: DateTime.parse(json["added"]),
        time: json["time"],
        homeName: json["home_name"],
        leagueId: json["league_id"],
        location: json["location"],
        fixtureId: json["fixture_id"],
        scheduled: json["scheduled"],
    );

    Map<String, dynamic> toJson() => {
        "competition_id": competitionId,
        "status": status,
        "ht_score": htScore,
        "ft_score": ftScore,
        "et_score": etScore,
        "last_changed": lastChanged.toIso8601String(),
        "id": id,
        "league_name": leagueName,
        "away_id": awayId,
        "score": score,
        "competition_name": competitionName,
        "events": events,
        "home_id": homeId,
        "away_name": awayName,
        "added": added.toIso8601String(),
        "time": time,
        "home_name": homeName,
        "league_id": leagueId,
        "location": location,
        "fixture_id": fixtureId,
        "scheduled": scheduled,
    };}












































































// class LiveModel{ 
//     int competitionId;
//     String status;
//      String htScore;
//     String ftScore;
//     String etScore;
//      DateTime lastChanged;
//      int id;
//      String leagueName;
//      int awayId;
//      String score;
//      String competitionName;
//      dynamic events;
//      int homeId;
//      String awayName;
//      DateTime added;
//      String time;
//      String homeName;
//      int leagueId;
//      String location;
//      int fixtureId;
//      String scheduled;

//      LiveModel( 
//        { 
//          this.competitionId,
//         this.status,
//         this.htScore,
//         this.ftScore,
//         this.etScore,
//         this.lastChanged,
//         this.id,
//         this.leagueName,
//         this.awayId,
//         this.score,
//         this.competitionName,
//         this.events,
//         this.homeId,
//         this.awayName,
//         this.added,
//         this.time,
//         this.homeName,
//         this.leagueId,
//         this.location,
//         this.fixtureId,
//         this.scheduled, 
//        }
//      );

//      factory LiveModel.fromJson(Map<String, dynamic> json) { 
//        return LiveModel( 
//            competitionId: json["competition_id"],
//         status: json["status"],
//         htScore: json["ht_score"],
//         ftScore: json["ft_score"],
//         etScore: json["et_score"],
//         lastChanged: DateTime.parse(json["last_changed"]),
//         id: json["id"],
//         leagueName: json["league_name"],
//         awayId: json["away_id"],
//         score: json["score"],
//         competitionName: json["competition_name"],
//         events: json["events"],
//         homeId: json["home_id"],
//         awayName: json["away_name"],
//         added: DateTime.parse(json["added"]),
//         time: json["time"],
//         homeName: json["home_name"],
//         leagueId: json["league_id"],
//         location: json["location"],
//         fixtureId: json["fixture_id"],
//         scheduled: json["scheduled"],
//        );
//      }

//   get data => null;

// }

