class Districts {
    String status;
    String message;
    Data data;

    Districts({
        required this.status,
        required this.message,
        required this.data,
    });

}

class Data {
    List<District> districts;

    Data({
        required this.districts,
    });

}

class District {
    String name;

    District({
        required this.name,
    });

}
