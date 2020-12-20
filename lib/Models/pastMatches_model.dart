// To parse this JSON data, do
//
//     final pastMatchesModel = pastMatchesModelFromJson(jsonString);

import 'dart:convert';

PastMatchesModel pastMatchesModelFromJson(String str) => PastMatchesModel.fromJson(json.decode(str));

String pastMatchesModelToJson(PastMatchesModel data) => json.encode(data.toJson());

class PastMatchesModel {
    PastMatchesModel({
        this.success,
        this.data,
    });

    final bool success;
    final Data data;

    PastMatchesModel copyWith({
        bool success,
        Data data,
    }) => 
        PastMatchesModel(
            success: success ?? this.success,
            data: data ?? this.data,
        );

    factory PastMatchesModel.fromJson(Map<String, dynamic> json) => PastMatchesModel(
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
        this.prevPage,
        this.nextPage,
        this.totalPages,
    });

    final List<Match> match;
    final bool prevPage;
    final String nextPage;
    final int totalPages;

    Data copyWith({
        List<Match> match,
        bool prevPage,
        String nextPage,
        int totalPages,
    }) => 
        Data(
            match: match ?? this.match,
            prevPage: prevPage ?? this.prevPage,
            nextPage: nextPage ?? this.nextPage,
            totalPages: totalPages ?? this.totalPages,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        match: List<Match>.from(json["match"].map((x) => Match.fromJson(x))),
        prevPage: json["prev_page"],
        nextPage: json["next_page"],
        totalPages: json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "match": List<dynamic>.from(match.map((x) => x.toJson())),
        "prev_page": prevPage,
        "next_page": nextPage,
        "total_pages": totalPages,
    };
}

class Match {
    Match({
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

    final DateTime added;
    final String etScore;
    final dynamic scheduled;
    final int awayId;
    final String htScore;
    final Status status;
    final String homeName;
    final DateTime date;
    final int leagueId;
    final String competitionName;
    final dynamic location;
    final String awayName;
    final DateTime lastChanged;
    final int fixtureId;
    final int competitionId;
    final String events;
    final String h2H;
    final int homeId;
    final String score;
    final String ftScore;
    final Time time;
    final int id;
    final Outcomes outcomes;

    Match copyWith({
        DateTime added,
        String etScore,
        dynamic scheduled,
        int awayId,
        String htScore,
        Status status,
        String homeName,
        DateTime date,
        int leagueId,
        String competitionName,
        dynamic location,
        String awayName,
        DateTime lastChanged,
        int fixtureId,
        int competitionId,
        String events,
        String h2H,
        int homeId,
        String score,
        String ftScore,
        Time time,
        int id,
        Outcomes outcomes,
    }) => 
        Match(
            added: added ?? this.added,
            etScore: etScore ?? this.etScore,
            scheduled: scheduled ?? this.scheduled,
            awayId: awayId ?? this.awayId,
            htScore: htScore ?? this.htScore,
            status: status ?? this.status,
            homeName: homeName ?? this.homeName,
            date: date ?? this.date,
            leagueId: leagueId ?? this.leagueId,
            competitionName: competitionName ?? this.competitionName,
            location: location ?? this.location,
            awayName: awayName ?? this.awayName,
            lastChanged: lastChanged ?? this.lastChanged,
            fixtureId: fixtureId ?? this.fixtureId,
            competitionId: competitionId ?? this.competitionId,
            events: events ?? this.events,
            h2H: h2H ?? this.h2H,
            homeId: homeId ?? this.homeId,
            score: score ?? this.score,
            ftScore: ftScore ?? this.ftScore,
            time: time ?? this.time,
            id: id ?? this.id,
            outcomes: outcomes ?? this.outcomes,
        );

    factory Match.fromJson(Map<String, dynamic> json) => Match(
        added: DateTime.parse(json["added"]),
        etScore: json["et_score"],
        scheduled: json["scheduled"],
        awayId: json["away_id"],
        htScore: json["ht_score"],
        status: statusValues.map[json["status"]],
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
        time: timeValues.map[json["time"]],
        id: json["id"],
        outcomes: Outcomes.fromJson(json["outcomes"]),
    );

    Map<String, dynamic> toJson() => {
        "added": added.toIso8601String(),
        "et_score": etScore,
        "scheduled": scheduled,
        "away_id": awayId,
        "ht_score": htScore,
        "status": statusValues.reverse[status],
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
        "time": timeValues.reverse[time],
        "id": id,
        "outcomes": outcomes.toJson(),
    };
}

class Outcomes {
    Outcomes({
        this.halfTime,
        this.extraTime,
        this.fullTime,
    });

    final String halfTime;
    final String extraTime;
    final dynamic fullTime;

    Outcomes copyWith({
        String halfTime,
        String extraTime,
        dynamic fullTime,
    }) => 
        Outcomes(
            halfTime: halfTime ?? this.halfTime,
            extraTime: extraTime ?? this.extraTime,
            fullTime: fullTime ?? this.fullTime,
        );

    factory Outcomes.fromJson(Map<String, dynamic> json) => Outcomes(
        halfTime: json["half_time"],
        extraTime: json["extra_time"],
        fullTime: json["full_time"],
    );

    Map<String, dynamic> toJson() => {
        "half_time": halfTime,
        "extra_time": extraTime,
        "full_time": fullTime,
    };
}

enum Status { FINISHED }

final statusValues = EnumValues({
    "FINISHED": Status.FINISHED
});

enum Time { FT }

final timeValues = EnumValues({
    "FT": Time.FT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
