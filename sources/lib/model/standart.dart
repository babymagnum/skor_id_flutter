class Standart {
    String? message;
    bool? status;

    Standart({this.message, this.status});

    factory Standart.fromJson(Map<String, dynamic> json) {
        return Standart(
            message: json['message'], 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['status'] = this.status;
        return data;
    }
}