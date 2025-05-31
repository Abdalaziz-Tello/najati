class Governorates {
    String status;
    String message;
    Data data;

    Governorates({
        required this.status,
        required this.message,
        required this.data,
    });

}

class Data {
    List<Governorate> governorates;

    Data({
        required this.governorates,
    });

}

class Governorate {
    String name;

    Governorate({
        required this.name,
    });

}
