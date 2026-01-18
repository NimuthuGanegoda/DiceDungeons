part of 'generated.dart';

class GetCharacterByIdVariablesBuilder {
  String id;

  final FirebaseDataConnect _dataConnect;
  GetCharacterByIdVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<GetCharacterByIdData> dataDeserializer = (dynamic json)  => GetCharacterByIdData.fromJson(jsonDecode(json));
  Serializer<GetCharacterByIdVariables> varsSerializer = (GetCharacterByIdVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetCharacterByIdData, GetCharacterByIdVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetCharacterByIdData, GetCharacterByIdVariables> ref() {
    GetCharacterByIdVariables vars= GetCharacterByIdVariables(id: id,);
    return _dataConnect.query("GetCharacterById", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class GetCharacterByIdCharacter {
  final String id;
  final String name;
  final String class;
  final int level;
  final String gameSystem;
  final String userId;
  GetCharacterByIdCharacter.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']),
  class = nativeFromJson<String>(json['class']),
  level = nativeFromJson<int>(json['level']),
  gameSystem = nativeFromJson<String>(json['gameSystem']),
  userId = nativeFromJson<String>(json['userId']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetCharacterByIdCharacter otherTyped = other as GetCharacterByIdCharacter;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    class == otherTyped.class && 
    level == otherTyped.level && 
    gameSystem == otherTyped.gameSystem && 
    userId == otherTyped.userId;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, class.hashCode, level.hashCode, gameSystem.hashCode, userId.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    json['class'] = nativeToJson<String>(class);
    json['level'] = nativeToJson<int>(level);
    json['gameSystem'] = nativeToJson<String>(gameSystem);
    json['userId'] = nativeToJson<String>(userId);
    return json;
  }

  GetCharacterByIdCharacter({
    required this.id,
    required this.name,
    required this.class,
    required this.level,
    required this.gameSystem,
    required this.userId,
  });
}

@immutable
class GetCharacterByIdData {
  final GetCharacterByIdCharacter? character;
  GetCharacterByIdData.fromJson(dynamic json):
  
  character = json['character'] == null ? null : GetCharacterByIdCharacter.fromJson(json['character']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetCharacterByIdData otherTyped = other as GetCharacterByIdData;
    return character == otherTyped.character;
    
  }
  @override
  int get hashCode => character.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (character != null) {
      json['character'] = character!.toJson();
    }
    return json;
  }

  GetCharacterByIdData({
    this.character,
  });
}

@immutable
class GetCharacterByIdVariables {
  final String id;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetCharacterByIdVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetCharacterByIdVariables otherTyped = other as GetCharacterByIdVariables;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetCharacterByIdVariables({
    required this.id,
  });
}

