import 'package:livescoreapp/new_models/out_come_model.dart';

class PastMatchModel {
    PastMatchModel({
        this.added,
        this.etScore,
        this.scheduled,
        this.awayId,
        this.htScore,
        this.status,
        this.homeName,
        this.date,
        this.leagueId,
        this.competitionName,
        this.location,
        this.awayName,
        this.lastChanged,
        this.fixtureId,
        this.competitionId,
        this.events,
        this.h2H,
        this.homeId,
        this.score,
        this.ftScore,
        this.time,
        this.id,
        this.outcomes,
    });

    DateTime added;
    String etScore;
    dynamic scheduled;
    int awayId;
    String htScore;
    String status;
    String homeName;
    DateTime date;
    int leagueId;
    String competitionName;
    dynamic location;
    String awayName;
    DateTime lastChanged;
    int fixtureId;
    int competitionId;
    String events;
    String h2H;
    int homeId;
    String score;
    String ftScore;
    String time;
    int id;
    OutcomeModel outcomes;

    factory PastMatchModel.fromJson(Map<String, dynamic> json) => PastMatchModel(
        added: DateTime.parse(json["added"]),
        etScore: json["et_score"],
        scheduled: json["scheduled"],
        awayId: json["away_id"],
        htScore: json["ht_score"],
        status: json["status"],
        homeName: json["home_name"],
        date: DateTime.parse(json["date"]),
        leagueId: json["league_id"],
        competitionName: json["competition_name"],
        location: json["location"],
        awayName: json["away_name"],
        lastChanged: DateTime.parse(json["last_changed"]),
        fixtureId: json["fixture_id"],
        competitionId: json["competition_id"],
        events: json["events"],
        h2H: json["h2h"],
        homeId: json["home_id"],
        score: json["score"],
        ftScore: json["ft_score"],
        time: json["time"],
        id: json["id"],
        outcomes: OutcomeModel.fromJson(json["outcomes"]),
    );

    Map<String, dynamic> toJson() => {
        "added": added.toIso8601String(),
        "et_score": etScore,
        "scheduled": scheduled,
        "away_id": awayId,
        "ht_score": htScore,
        "status": status,
        "home_name": homeName,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "league_id": leagueId,
        "competition_name": competitionName,
        "location": location,
        "away_name": awayName,
        "last_changed": lastChanged.toIso8601String(),
        "fixture_id": fixtureId,
        "competition_id": competitionId,
        "events": events,
        "h2h": h2H,
        "home_id": homeId,
        "score": score,
        "ft_score": ftScore,
        "time": time,
        "id": id,
        "outcomes": outcomes.toJson(),
    };
}