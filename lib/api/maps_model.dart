class MapsApi {
  int? status;
  List<Data>? data;

  MapsApi({this.status, this.data});

  MapsApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? uuid;
  String? displayName;
  Null? narrativeDescription;
  String? tacticalDescription;
  String? coordinates;
  String? displayIcon;
  String? listViewIcon;
  String? listViewIconTall;
  String? splash;
  String? stylizedBackgroundImage;
  String? premierBackgroundImage;
  String? assetPath;
  String? mapUrl;
  double? xMultiplier;
  double? yMultiplier;
  double? xScalarToAdd;
  double? yScalarToAdd;
  List<Callouts>? callouts;

  Data(
      {this.uuid,
        this.displayName,
        this.narrativeDescription,
        this.tacticalDescription,
        this.coordinates,
        this.displayIcon,
        this.listViewIcon,
        this.listViewIconTall,
        this.splash,
        this.stylizedBackgroundImage,
        this.premierBackgroundImage,
        this.assetPath,
        this.mapUrl,
        this.xMultiplier,
        this.yMultiplier,
        this.xScalarToAdd,
        this.yScalarToAdd,
        this.callouts});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    narrativeDescription = json['narrativeDescription'];
    tacticalDescription = json['tacticalDescription'];
    coordinates = json['coordinates'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    listViewIconTall = json['listViewIconTall'];
    splash = json['splash'];
    stylizedBackgroundImage = json['stylizedBackgroundImage'];
    premierBackgroundImage = json['premierBackgroundImage'];
    assetPath = json['assetPath'];
    mapUrl = json['mapUrl'];
    xMultiplier = json['xMultiplier'] is int ? (json['xMultiplier'] as int).toDouble() : json['xMultiplier']?.toDouble();
    yMultiplier = json['yMultiplier'] is int ? (json['yMultiplier'] as int).toDouble() : json['yMultiplier']?.toDouble();
    xScalarToAdd = json['xScalarToAdd'] is int ? (json['xScalarToAdd'] as int).toDouble() : json['xScalarToAdd']?.toDouble();
    yScalarToAdd = json['yScalarToAdd'] is int ? (json['yScalarToAdd'] as int).toDouble() : json['yScalarToAdd']?.toDouble();
    if (json['callouts'] != null) {
      callouts = <Callouts>[];
      json['callouts'].forEach((v) {
        callouts!.add(Callouts.fromJson(v));
      });
    }
  }
}

class Callouts {
  String? regionName;
  String? superRegionName;
  Location? location;

  Callouts({this.regionName, this.superRegionName, this.location});

  Callouts.fromJson(Map<String, dynamic> json) {
    regionName = json['regionName'];
    superRegionName = json['superRegionName'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
}

class Location {
  double? x;
  double? y;

  Location({this.x, this.y});

  Location.fromJson(Map<String, dynamic> json) {
    x = json['x'] is int ? (json['x'] as int).toDouble() : json['x']?.toDouble();
    y = json['y'] is int ? (json['y'] as int).toDouble() : json['y']?.toDouble();
  }
}
