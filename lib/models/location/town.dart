class Towns {
    String status;
    String message;
    Data data;

    Towns({
        required this.status,
        required this.message,
        required this.data,
    });

}

class Data {
    List<Town> towns;

    Data({
        required this.towns,
    });

}

class Town {
    String name;

    Town({
        required this.name,
    });

}
