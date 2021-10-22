// To parse this JSON data, do
//
//     final parking = parkingFromJson(jsonString);

import 'dart:convert';

List<Parking> parkingsFromJson(String str) => List<Parking>.from(json.decode(str).map((x) => Parking.fromJson(x)));

Parking parkingFromJson(String str) => Parking.fromJson(json.decode(str));

String parkingToJson(List<Parking> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Parking {
    Parking({
        this.nombre = '',
        this.placa = '',
        this.cedula = '',
        this.lugar = '',
    });

    String nombre;
    String placa;
    String cedula;
    String lugar;

    factory Parking.fromJson(Map<String, dynamic> json) => Parking(
        nombre: json["nombre"].toString(),
        placa: json["placa"],
        cedula: json["cedula"],
        lugar: json["zona_parqueo"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "placa": placa,
        "cedula": cedula,
        "zona_parqueo": lugar,
    };
}