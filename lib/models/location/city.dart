class Cities {
    String status;
    String message;
    Data data;

    Cities({
        required this.status,
        required this.message,
        required this.data,
    });

}

class Data {
    List<City> cities;

    Data({
        required this.cities,
    });

}

class City {
    String name;

    City({
        required this.name,
    });

}
