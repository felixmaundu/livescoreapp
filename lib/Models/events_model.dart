// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) => EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
    EventsModel({
        this.success,
        this.data,
    });

    final bool success;
    final Data data;

    EventsModel copyWith({
        bool success,
        Data data,
    }) => 
        EventsModel(
            success: success ?? this.success,
            data: data ?? this.data,
        );

    factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
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
        this.event,
        this.match,
    });

    final List<Event> event;
    final Match match;

    Data copyWith({
        List<Event> event,
        Match match,
    }) => 
        Data(
            event: event ?? this.event,
            match: match ?? this.match,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        event: List<Event>.from(json["event"].map((x) => Event.fromJson(x))),
        match: Match.fromJson(json["match"]),
    );

    Map<String, dynamic> toJson() => {
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
        "match": match.toJson(),
    };
}

class Event {
    Event({
        this.id,
        this.matchId,
        this.player,
        this.time,
        this.event,
        this.sort,
        this.homeAway,
    });

    final String id;
    final String matchId;
    final String player;
    final String time;
    final String event;
    final String sort;
    final String homeAway;

    Event copyWith({
        String id,
        String matchId,
        String player,
        String time,
        String event,
        String sort,
        String homeAway,
    }) => 
        Event(
            id: id ?? this.id,
            matchId: matchId ?? this.matchId,
            player: player ?? this.player,
            time: time ?? this.time,
            event: event ?? this.event,
            sort: sort ?? this.sort,
            homeAway: homeAway ?? this.homeAway,
        );

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        matchId: json["match_id"],
        player: json["player"],
        time: json["time"],
        event: json["event"],
        sort: json["sort"],
        homeAway: json["home_away"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "match_id": matchId,
        "player": player,
        "time": time,
        "event": event,
        "sort": sort,
        "home_away": homeAway,
    };
}

class Match {
    Match({
        this.id,
        this.date,
        this.homeName,
        this.awayName,
        this.score,
        this.htScore,
        this.ftScore,
        this.etScore,
        this.time,
        this.leagueId,
        this.status,
        this.added,
        this.lastChanged,
        this.homeId,
        this.awayId,
        this.competitionId,
        this.location,
        this.fixtureId,
        this.scheduled,
        this.home,
        this.away,
        this.competition,
    });

    final String id;
    final DateTime date;
    final String homeName;
    final String awayName;
    final String score;
    final String htScore;
    final String ftScore;
    final String etScore;
    final String time;
    final String leagueId;
    final String status;
    final DateTime added;
    final DateTime lastChanged;
    final String homeId;
    final String awayId;
    final String competitionId;
    final dynamic location;
    final dynamic fixtureId;
    final dynamic scheduled;
    final Away home;
    final Away away;
    final Competition competition;

    Match copyWith({
        String id,
        DateTime date,
        String homeName,
        String awayName,
        String score,
        String htScore,
        String ftScore,
        String etScore,
        String time,
        String leagueId,
        String status,
        DateTime added,
        DateTime lastChanged,
        String homeId,
        String awayId,
        String competitionId,
        dynamic location,
        dynamic fixtureId,
        dynamic scheduled,
        Away home,
        Away away,
        Competition competition,
    }) => 
        Match(
            id: id ?? this.id,
            date: date ?? this.date,
            homeName: homeName ?? this.homeName,
            awayName: awayName ?? this.awayName,
            score: score ?? this.score,
            htScore: htScore ?? this.htScore,
            ftScore: ftScore ?? this.ftScore,
            etScore: etScore ?? this.etScore,
            time: time ?? this.time,
            leagueId: leagueId ?? this.leagueId,
            status: status ?? this.status,
            added: added ?? this.added,
            lastChanged: lastChanged ?? this.lastChanged,
            homeId: homeId ?? this.homeId,
            awayId: awayId ?? this.awayId,
            competitionId: competitionId ?? this.competitionId,
            location: location ?? this.location,
            fixtureId: fixtureId ?? this.fixtureId,
            scheduled: scheduled ?? this.scheduled,
            home: home ?? this.home,
            away: away ?? this.away,
            competition: competition ?? this.competition,
        );

    factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        homeName: json["home_name"],
        awayName: json["away_name"],
        score: json["score"],
        htScore: json["ht_score"],
        ftScore: json["ft_score"],
        etScore: json["et_score"],
        time: json["time"],
        leagueId: json["league_id"],
        status: json["status"],
        added: DateTime.parse(json["added"]),
        lastChanged: DateTime.parse(json["last_changed"]),
        homeId: json["home_id"],
        awayId: json["away_id"],
        competitionId: json["competition_id"],
        location: json["location"],
        fixtureId: json["fixture_id"],
        scheduled: json["scheduled"],
        home: Away.fromJson(json["home"]),
        away: Away.fromJson(json["away"]),
        competition: Competition.fromJson(json["competition"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "home_name": homeName,
        "away_name": awayName,
        "score": score,
        "ht_score": htScore,
        "ft_score": ftScore,
        "et_score": etScore,
        "time": time,
        "league_id": leagueId,
        "status": status,
        "added": added.toIso8601String(),
        "last_changed": lastChanged.toIso8601String(),
        "home_id": homeId,
        "away_id": awayId,
        "competition_id": competitionId,
        "location": location,
        "fixture_id": fixtureId,
        "scheduled": scheduled,
        "home": home.toJson(),
        "away": away.toJson(),
        "competition": competition.toJson(),
    };
}

class Away {
    Away({
        this.id,
        this.name,
        this.stadium,
        this.location,
    });

    final String id;
    final String name;
    final String stadium;
    final String location;

    Away copyWith({
        String id,
        String name,
        String stadium,
        String location,
    }) => 
        Away(
            id: id ?? this.id,
            name: name ?? this.name,
            stadium: stadium ?? this.stadium,
            location: location ?? this.location,
        );

    factory Away.fromJson(Map<String, dynamic> json) => Away(
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
