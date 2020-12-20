// To parse this JSON data, do
//
//     final statisticsModel = statisticsModelFromJson(jsonString);

import 'dart:convert';

StatisticsModel statisticsModelFromJson(String str) => StatisticsModel.fromJson(json.decode(str));

String statisticsModelToJson(StatisticsModel data) => json.encode(data.toJson());

class StatisticsModel {
    StatisticsModel({
        this.success,
        this.data,
    });

    final bool success;
    final Data data;

    StatisticsModel copyWith({
        bool success,
        Data data,
    }) => 
        StatisticsModel(
            success: success ?? this.success,
            data: data ?? this.data,
        );

    factory StatisticsModel.fromJson(Map<String, dynamic> json) => StatisticsModel(
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
        this.yellowCards,
        this.redCards,
        this.substitutions,
        this.possesion,
        this.freeKicks,
        this.goalKicks,
        this.throwIns,
        this.offsides,
        this.corners,
        this.shotsOnTarget,
        this.shotsOffTarget,
        this.attemptsOnGoal,
        this.saves,
        this.fauls,
        this.treatments,
        this.penalties,
        this.shotsBlocked,
        this.dangerousAttacks,
        this.attacks,
    });

    final String yellowCards;
    final String redCards;
    final String substitutions;
    final String possesion;
    final String freeKicks;
    final String goalKicks;
    final String throwIns;
    final String offsides;
    final String corners;
    final String shotsOnTarget;
    final String shotsOffTarget;
    final String attemptsOnGoal;
    final String saves;
    final String fauls;
    final String treatments;
    final String penalties;
    final String shotsBlocked;
    final String dangerousAttacks;
    final String attacks;

    Data copyWith({
        String yellowCards,
        String redCards,
        String substitutions,
        String possesion,
        String freeKicks,
        String goalKicks,
        String throwIns,
        String offsides,
        String corners,
        String shotsOnTarget,
        String shotsOffTarget,
        String attemptsOnGoal,
        String saves,
        String fauls,
        String treatments,
        String penalties,
        String shotsBlocked,
        String dangerousAttacks,
        String attacks,
    }) => 
        Data(
            yellowCards: yellowCards ?? this.yellowCards,
            redCards: redCards ?? this.redCards,
            substitutions: substitutions ?? this.substitutions,
            possesion: possesion ?? this.possesion,
            freeKicks: freeKicks ?? this.freeKicks,
            goalKicks: goalKicks ?? this.goalKicks,
            throwIns: throwIns ?? this.throwIns,
            offsides: offsides ?? this.offsides,
            corners: corners ?? this.corners,
            shotsOnTarget: shotsOnTarget ?? this.shotsOnTarget,
            shotsOffTarget: shotsOffTarget ?? this.shotsOffTarget,
            attemptsOnGoal: attemptsOnGoal ?? this.attemptsOnGoal,
            saves: saves ?? this.saves,
            fauls: fauls ?? this.fauls,
            treatments: treatments ?? this.treatments,
            penalties: penalties ?? this.penalties,
            shotsBlocked: shotsBlocked ?? this.shotsBlocked,
            dangerousAttacks: dangerousAttacks ?? this.dangerousAttacks,
            attacks: attacks ?? this.attacks,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        yellowCards: json["yellow_cards"],
        redCards: json["red_cards"],
        substitutions: json["substitutions"],
        possesion: json["possesion"],
        freeKicks: json["free_kicks"],
        goalKicks: json["goal_kicks"],
        throwIns: json["throw_ins"],
        offsides: json["offsides"],
        corners: json["corners"],
        shotsOnTarget: json["shots_on_target"],
        shotsOffTarget: json["shots_off_target"],
        attemptsOnGoal: json["attempts_on_goal"],
        saves: json["saves"],
        fauls: json["fauls"],
        treatments: json["treatments"],
        penalties: json["penalties"],
        shotsBlocked: json["shots_blocked"],
        dangerousAttacks: json["dangerous_attacks"],
        attacks: json["attacks"],
    );

    Map<String, dynamic> toJson() => {
        "yellow_cards": yellowCards,
        "red_cards": redCards,
        "substitutions": substitutions,
        "possesion": possesion,
        "free_kicks": freeKicks,
        "goal_kicks": goalKicks,
        "throw_ins": throwIns,
        "offsides": offsides,
        "corners": corners,
        "shots_on_target": shotsOnTarget,
        "shots_off_target": shotsOffTarget,
        "attempts_on_goal": attemptsOnGoal,
        "saves": saves,
        "fauls": fauls,
        "treatments": treatments,
        "penalties": penalties,
        "shots_blocked": shotsBlocked,
        "dangerous_attacks": dangerousAttacks,
        "attacks": attacks,
    };
}
