// To parse this JSON data, do
//
//     final predictionModel = predictionModelFromJson(jsonString);

import 'dart:convert';

PredictionModel predictionModelFromJson(String str) => PredictionModel.fromJson(json.decode(str));

String predictionModelToJson(PredictionModel data) => json.encode(data.toJson());

class PredictionModel {
    PredictionModel({
        this.predictionModelGet,
        this.parameters,
        this.errors,
        this.results,
        this.paging,
        this.response,
    });

    final String predictionModelGet;
    final Parameters parameters;
    final List<dynamic> errors;
    final int results;
    final Paging paging;
    final List<Response> response;

    PredictionModel copyWith({
        String predictionModelGet,
        Parameters parameters,
        List<dynamic> errors,
        int results,
        Paging paging,
        List<Response> response,
    }) => 
        PredictionModel(
            predictionModelGet: predictionModelGet ?? this.predictionModelGet,
            parameters: parameters ?? this.parameters,
            errors: errors ?? this.errors,
            results: results ?? this.results,
            paging: paging ?? this.paging,
            response: response ?? this.response,
        );

    factory PredictionModel.fromJson(Map<String, dynamic> json) => PredictionModel(
        predictionModelGet: json["get"],
        parameters: Parameters.fromJson(json["parameters"]),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        paging: Paging.fromJson(json["paging"]),
        response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": predictionModelGet,
        "parameters": parameters.toJson(),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "paging": paging.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Paging {
    Paging({
        this.current,
        this.total,
    });

    final int current;
    final int total;

    Paging copyWith({
        int current,
        int total,
    }) => 
        Paging(
            current: current ?? this.current,
            total: total ?? this.total,
        );

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current": current,
        "total": total,
    };
}

class Parameters {
    Parameters({
        this.fixture,
    });

    final String fixture;

    Parameters copyWith({
        String fixture,
    }) => 
        Parameters(
            fixture: fixture ?? this.fixture,
        );

    factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        fixture: json["fixture"],
    );

    Map<String, dynamic> toJson() => {
        "fixture": fixture,
    };
}

class Response {
    Response({
        this.predictions,
        this.league,
        this.teams,
        this.comparison,
        this.h2H,
    });

    final Predictions predictions;
    final H2HLeague league;
    final Teams teams;
    final Comparison comparison;
    final List<H2H> h2H;

    Response copyWith({
        Predictions predictions,
        H2HLeague league,
        Teams teams,
        Comparison comparison,
        List<H2H> h2H,
    }) => 
        Response(
            predictions: predictions ?? this.predictions,
            league: league ?? this.league,
            teams: teams ?? this.teams,
            comparison: comparison ?? this.comparison,
            h2H: h2H ?? this.h2H,
        );

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        predictions: Predictions.fromJson(json["predictions"]),
        league: H2HLeague.fromJson(json["league"]),
        teams: Teams.fromJson(json["teams"]),
        comparison: Comparison.fromJson(json["comparison"]),
        h2H: List<H2H>.from(json["h2h"].map((x) => H2H.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "predictions": predictions.toJson(),
        "league": league.toJson(),
        "teams": teams.toJson(),
        "comparison": comparison.toJson(),
        "h2h": List<dynamic>.from(h2H.map((x) => x.toJson())),
    };
}

class Comparison {
    Comparison({
        this.form,
        this.att,
        this.def,
        this.poissonDistribution,
        this.h2H,
        this.goals,
        this.total,
    });

    final Teams form;
    final Teams att;
    final Teams def;
    final Teams poissonDistribution;
    final Teams h2H;
    final Teams goals;
    final Teams total;

    Comparison copyWith({
        Teams form,
        Teams att,
        Teams def,
        Teams poissonDistribution,
        Teams h2H,
        Teams goals,
        Teams total,
    }) => 
        Comparison(
            form: form ?? this.form,
            att: att ?? this.att,
            def: def ?? this.def,
            poissonDistribution: poissonDistribution ?? this.poissonDistribution,
            h2H: h2H ?? this.h2H,
            goals: goals ?? this.goals,
            total: total ?? this.total,
        );

