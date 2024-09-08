class WeaponsApi {
  int? status;
  List<Data>? data;

  WeaponsApi({this.status, this.data});

  WeaponsApi.fromJson(Map<String, dynamic> json) {
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
  String? category;
  String? defaultSkinUuid;
  String? displayIcon;
  String? killStreamIcon;
  String? assetPath;
  WeaponStats? weaponStats;
  ShopData? shopData;
  List<Skins>? skins;

  Data(
      {this.uuid,
        this.displayName,
        this.category,
        this.defaultSkinUuid,
        this.displayIcon,
        this.killStreamIcon,
        this.assetPath,
        this.weaponStats,
        this.shopData,
        this.skins});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    category = json['category'];
    defaultSkinUuid = json['defaultSkinUuid'];
    displayIcon = json['displayIcon'];
    killStreamIcon = json['killStreamIcon'];
    assetPath = json['assetPath'];
    weaponStats = json['weaponStats'] != null
        ? WeaponStats.fromJson(json['weaponStats'])
        : null;
    shopData = json['shopData'] != null
        ? ShopData.fromJson(json['shopData'])
        : null;
    if (json['skins'] != null) {
      skins = <Skins>[];
      json['skins'].forEach((v) {
        skins!.add(Skins.fromJson(v));
      });
    }
  }
}

class WeaponStats {
  double? fireRate;
  int? magazineSize;
  double? runSpeedMultiplier;
  double? equipTimeSeconds;
  double? reloadTimeSeconds;
  double? firstBulletAccuracy;
  int? shotgunPelletCount;
  String? wallPenetration;
  String? feature;
  String? fireMode;
  String? altFireType;
  AdsStats? adsStats;
  AltShotgunStats? altShotgunStats;
  AirBurstStats? airBurstStats;
  List<DamageRanges>? damageRanges;

  WeaponStats(
      {this.fireRate,
        this.magazineSize,
        this.runSpeedMultiplier,
        this.equipTimeSeconds,
        this.reloadTimeSeconds,
        this.firstBulletAccuracy,
        this.shotgunPelletCount,
        this.wallPenetration,
        this.feature,
        this.fireMode,
        this.altFireType,
        this.adsStats,
        this.altShotgunStats,
        this.airBurstStats,
        this.damageRanges});

  WeaponStats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'] is int ? (json['fireRate'] as int).toDouble() : json['fireRate']?.toDouble();
    magazineSize = json['magazineSize'];
    runSpeedMultiplier = json['runSpeedMultiplier'] is int ? (json['runSpeedMultiplier'] as int).toDouble() : json['runSpeedMultiplier']?.toDouble();
    equipTimeSeconds = json['equipTimeSeconds'] is int ? (json['equipTimeSeconds'] as int).toDouble() : json['equipTimeSeconds']?.toDouble();
    reloadTimeSeconds = json['reloadTimeSeconds'] is int ? (json['reloadTimeSeconds'] as int).toDouble() : json['reloadTimeSeconds']?.toDouble();
    firstBulletAccuracy = json['firstBulletAccuracy'] is int ? (json['firstBulletAccuracy'] as int).toDouble() : json['firstBulletAccuracy']?.toDouble();
    shotgunPelletCount = json['shotgunPelletCount'];
    wallPenetration = json['wallPenetration'];
    feature = json['feature'];
    fireMode = json['fireMode'];
    altFireType = json['altFireType'];
    adsStats = json['adsStats'] != null
        ? AdsStats.fromJson(json['adsStats'])
        : null;
    altShotgunStats = json['altShotgunStats'] != null
        ? AltShotgunStats.fromJson(json['altShotgunStats'])
        : null;
    airBurstStats = json['airBurstStats'] != null
        ? AirBurstStats.fromJson(json['airBurstStats'])
        : null;
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRanges>[];
      json['damageRanges'].forEach((v) {
        damageRanges!.add(DamageRanges.fromJson(v));
      });
    }
  }
}

class AdsStats {
  double? zoomMultiplier;
  double? fireRate;
  double? runSpeedMultiplier;
  int? burstCount;
  double? firstBulletAccuracy;

  AdsStats(
      {this.zoomMultiplier,
        this.fireRate,
        this.runSpeedMultiplier,
        this.burstCount,
        this.firstBulletAccuracy});

  AdsStats.fromJson(Map<String, dynamic> json) {
    zoomMultiplier = json['zoomMultiplier'] is int ? (json['zoomMultiplier'] as int).toDouble() : json['zoomMultiplier']?.toDouble();
    fireRate = json['fireRate'] is int ? (json['fireRate'] as int).toDouble() : json['fireRate']?.toDouble();
    runSpeedMultiplier = json['runSpeedMultiplier'] is int ? (json['runSpeedMultiplier'] as int).toDouble() : json['runSpeedMultiplier']?.toDouble();
    burstCount = json['burstCount'];
    firstBulletAccuracy = json['firstBulletAccuracy'] is int ? (json['firstBulletAccuracy'] as int).toDouble() : json['firstBulletAccuracy']?.toDouble();
  }
}

