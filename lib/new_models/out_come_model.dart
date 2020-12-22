class OutcomeModel {
    OutcomeModel({
        this.halfTime,
        this.fullTime,
        this.extraTime,
    });

    String halfTime;
    String fullTime;
    dynamic extraTime;

    factory OutcomeModel.fromJson(Map<String, dynamic> json) => OutcomeModel(
        halfTime: json["half_time"],
        fullTime: json["full_time"],
        extraTime: json["extra_time"],
    );

    Map<String, dynamic> toJson() => {
        "half_time": halfTime,
        "full_time": fullTime,
        "extra_time": extraTime,
    };
}