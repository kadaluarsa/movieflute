/// id : 550
/// backdrops : [{"aspect_ratio":1.77777777777778,"file_path":"/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg","height":720,"iso_639_1":null,"vote_average":0,"vote_count":0,"width":1280}]
/// posters : [{"aspect_ratio":0.666666666666667,"file_path":"/fpemzjF623QVTe98pCVlwwtFC5N.jpg","height":1800,"iso_639_1":"en","vote_average":0,"vote_count":0,"width":1200}]

class MovieImage {
  int _id;
  List<Backdrops> _backdrops;
  List<Posters> _posters;

  int get id => _id;
  List<Backdrops> get backdrops => _backdrops;
  List<Posters> get posters => _posters;

  MovieImage({
      int id, 
      List<Backdrops> backdrops, 
      List<Posters> posters}){
    _id = id;
    _backdrops = backdrops;
    _posters = posters;
}

  MovieImage.fromJson(dynamic json) {
    _id = json["id"];
    if (json["backdrops"] != null) {
      _backdrops = [];
      json["backdrops"].forEach((v) {
        _backdrops.add(Backdrops.fromJson(v));
      });
    }
    if (json["posters"] != null) {
      _posters = [];
      json["posters"].forEach((v) {
        _posters.add(Posters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    if (_backdrops != null) {
      map["backdrops"] = _backdrops.map((v) => v.toJson()).toList();
    }
    if (_posters != null) {
      map["posters"] = _posters.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// aspect_ratio : 0.666666666666667
/// file_path : "/fpemzjF623QVTe98pCVlwwtFC5N.jpg"
/// height : 1800
/// iso_639_1 : "en"
/// vote_average : 0
/// vote_count : 0
/// width : 1200

class Posters {
  double _aspectRatio;
  String _filePath;
  int _height;
  String _iso6391;
  int _voteAverage;
  int _voteCount;
  int _width;

  double get aspectRatio => _aspectRatio;
  String get filePath => _filePath;
  int get height => _height;
  String get iso6391 => _iso6391;
  int get voteAverage => _voteAverage;
  int get voteCount => _voteCount;
  int get width => _width;

  Posters({
      double aspectRatio, 
      String filePath, 
      int height, 
      String iso6391, 
      int voteAverage, 
      int voteCount, 
      int width}){
    _aspectRatio = aspectRatio;
    _filePath = filePath;
    _height = height;
    _iso6391 = iso6391;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _width = width;
}

  Posters.fromJson(dynamic json) {
    _aspectRatio = json["aspect_ratio"];
    _filePath = json["file_path"];
    _height = json["height"];
    _iso6391 = json["iso_639_1"];
    _voteAverage = json["vote_average"];
    _voteCount = json["vote_count"];
    _width = json["width"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["aspect_ratio"] = _aspectRatio;
    map["file_path"] = _filePath;
    map["height"] = _height;
    map["iso_639_1"] = _iso6391;
    map["vote_average"] = _voteAverage;
    map["vote_count"] = _voteCount;
    map["width"] = _width;
    return map;
  }

}

/// aspect_ratio : 1.77777777777778
/// file_path : "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg"
/// height : 720
/// iso_639_1 : null
/// vote_average : 0
/// vote_count : 0
/// width : 1280

class Backdrops {
  double _aspectRatio;
  String _filePath;
  int _height;
  dynamic _iso6391;
  int _voteAverage;
  int _voteCount;
  int _width;

  double get aspectRatio => _aspectRatio;
  String get filePath => _filePath;
  int get height => _height;
  dynamic get iso6391 => _iso6391;
  int get voteAverage => _voteAverage;
  int get voteCount => _voteCount;
  int get width => _width;

  Backdrops({
      double aspectRatio, 
      String filePath, 
      int height, 
      dynamic iso6391, 
      int voteAverage, 
      int voteCount, 
      int width}){
    _aspectRatio = aspectRatio;
    _filePath = filePath;
    _height = height;
    _iso6391 = iso6391;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _width = width;
}

  Backdrops.fromJson(dynamic json) {
    _aspectRatio = json["aspect_ratio"];
    _filePath = json["file_path"];
    _height = json["height"];
    _iso6391 = json["iso_639_1"];
    _voteAverage = json["vote_average"];
    _voteCount = json["vote_count"];
    _width = json["width"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["aspect_ratio"] = _aspectRatio;
    map["file_path"] = _filePath;
    map["height"] = _height;
    map["iso_639_1"] = _iso6391;
    map["vote_average"] = _voteAverage;
    map["vote_count"] = _voteCount;
    map["width"] = _width;
    return map;
  }

}