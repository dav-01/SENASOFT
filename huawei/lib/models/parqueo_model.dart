// To parse this JSON data, do
//
//     final parqueo = parqueoFromJson(jsonString);

import 'dart:convert';

List<Parqueo> parqueoFromJson(String str) => List<Parqueo>.from(json.decode(str).map((x) => Parqueo.fromJson(x)));

String parqueoToJson(List<Parqueo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Parqueo {
    Parqueo({
        this.placa = "",
        this.cedula = "",
    });

    String placa;
    String cedula;

    factory Parqueo.fromJson(Map<String, dynamic> json) => Parqueo(
        placa: json["placa"],
        cedula: json["cedula"],
    );

    Map<String, dynamic> toJson() => {
        "placa": placa,
        "cedula": cedula,
    };
}
