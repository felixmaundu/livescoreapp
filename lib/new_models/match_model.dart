import 'package:livescoreapp/new_models/out_come_model.dart';

class MatchModel {
    MatchModel({
        this.awayName,
        this.h2H,
        this.added,
        this.awayId,
        this.htScore,
        this.homeName,
        this.competitionId,
        this.leagueId,
        this.competitionName,
        this.score,
        this.lastChanged,
        this.status,
        this.fixtureId,
        this.leagueName,
        this.events,
        this.ftScore,
        this.scheduled,
        this.homeId,
        this.location,
        this.etScore,
        this.time,
        this.id,
        this.outcomes,
        this.info,
    });

    String awayName;
    String h2H;
    DateTime added;
    int awayId;
    String htScore;
    String homeName;
    int competitionId;
    int leagueId;
    String competitionName;
    String score;
    DateTime lastChanged;
    String status;
    int fixtureId;
    String leagueName;
    String events;
    String ftScore;
    String scheduled;
    int homeId;
    String location;
    String etScore;
    String time;
    int id;
    OutcomeModel outcomes;
    String info;

    factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        awayName: json["away_name"],
        h2H: json["h2h"],
        added: DateTime.parse(json["added"]),
        awayId: json["away_id"],
        htScore: json["ht_score"],
        homeName: json["home_name"],
        competitionId: json["competition_id"],
        leagueId: json["league_id"],
        competitionName: json["competition_name"],
        score: json["score"],
        lastChanged: DateTime.parse(json["last_changed"]),
        status: json["status"],
        fixtureId: json["fixture_id"],
        leagueName: json["league_name"],
        events: json["events"],
        ftScore: json["ft_score"],
        scheduled: json["scheduled"],
        homeId: json["home_id"],
        location: json["location"],
        etScore: json["et_score"],
        time: json["time"],
        id: json["id"],
        outcomes: OutcomeModel.fromJson(json["outcomes"]),
        info: json["info"],
    );

    Map<String, dynamic> toJson() => {
        "away_name": awayName,
        "h2h": h2H,
        "added": added.toIso8601String(),
        "away_id": awayId,
        "ht_score": htScore,
        "home_name": homeName,
        "competition_id": competitionId,
        "league_id": leagueId,
        "competition_name": competitionName,
        "score": score,
        "last_changed": lastChanged.toIso8601String(),
        "status": status,
        "fixture_id": fixtureId,
        "league_name": leagueName,
        "events": events,
        "ft_score": ftScore,
        "scheduled": scheduled,
        "home_id": homeId,
        "location": location,
        "et_score": etScore,
        "time": time,
        "id": id,
        "outcomes": outcomes.toJson(),
        "info": info,
    };
}

//fixed model which comes as list