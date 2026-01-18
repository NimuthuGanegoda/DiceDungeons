part of 'generated.dart';

class CreateNewCharacterVariablesBuilder {
  String userId;
  String class;
  String gameSystem;
  int level;
  String name;

  final FirebaseDataConnect _dataConnect;
  CreateNewCharacterVariablesBuilder(this._dataConnect, {required  this.userId,required  this.class,required  this.gameSystem,required  this.level,required  this.name,});
  Deserializer<CreateNewCharacterData> dataDeserializer = (dynamic json)  => CreateNewCharacterData.fromJson(jsonDecode(json));
  Serializer<CreateNewCharacterVariables> varsSerializer = (CreateNewCharacterVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateNewCharacterData, CreateNewCharacterVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateNewCharacterData, CreateNewCharacterVariables> ref() {
    CreateNewCharacterVariables vars= CreateNewCharacterVariables(userId: userId,class: class,gameSystem: gameSystem,level: level,name: name,);
    return _dataConnect.mutation("CreateNewCharacter", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateNewCharacterCharacterInsert {
  final String id;
  CreateNewCharacterCharacterInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateNewCharacterCharacterInsert otherTyped = other as CreateNewCharacterCharacterInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateNewCharacterCharacterInsert({
    required this.id,
  });
}

@immutable
class CreateNewCharacterData {
  final CreateNewCharacterCharacterInsert character_insert;
  CreateNewCharacterData.fromJson(dynamic json):
  
  character_insert = CreateNewCharacterCharacterInsert.fromJson(json['character_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateNewCharacterData otherTyped = other as CreateNewCharacterData;
    return character_insert == otherTyped.character_insert;
    
  }
  @override
  int get hashCode => character_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['character_insert'] = character_insert.toJson();
    return json;
  }

  CreateNewCharacterData({
    required this.character_insert,
  });
}

@immutable
class CreateNewCharacterVariables {
  final String userId;
  final String class;
  final String gameSystem;
  final int level;
  final String name;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateNewCharacterVariables.fromJson(Map<String, dynamic> json):
  
  userId = nativeFromJson<String>(json['userId']),
  class = nativeFromJson<String>(json['class']),
  gameSystem = nativeFromJson<String>(json['gameSystem']),
  level = nativeFromJson<int>(json['level']),
  name = nativeFromJson<String>(json['name']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateNewCharacterVariables otherTyped = other as CreateNewCharacterVariables;
    return userId == otherTyped.userId && 
    class == otherTyped.class && 
    gameSystem == otherTyped.gameSystem && 
    level == otherTyped.level && 
    name == otherTyped.name;
    
  }
  @override
  int get hashCode => Object.hashAll([userId.hashCode, class.hashCode, gameSystem.hashCode, level.hashCode, name.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['userId'] = nativeToJson<String>(userId);
    json['class'] = nativeToJson<String>(class);
    json['gameSystem'] = nativeToJson<String>(gameSystem);
    json['level'] = nativeToJson<int>(level);
    json['name'] = nativeToJson<String>(name);
    return json;
  }

  CreateNewCharacterVariables({
    required this.userId,
    required this.class,
    required this.gameSystem,
    required this.level,
    required this.name,
  });
}

