
class Movie_cast {
  int _id;
  List<Cast> _cast;
  List<Crew> _crew;

  int get id => _id;
  List<Cast> get cast => _cast;
  List<Crew> get crew => _crew;

  Movie_cast({
      int id, 
      List<Cast> cast, 
      List<Crew> crew}){
    _id = id;
    _cast = cast;
    _crew = crew;
}

  Movie_cast.fromJson(dynamic json) {
    _id = json["id"];
    if (json["cast"] != null) {
      _cast = [];
      json["cast"].forEach((v) {
        _cast.add(Cast.fromJson(v));
      });
    }
    if (json["crew"] != null) {
      _crew = [];
      json["crew"].forEach((v) {
        _crew.add(Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    if (_cast != null) {
      map["cast"] = _cast.map((v) => v.toJson()).toList();
    }
    if (_crew != null) {
      map["crew"] = _crew.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Crew {
  bool _adult;
  int _gender;
  int _id;
  String _knownForDepartment;
  String _name;
  String _originalName;
  double _popularity;
  String _profilePath;
  String _creditId;
  String _department;
  String _job;

  bool get adult => _adult;
  int get gender => _gender;
  int get id => _id;
  String get knownForDepartment => _knownForDepartment;
  String get name => _name;
  String get originalName => _originalName;
  double get popularity => _popularity;
  String get profilePath => _profilePath;
  String get creditId => _creditId;
  String get department => _department;
  String get job => _job;

  Crew({
      bool adult, 
      int gender, 
      int id, 
      String knownForDepartment, 
      String name, 
      String originalName, 
      double popularity, 
      String profilePath, 
      String creditId, 
      String department, 
      String job}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _creditId = creditId;
    _department = department;
    _job = job;
}

  Crew.fromJson(dynamic json) {
    _adult = json["adult"];
    _gender = json["gender"];
    _id = json["id"];
    _knownForDepartment = json["known_for_department"];
    _name = json["name"];
    _originalName = json["original_name"];
    _popularity = json["popularity"];
    _profilePath = json["profile_path"];
    _creditId = json["credit_id"];
    _department = json["department"];
    _job = json["job"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = _adult;
    map["gender"] = _gender;
    map["id"] = _id;
    map["known_for_department"] = _knownForDepartment;
    map["name"] = _name;
    map["original_name"] = _originalName;
    map["popularity"] = _popularity;
    map["profile_path"] = _profilePath;
    map["credit_id"] = _creditId;
    map["department"] = _department;
    map["job"] = _job;
    return map;
  }

}

/// adult : false
/// gender : 2
/// id : 819
/// known_for_department : "Acting"
/// name : "Edward Norton"
/// original_name : "Edward Norton"
/// popularity : 7.861
/// profile_path : "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg"
/// cast_id : 4
/// character : "The Narrator"
/// credit_id : "52fe4250c3a36847f80149f3"
/// order : 0

class Cast {
  bool _adult;
  int _gender;
  int _id;
  String _knownForDepartment;
  String _name;
  String _originalName;
  double _popularity;
  String _profilePath;
  int _castId;
  String _character;
  String _creditId;
  int _order;

  bool get adult => _adult;
  int get gender => _gender;
  int get id => _id;
  String get knownForDepartment => _knownForDepartment;
  String get name => _name;
  String get originalName => _originalName;
  double get popularity => _popularity;
  String get profilePath => _profilePath;
  int get castId => _castId;
  String get character => _character;
  String get creditId => _creditId;
  int get order => _order;

  Cast({
      bool adult, 
      int gender, 
      int id, 
      String knownForDepartment, 
      String name, 
      String originalName, 
      double popularity, 
      String profilePath, 
      int castId, 
      String character, 
      String creditId, 
      int order}){
    _adult = adult;
    _gender = gender;
    _id = id;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _originalName = originalName;
    _popularity = popularity;
    _profilePath = profilePath;
    _castId = castId;
    _character = character;
    _creditId = creditId;
    _order = order;
}

  Cast.fromJson(dynamic json) {
    _adult = json["adult"];
    _gender = json["gender"];
    _id = json["id"];
    _knownForDepartment = json["known_for_department"];
    _name = json["name"];
    _originalName = json["original_name"];
    _popularity = json["popularity"];
    _profilePath = json["profile_path"];
    _castId = json["cast_id"];
    _character = json["character"];
    _creditId = json["credit_id"];
    _order = json["order"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = _adult;
    map["gender"] = _gender;
    map["id"] = _id;
    map["known_for_department"] = _knownForDepartment;
    map["name"] = _name;
    map["original_name"] = _originalName;
    map["popularity"] = _popularity;
    map["profile_path"] = _profilePath;
    map["cast_id"] = _castId;
    map["character"] = _character;
    map["credit_id"] = _creditId;
    map["order"] = _order;
    return map;
  }

}