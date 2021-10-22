// To parse this JSON data, do
//
//     final parking = parkingFromJson(jsonString);

import 'dart:convert';

List<Parking> parkingsFromJson(String str) => List<Parking>.from(json.decode(str).map((x) => Parking.fromJson(x)));

Parking parkingFromJson(String str) => Parking.fromJson(json.decode(str));

String parkingToJson(List<Parking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Parking {
    Parking({
        this.placa = '',
        this.cedula = '',
    });

    String placa;
    String cedula;

    factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        placa: json["placa"],
        cedula: json["cedula"],
    );

    Map<String, dynamic> toJson() => {
        "placa": placa,
        "cedula": cedula,
    };
}