class AltShotgunStats {
  int? shotgunPelletCount;
  double? burstRate;

  AltShotgunStats({this.shotgunPelletCount, this.burstRate});

  AltShotgunStats.fromJson(Map<String, dynamic> json) {
    shotgunPelletCount = json['shotgunPelletCount'];
    burstRate = json['burstRate'] is int ? (json['burstRate'] as int).toDouble() : json['burstRate']?.toDouble();
  }
}

class AirBurstStats {
  int? shotgunPelletCount;
  double? burstDistance;

  AirBurstStats({this.shotgunPelletCount, this.burstDistance});

  AirBurstStats.fromJson(Map<String, dynamic> json) {
    shotgunPelletCount = json['shotgunPelletCount'];
    burstDistance = json['burstDistance'] is int ? (json['burstDistance'] as int).toDouble() : json['burstDistance']?.toDouble();
  }
}

class DamageRanges {
  int? rangeStartMeters;
  int? rangeEndMeters;
  double? headDamage;
  int? bodyDamage;
  double? legDamage;

  DamageRanges(
      {this.rangeStartMeters,
        this.rangeEndMeters,
        this.headDamage,
        this.bodyDamage,
        this.legDamage});

  DamageRanges.fromJson(Map<String, dynamic> json) {
    rangeStartMeters = json['rangeStartMeters'];
    rangeEndMeters = json['rangeEndMeters'];
    headDamage = json['headDamage'] is int ? (json['headDamage'] as int).toDouble() : json['headDamage']?.toDouble();
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'] is int ? (json['legDamage'] as int).toDouble() : json['legDamage']?.toDouble();
  }
}

class ShopData {
  int? cost;
  String? category;
  int? shopOrderPriority;
  String? categoryText;
  GridPosition? gridPosition;
  bool? canBeTrashed;
  String? image; // Change from Null to String
  String? newImage;
  String? newImage2;
  String? assetPath;

  ShopData(
      {this.cost,
        this.category,
        this.shopOrderPriority,
        this.categoryText,
        this.gridPosition,
        this.canBeTrashed,
        this.image,
        this.newImage,
        this.newImage2,
        this.assetPath});

  ShopData.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
    shopOrderPriority = json['shopOrderPriority'];
    categoryText = json['categoryText'];
    gridPosition = json['gridPosition'] != null
        ? GridPosition.fromJson(json['gridPosition'])
        : null;
    canBeTrashed = json['canBeTrashed'];
    image = json['image']; // Change from Null to String
    newImage = json['newImage'];
    newImage2 = json['newImage2'];
    assetPath = json['assetPath'];
  }
}

class GridPosition {
  int? row;
  int? column;

  GridPosition({this.row, this.column});

  GridPosition.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
  }
}

class Skins {
  String? uuid;
  String? displayName;
  String? themeUuid;
  String? contentTierUuid;
  String? displayIcon;
  String? wallpaper;
  String? assetPath;
  List<Chromas>? chromas;
  List<Levels>? levels;

  Skins(
      {this.uuid,
        this.displayName,
        this.themeUuid,
        this.contentTierUuid,
        this.displayIcon,
        this.wallpaper,
        this.assetPath,
        this.chromas,
        this.levels});

  Skins.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    themeUuid = json['themeUuid'];
    contentTierUuid = json['contentTierUuid'];
    displayIcon = json['displayIcon'];
    wallpaper = json['wallpaper'];
    assetPath = json['assetPath'];
    if (json['chromas'] != null) {
      chromas = <Chromas>[];
      json['chromas'].forEach((v) {
        chromas!.add(Chromas.fromJson(v));
      });
    }
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(Levels.fromJson(v));
      });
    }
  }
}

class Chromas {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? fullRender;
  String? swatch;
  String? streamedVideo;
  String? assetPath;

  Chromas(
      {this.uuid,
        this.displayName,
        this.displayIcon,
        this.fullRender,
        this.swatch,
        this.streamedVideo,
        this.assetPath});

  Chromas.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    fullRender = json['fullRender'];
    swatch = json['swatch'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }
}

class Levels {
  String? uuid;
  String? displayName;
  String? levelItem;
  String? displayIcon;
  String? streamedVideo;
  String? assetPath;

  Levels(
      {this.uuid,
        this.displayName,
        this.levelItem,
        this.displayIcon,
        this.streamedVideo,
        this.assetPath});

  Levels.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    levelItem = json['levelItem'];
    displayIcon = json['displayIcon'];
    streamedVideo = json['streamedVideo'];
    assetPath = json['assetPath'];
  }
}
