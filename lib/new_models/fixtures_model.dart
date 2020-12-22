class FixturesModel {
    FixturesModel({
        this.id,
        this.date,
        this.time,
        this.round,
        this.homeName,
        this.awayName,
        this.location,
        this.leagueId,
        this.competitionId,
        this.homeId,
        this.awayId,
        this.competition,
    });

    String id;
    DateTime date;
    String time;
    String round;
    String homeName;
    String awayName;
    String location;
    String leagueId;
    String competitionId;
    String homeId;
    String awayId;
    Competition competition;

    factory FixturesModel.fromJson(Map<String, dynamic> json) => FixturesModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        round: json["round"],
        homeName: json["home_name"],
        awayName: json["away_name"],
        location: json["location"],
        leagueId: json["league_id"],
        competitionId: json["competition_id"],
        homeId: json["home_id"],
        awayId: json["away_id"],
        competition: Competition.fromJson(json["competition"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "round": round,
        "home_name": homeName,
        "away_name": awayName,
        "location": location,
        "league_id": leagueId,
        "competition_id": competitionId,
        "home_id": homeId,
        "away_id": awayId,
        "competition": competition.toJson(),
    };
}

class Competition {
    Competition({
        this.id,
        this.name,
    });

    String id;
    String name;

    factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}