    factory Comparison.fromJson(Map<String, dynamic> json) => Comparison(
        form: Teams.fromJson(json["form"]),
        att: Teams.fromJson(json["att"]),
        def: Teams.fromJson(json["def"]),
        poissonDistribution: Teams.fromJson(json["poisson_distribution"]),
        h2H: Teams.fromJson(json["h2h"]),
        goals: Teams.fromJson(json["goals"]),
        total: Teams.fromJson(json["total"]),
    );

    Map<String, dynamic> toJson() => {
        "form": form.toJson(),
        "att": att.toJson(),
        "def": def.toJson(),
        "poisson_distribution": poissonDistribution.toJson(),
        "h2h": h2H.toJson(),
        "goals": goals.toJson(),
        "total": total.toJson(),
    };
}

class Biggest {
    Biggest({
        this.streak,
        this.wins,
        this.loses,
        this.goals,
    });

    final Streak streak;
    final Teams wins;
    final Teams loses;
    final BiggestGoals goals;

    Biggest copyWith({
        Streak streak,
        Teams wins,
        Teams loses,
        BiggestGoals goals,
    }) => 
        Biggest(
            streak: streak ?? this.streak,
            wins: wins ?? this.wins,
            loses: loses ?? this.loses,
            goals: goals ?? this.goals,
        );

    factory Biggest.fromJson(Map<String, dynamic> json) => Biggest(
        streak: Streak.fromJson(json["streak"]),
        wins: Teams.fromJson(json["wins"]),
        loses: Teams.fromJson(json["loses"]),
        goals: BiggestGoals.fromJson(json["goals"]),
    );

    Map<String, dynamic> toJson() => {
        "streak": streak.toJson(),
        "wins": wins.toJson(),
        "loses": loses.toJson(),
        "goals": goals.toJson(),
    };
}

class AwayLeague {
    AwayLeague({
        this.form,
        this.fixtures,
        this.goals,
        this.biggest,
        this.cleanSheet,
        this.failedToScore,
    });

    final String form;
    final Fixtures fixtures;
    final LeagueGoals goals;
    final Biggest biggest;
    final CleanSheet cleanSheet;
    final CleanSheet failedToScore;

    AwayLeague copyWith({
        String form,
        Fixtures fixtures,
        LeagueGoals goals,
        Biggest biggest,
        CleanSheet cleanSheet,
        CleanSheet failedToScore,
    }) => 
        AwayLeague(
            form: form ?? this.form,
            fixtures: fixtures ?? this.fixtures,
            goals: goals ?? this.goals,
            biggest: biggest ?? this.biggest,
            cleanSheet: cleanSheet ?? this.cleanSheet,
            failedToScore: failedToScore ?? this.failedToScore,
        );

    factory AwayLeague.fromJson(Map<String, dynamic> json) => AwayLeague(
        form: json["form"],
        fixtures: Fixtures.fromJson(json["fixtures"]),
        goals: LeagueGoals.fromJson(json["goals"]),
        biggest: Biggest.fromJson(json["biggest"]),
        cleanSheet: CleanSheet.fromJson(json["clean_sheet"]),
        failedToScore: CleanSheet.fromJson(json["failed_to_score"]),
    );

    Map<String, dynamic> toJson() => {
        "form": form,
        "fixtures": fixtures.toJson(),
        "goals": goals.toJson(),
        "biggest": biggest.toJson(),
        "clean_sheet": cleanSheet.toJson(),
        "failed_to_score": failedToScore.toJson(),
    };
}

class AwayClass {
    AwayClass({
        this.id,
        this.name,
        this.logo,
        this.winner,
        this.last5,
        this.league,
    });

    final int id;
    final Name name;
    final String logo;
    final bool winner;
    final Last5 last5;
    final AwayLeague league;

    AwayClass copyWith({
        int id,
        Name name,
        String logo,
        bool winner,
        Last5 last5,
        AwayLeague league,
    }) => 
        AwayClass(
            id: id ?? this.id,
            name: name ?? this.name,
            logo: logo ?? this.logo,
            winner: winner ?? this.winner,
            last5: last5 ?? this.last5,
            league: league ?? this.league,
        );

    factory AwayClass.fromJson(Map<String, dynamic> json) => AwayClass(
        id: json["id"],
        name: nameValues.map[json["name"]],
        logo: json["logo"],
        winner: json["winner"] == null ? null : json["winner"],
        last5: json["last_5"] == null ? null : Last5.fromJson(json["last_5"]),
        league: json["league"] == null ? null : AwayLeague.fromJson(json["league"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "logo": logo,
        "winner": winner == null ? null : winner,
        "last_5": last5 == null ? null : last5.toJson(),
        "league": league == null ? null : league.toJson(),
    };
}

class Teams {
    Teams({
        this.home,
        this.away,
    });

    final dynamic home;
    final dynamic away;

    Teams copyWith({
        dynamic home,
        dynamic away,
    }) => 
        Teams(
            home: home ?? this.home,
            away: away ?? this.away,
        );

    factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}

class BiggestGoals {
    BiggestGoals({
        this.goalsFor,
        this.against,
    });

    final FulltimeClass goalsFor;
    final FulltimeClass against;

    BiggestGoals copyWith({
        FulltimeClass goalsFor,
        FulltimeClass against,
    }) => 
        BiggestGoals(
            goalsFor: goalsFor ?? this.goalsFor,
            against: against ?? this.against,
        );

    factory BiggestGoals.fromJson(Map<String, dynamic> json) => BiggestGoals(
        goalsFor: FulltimeClass.fromJson(json["for"]),
        against: FulltimeClass.fromJson(json["against"]),
    );

    Map<String, dynamic> toJson() => {
        "for": goalsFor.toJson(),
        "against": against.toJson(),
    };
}

class FulltimeClass {
    FulltimeClass({
        this.home,
        this.away,
    });

    final int home;
    final int away;

    FulltimeClass copyWith({
        int home,
        int away,
    }) => 
        FulltimeClass(
            home: home ?? this.home,
            away: away ?? this.away,
        );

    factory FulltimeClass.fromJson(Map<String, dynamic> json) => FulltimeClass(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}

class Streak {
    Streak({
        this.wins,
        this.draws,
        this.loses,
    });

    final int wins;
    final int draws;
    final int loses;

    Streak copyWith({
        int wins,
        int draws,
        int loses,
    }) => 
        Streak(
            wins: wins ?? this.wins,
            draws: draws ?? this.draws,
            loses: loses ?? this.loses,
        );

    factory Streak.fromJson(Map<String, dynamic> json) => Streak(
        wins: json["wins"],
        draws: json["draws"],
        loses: json["loses"],
    );

    Map<String, dynamic> toJson() => {
        "wins": wins,
        "draws": draws,
        "loses": loses,
    };
}

class CleanSheet {
    CleanSheet({
        this.home,
        this.away,
        this.total,
    });

    final int home;
    final int away;
    final int total;

    CleanSheet copyWith({
        int home,
        int away,
        int total,
    }) => 
        CleanSheet(
            home: home ?? this.home,
            away: away ?? this.away,
            total: total ?? this.total,
        );

    factory CleanSheet.fromJson(Map<String, dynamic> json) => CleanSheet(
        home: json["home"],
        away: json["away"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "total": total,
    };
}

class Fixtures {
    Fixtures({
        this.played,
        this.wins,
        this.draws,
        this.loses,
    });

    final CleanSheet played;
    final CleanSheet wins;
    final CleanSheet draws;
    final CleanSheet loses;

    Fixtures copyWith({
        CleanSheet played,
        CleanSheet wins,
        CleanSheet draws,
        CleanSheet loses,
    }) => 
        Fixtures(
            played: played ?? this.played,
            wins: wins ?? this.wins,
            draws: draws ?? this.draws,
            loses: loses ?? this.loses,
        );

    factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        played: CleanSheet.fromJson(json["played"]),
        wins: CleanSheet.fromJson(json["wins"]),
        draws: CleanSheet.fromJson(json["draws"]),
        loses: CleanSheet.fromJson(json["loses"]),
    );

    Map<String, dynamic> toJson() => {
        "played": played.toJson(),
        "wins": wins.toJson(),
        "draws": draws.toJson(),
        "loses": loses.toJson(),
    };
}

class LeagueGoals {
    LeagueGoals({
        this.goalsFor,
        this.against,
    });

    final FluffyAgainst goalsFor;
    final FluffyAgainst against;

    LeagueGoals copyWith({
        FluffyAgainst goalsFor,
        FluffyAgainst against,
    }) => 
        LeagueGoals(
            goalsFor: goalsFor ?? this.goalsFor,
            against: against ?? this.against,
        );

    factory LeagueGoals.fromJson(Map<String, dynamic> json) => LeagueGoals(
        goalsFor: FluffyAgainst.fromJson(json["for"]),
        against: FluffyAgainst.fromJson(json["against"]),
    );

    Map<String, dynamic> toJson() => {
        "for": goalsFor.toJson(),
        "against": against.toJson(),
    };
}

class FluffyAgainst {
    FluffyAgainst({
        this.total,
        this.average,
    });

    final CleanSheet total;
    final Average average;

    FluffyAgainst copyWith({
        CleanSheet total,
        Average average,
    }) => 
        FluffyAgainst(
            total: total ?? this.total,
            average: average ?? this.average,
        );

    factory FluffyAgainst.fromJson(Map<String, dynamic> json) => FluffyAgainst(
        total: CleanSheet.fromJson(json["total"]),
        average: Average.fromJson(json["average"]),
    );

    Map<String, dynamic> toJson() => {
        "total": total.toJson(),
        "average": average.toJson(),
    };
}

class Average {
    Average({
        this.home,
        this.away,
        this.total,
    });

    final String home;
    final String away;
    final String total;

    Average copyWith({
        String home,
        String away,
        String total,
    }) => 
        Average(
            home: home ?? this.home,
            away: away ?? this.away,
            total: total ?? this.total,
        );

    factory Average.fromJson(Map<String, dynamic> json) => Average(
        home: json["home"],
        away: json["away"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
        "total": total,
    };
}

class Last5 {
    Last5({
        this.form,
        this.att,
        this.def,
        this.goals,
    });

    final String form;
    final String att;
    final String def;
    final Last5Goals goals;

    Last5 copyWith({
        String form,
        String att,
        String def,
        Last5Goals goals,
    }) => 
        Last5(
            form: form ?? this.form,
            att: att ?? this.att,
            def: def ?? this.def,
            goals: goals ?? this.goals,
        );

    factory Last5.fromJson(Map<String, dynamic> json) => Last5(
        form: json["form"],
        att: json["att"],
        def: json["def"],
        goals: Last5Goals.fromJson(json["goals"]),
    );

    Map<String, dynamic> toJson() => {
        "form": form,
        "att": att,
        "def": def,
        "goals": goals.toJson(),
    };
}

class Last5Goals {
    Last5Goals({
        this.goalsFor,
        this.against,
    });

    final PurpleAgainst goalsFor;
    final PurpleAgainst against;

    Last5Goals copyWith({
        PurpleAgainst goalsFor,
        PurpleAgainst against,
    }) => 
        Last5Goals(
            goalsFor: goalsFor ?? this.goalsFor,
            against: against ?? this.against,
        );

    factory Last5Goals.fromJson(Map<String, dynamic> json) => Last5Goals(
        goalsFor: PurpleAgainst.fromJson(json["for"]),
        against: PurpleAgainst.fromJson(json["against"]),
    );

    Map<String, dynamic> toJson() => {
        "for": goalsFor.toJson(),
        "against": against.toJson(),
    };
}

class PurpleAgainst {
    PurpleAgainst({
        this.total,
        this.average,
    });

    final int total;
    final double average;

    PurpleAgainst copyWith({
        int total,
        double average,
    }) => 
        PurpleAgainst(
            total: total ?? this.total,
            average: average ?? this.average,
        );

    factory PurpleAgainst.fromJson(Map<String, dynamic> json) => PurpleAgainst(
        total: json["total"],
        average: json["average"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "average": average,
    };
}

enum Name { DEPORTIVO_SANTANI, DEPORTIVO_CAPIATA }

final nameValues = EnumValues({
    "Deportivo Capiata": Name.DEPORTIVO_CAPIATA,
    "Deportivo Santani": Name.DEPORTIVO_SANTANI
});

class H2H {
    H2H({
        this.fixture,
        this.league,
        this.teams,
        this.goals,
        this.score,
    });

    final Fixture fixture;
    final H2HLeague league;
    final Teams teams;
    final FulltimeClass goals;
    final Score score;

    H2H copyWith({
        Fixture fixture,
        H2HLeague league,
        Teams teams,
        FulltimeClass goals,
        Score score,
    }) => 
        H2H(
            fixture: fixture ?? this.fixture,
            league: league ?? this.league,
            teams: teams ?? this.teams,
            goals: goals ?? this.goals,
            score: score ?? this.score,
        );

    factory H2H.fromJson(Map<String, dynamic> json) => H2H(
        fixture: Fixture.fromJson(json["fixture"]),
        league: H2HLeague.fromJson(json["league"]),
        teams: Teams.fromJson(json["teams"]),
        goals: FulltimeClass.fromJson(json["goals"]),
        score: Score.fromJson(json["score"]),
    );

    Map<String, dynamic> toJson() => {
        "fixture": fixture.toJson(),
        "league": league.toJson(),
        "teams": teams.toJson(),
        "goals": goals.toJson(),
        "score": score.toJson(),
    };
}

class Fixture {
    Fixture({
        this.id,
        this.referee,
        this.timezone,
        this.date,
        this.timestamp,
        this.periods,
        this.venue,
        this.status,
    });

    final int id;
    final String referee;
    final String timezone;
    final DateTime date;
    final int timestamp;
    final Periods periods;
    final Venue venue;
    final Status status;

    Fixture copyWith({
        int id,
        String referee,
        String timezone,
        DateTime date,
        int timestamp,
        Periods periods,
        Venue venue,
        Status status,
    }) => 
        Fixture(
            id: id ?? this.id,
            referee: referee ?? this.referee,
            timezone: timezone ?? this.timezone,
            date: date ?? this.date,
            timestamp: timestamp ?? this.timestamp,
            periods: periods ?? this.periods,
            venue: venue ?? this.venue,
            status: status ?? this.status,
        );

    factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
        id: json["id"],
        referee: json["referee"] == null ? null : json["referee"],
        timezone: json["timezone"],
        date: DateTime.parse(json["date"]),
        timestamp: json["timestamp"],
        periods: Periods.fromJson(json["periods"]),
        venue: Venue.fromJson(json["venue"]),
        status: Status.fromJson(json["status"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "referee": referee == null ? null : referee,
        "timezone": timezone,
        "date": date.toIso8601String(),
        "timestamp": timestamp,
        "periods": periods.toJson(),
        "venue": venue.toJson(),
        "status": status.toJson(),
    };
}

class Periods {
    Periods({
        this.first,
        this.second,
    });

    final int first;
    final int second;

    Periods copyWith({
        int first,
        int second,
    }) => 
        Periods(
            first: first ?? this.first,
            second: second ?? this.second,
        );

    factory Periods.fromJson(Map<String, dynamic> json) => Periods(
        first: json["first"],
        second: json["second"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
    };
}

class Status {
    Status({
        this.long,
        this.short,
        this.elapsed,
    });

    final String long;
    final String short;
    final int elapsed;

    Status copyWith({
        String long,
        String short,
        int elapsed,
    }) => 
        Status(
            long: long ?? this.long,
            short: short ?? this.short,
            elapsed: elapsed ?? this.elapsed,
        );

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        long: json["long"],
        short: json["short"],
        elapsed: json["elapsed"],
    );

    Map<String, dynamic> toJson() => {
        "long": long,
        "short": short,
        "elapsed": elapsed,
    };
}

class Venue {
    Venue({
        this.id,
        this.name,
        this.city,
    });

    final dynamic id;
    final String name;
    final dynamic city;

    Venue copyWith({
        dynamic id,
        String name,
        dynamic city,
    }) => 
        Venue(
            id: id ?? this.id,
            name: name ?? this.name,
            city: city ?? this.city,
        );

    factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        name: json["name"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city,
    };
}

class H2HLeague {
    H2HLeague({
        this.id,
        this.name,
        this.country,
        this.logo,
        this.flag,
        this.season,
        this.round,
    });

    final int id;
    final String name;
    final String country;
    final String logo;
    final String flag;
    final int season;
    final String round;

    H2HLeague copyWith({
        int id,
        String name,
        String country,
        String logo,
        String flag,
        int season,
        String round,
    }) => 
        H2HLeague(
            id: id ?? this.id,
            name: name ?? this.name,
            country: country ?? this.country,
            logo: logo ?? this.logo,
            flag: flag ?? this.flag,
            season: season ?? this.season,
            round: round ?? this.round,
        );

    factory H2HLeague.fromJson(Map<String, dynamic> json) => H2HLeague(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        round: json["round"] == null ? null : json["round"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "round": round == null ? null : round,
    };
}

class Score {
    Score({
        this.halftime,
        this.fulltime,
        this.extratime,
        this.penalty,
    });

    final FulltimeClass halftime;
    final FulltimeClass fulltime;
    final Teams extratime;
    final Teams penalty;

    Score copyWith({
        FulltimeClass halftime,
        FulltimeClass fulltime,
        Teams extratime,
        Teams penalty,
    }) => 
        Score(
            halftime: halftime ?? this.halftime,
            fulltime: fulltime ?? this.fulltime,
            extratime: extratime ?? this.extratime,
            penalty: penalty ?? this.penalty,
        );

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        halftime: FulltimeClass.fromJson(json["halftime"]),
        fulltime: FulltimeClass.fromJson(json["fulltime"]),
        extratime: Teams.fromJson(json["extratime"]),
        penalty: Teams.fromJson(json["penalty"]),
    );

    Map<String, dynamic> toJson() => {
        "halftime": halftime.toJson(),
        "fulltime": fulltime.toJson(),
        "extratime": extratime.toJson(),
        "penalty": penalty.toJson(),
    };
}

class Predictions {
    Predictions({
        this.winner,
        this.winOrDraw,
        this.underOver,
        this.goals,
        this.advice,
        this.percent,
    });

    final Winner winner;
    final bool winOrDraw;
    final String underOver;
    final Teams goals;
    final String advice;
    final Percent percent;

    Predictions copyWith({
        Winner winner,
        bool winOrDraw,
        String underOver,
        Teams goals,
        String advice,
        Percent percent,
    }) => 
        Predictions(
            winner: winner ?? this.winner,
            winOrDraw: winOrDraw ?? this.winOrDraw,
            underOver: underOver ?? this.underOver,
            goals: goals ?? this.goals,
            advice: advice ?? this.advice,
            percent: percent ?? this.percent,
        );

    factory Predictions.fromJson(Map<String, dynamic> json) => Predictions(
        winner: Winner.fromJson(json["winner"]),
        winOrDraw: json["win_or_draw"],
        underOver: json["under_over"],
        goals: Teams.fromJson(json["goals"]),
        advice: json["advice"],
        percent: Percent.fromJson(json["percent"]),
    );

    Map<String, dynamic> toJson() => {
        "winner": winner.toJson(),
        "win_or_draw": winOrDraw,
        "under_over": underOver,
        "goals": goals.toJson(),
        "advice": advice,
        "percent": percent.toJson(),
    };
}

class Percent {
    Percent({
        this.home,
        this.draw,
        this.away,
    });

    final String home;
    final String draw;
    final String away;

    Percent copyWith({
        String home,
        String draw,
        String away,
    }) => 
        Percent(
            home: home ?? this.home,
            draw: draw ?? this.draw,
            away: away ?? this.away,
        );

    factory Percent.fromJson(Map<String, dynamic> json) => Percent(
        home: json["home"],
        draw: json["draw"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "draw": draw,
        "away": away,
    };
}

class Winner {
    Winner({
        this.id,
        this.name,
        this.comment,
    });

    final int id;
    final Name name;
    final String comment;

    Winner copyWith({
        int id,
        Name name,
        String comment,
    }) => 
        Winner(
            id: id ?? this.id,
            name: name ?? this.name,
            comment: comment ?? this.comment,
        );

    factory Winner.fromJson(Map<String, dynamic> json) => Winner(
        id: json["id"],
        name: nameValues.map[json["name"]],
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "comment": comment,
    };
}

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












































































































































































































// // To parse this JSON data, do
// //
// //     final predictionModel = predictionModelFromJson(jsonString);

// import 'dart:convert';

// PredictionModel predictionModelFromJson(String str) => PredictionModel.fromJson(json.decode(str));

// String predictionModelToJson(PredictionModel data) => json.encode(data.toJson());

// class PredictionModel {
//     PredictionModel({
//         this.data,
//         this.meta,
//     });

//     final List<Datum> data;
//     final Meta meta;

//     PredictionModel copyWith({
//         List<Datum> data,
//         Meta meta,
//     }) => 
//         PredictionModel(
//             data: data ?? this.data,
//             meta: meta ?? this.meta,
//         );

//     factory PredictionModel.fromJson(Map<String, dynamic> json) => PredictionModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: Meta.fromJson(json["meta"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "meta": meta.toJson(),
//     };
// }

// class Datum {
//     Datum({
//         this.fixtureId,
//         this.predictions,
//     });

//     final int fixtureId;
//     final Predictions predictions;

//     Datum copyWith({
//         int fixtureId,
//         Predictions predictions,
//     }) => 
//         Datum(
//             fixtureId: fixtureId ?? this.fixtureId,
//             predictions: predictions ?? this.predictions,
//         );

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         fixtureId: json["fixture_id"],
//         predictions: Predictions.fromJson(json["predictions"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "fixture_id": fixtureId,
//         "predictions": predictions.toJson(),
//     };
// }

// class Predictions {
//     Predictions({
//         this.btts,
//         this.over25,
//         this.under25,
//         this.over35,
//         this.under35,
//         this.htOver05,
//         this.htUnder05,
//         this.htOver15,
//         this.htUnder15,
//         this.atOver05,
//         this.atUnder05,
//         this.atOver15,
//         this.atUnder15,
//         this.home,
//         this.away,
//         this.draw,
//         this.correctScore,
//     });

//     final double btts;
//     final double over25;
//     final double under25;
//     final double over35;
//     final double under35;
//     final double htOver05;
//     final double htUnder05;
//     final double htOver15;
//     final double htUnder15;
//     final double atOver05;
//     final double atUnder05;
//     final double atOver15;
//     final double atUnder15;
//     final double home;
//     final double away;
//     final double draw;
//     final Map<String, double> correctScore;

//     Predictions copyWith({
//         double btts,
//         double over25,
//         double under25,
//         double over35,
//         double under35,
//         double htOver05,
//         double htUnder05,
//         double htOver15,
//         double htUnder15,
//         double atOver05,
//         double atUnder05,
//         double atOver15,
//         double atUnder15,
//         double home,
//         double away,
//         double draw,
//         Map<String, double> correctScore,
//     }) => 
//         Predictions(
//             btts: btts ?? this.btts,
//             over25: over25 ?? this.over25,
//             under25: under25 ?? this.under25,
//             over35: over35 ?? this.over35,
//             under35: under35 ?? this.under35,
//             htOver05: htOver05 ?? this.htOver05,
//             htUnder05: htUnder05 ?? this.htUnder05,
//             htOver15: htOver15 ?? this.htOver15,
//             htUnder15: htUnder15 ?? this.htUnder15,
//             atOver05: atOver05 ?? this.atOver05,
//             atUnder05: atUnder05 ?? this.atUnder05,
//             atOver15: atOver15 ?? this.atOver15,
//             atUnder15: atUnder15 ?? this.atUnder15,
//             home: home ?? this.home,
//             away: away ?? this.away,
//             draw: draw ?? this.draw,
//             correctScore: correctScore ?? this.correctScore,
//         );

//     factory Predictions.fromJson(Map<String, dynamic> json) => Predictions(
//         btts: json["btts"].toDouble(),
//         over25: json["over_2_5"].toDouble(),
//         under25: json["under_2_5"].toDouble(),
//         over35: json["over_3_5"].toDouble(),
//         under35: json["under_3_5"].toDouble(),
//         htOver05: json["HT_over_0_5"].toDouble(),
//         htUnder05: json["HT_under_0_5"].toDouble(),
//         htOver15: json["HT_over_1_5"].toDouble(),
//         htUnder15: json["HT_under_1_5"].toDouble(),
//         atOver05: json["AT_over_0_5"].toDouble(),
//         atUnder05: json["AT_under_0_5"].toDouble(),
//         atOver15: json["AT_over_1_5"].toDouble(),
//         atUnder15: json["AT_under_1_5"].toDouble(),
//         home: json["home"].toDouble(),
//         away: json["away"].toDouble(),
//         draw: json["draw"].toDouble(),
//         correctScore: Map.from(json["correct_score"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
//     );

//     Map<String, dynamic> toJson() => {
//         "btts": btts,
//         "over_2_5": over25,
//         "under_2_5": under25,
//         "over_3_5": over35,
//         "under_3_5": under35,
//         "HT_over_0_5": htOver05,
//         "HT_under_0_5": htUnder05,
//         "HT_over_1_5": htOver15,
//         "HT_under_1_5": htUnder15,
//         "AT_over_0_5": atOver05,
//         "AT_under_0_5": atUnder05,
//         "AT_over_1_5": atOver15,
//         "AT_under_1_5": atUnder15,
//         "home": home,
//         "away": away,
//         "draw": draw,
//         "correct_score": Map.from(correctScore).map((k, v) => MapEntry<String, dynamic>(k, v)),
//     };
// }

// class Meta {
//     Meta({
//         this.subscription,
//         this.plan,
//         this.sports,
//     });

//     final Subscription subscription;
//     final Plan plan;
//     final List<Sport> sports;

//     Meta copyWith({
//         Subscription subscription,
//         Plan plan,
//         List<Sport> sports,
//     }) => 
//         Meta(
//             subscription: subscription ?? this.subscription,
//             plan: plan ?? this.plan,
//             sports: sports ?? this.sports,
//         );

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         subscription: Subscription.fromJson(json["subscription"]),
//         plan: Plan.fromJson(json["plan"]),
//         sports: List<Sport>.from(json["sports"].map((x) => Sport.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "subscription": subscription.toJson(),
//         "plan": plan.toJson(),
//         "sports": List<dynamic>.from(sports.map((x) => x.toJson())),
//     };
// }

// class Plan {
//     Plan({
//         this.name,
//         this.price,
//         this.requestLimit,
//     });

//     final String name;
//     final String price;
//     final String requestLimit;

//     Plan copyWith({
//         String name,
//         String price,
//         String requestLimit,
//     }) => 
//         Plan(
//             name: name ?? this.name,
//             price: price ?? this.price,
//             requestLimit: requestLimit ?? this.requestLimit,
//         );

//     factory Plan.fromJson(Map<String, dynamic> json) => Plan(
//         name: json["name"],
//         price: json["price"],
//         requestLimit: json["request_limit"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "price": price,
//         "request_limit": requestLimit,
//     };
// }

// class Sport {
//     Sport({
//         this.id,
//         this.name,
//         this.current,
//     });

//     final int id;
//     final String name;
//     final bool current;

//     Sport copyWith({
//         int id,
//         String name,
//         bool current,
//     }) => 
//         Sport(
//             id: id ?? this.id,
//             name: name ?? this.name,
//             current: current ?? this.current,
//         );

//     factory Sport.fromJson(Map<String, dynamic> json) => Sport(
//         id: json["id"],
//         name: json["name"],
//         current: json["current"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "current": current,
//     };
// }

// class Subscription {
//     Subscription({
//         this.startedAt,
//         this.trialEndsAt,
//         this.endsAt,
//     });

//     final StartedAt startedAt;
//     final dynamic trialEndsAt;
//     final dynamic endsAt;

//     Subscription copyWith({
//         StartedAt startedAt,
//         dynamic trialEndsAt,
//         dynamic endsAt,
//     }) => 
//         Subscription(
//             startedAt: startedAt ?? this.startedAt,
//             trialEndsAt: trialEndsAt ?? this.trialEndsAt,
//             endsAt: endsAt ?? this.endsAt,
//         );

//     factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
//         startedAt: StartedAt.fromJson(json["started_at"]),
//         trialEndsAt: json["trial_ends_at"],
//         endsAt: json["ends_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "started_at": startedAt.toJson(),
//         "trial_ends_at": trialEndsAt,
//         "ends_at": endsAt,
//     };
// }

// class StartedAt {
//     StartedAt({
//         this.date,
//         this.timezoneType,
//         this.timezone,
//     });

//     final DateTime date;
//     final int timezoneType;
//     final String timezone;

//     StartedAt copyWith({
//         DateTime date,
//         int timezoneType,
//         String timezone,
//     }) => 
//         StartedAt(
//             date: date ?? this.date,
//             timezoneType: timezoneType ?? this.timezoneType,
//             timezone: timezone ?? this.timezone,
//         );

//     factory StartedAt.fromJson(Map<String, dynamic> json) => StartedAt(
//         date: DateTime.parse(json["date"]),
//         timezoneType: json["timezone_type"],
//         timezone: json["timezone"],
//     );

//     Map<String, dynamic> toJson() => {
//         "date": date.toIso8601String(),
//         "timezone_type": timezoneType,
//         "timezone": timezone,
//     };
// }
