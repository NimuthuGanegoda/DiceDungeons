part of 'generated.dart';

class UpdateCharacterNotesVariablesBuilder {
  String id;
  Optional<String> _notes = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  UpdateCharacterNotesVariablesBuilder notes(String? t) {
   _notes.value = t;
   return this;
  }

  UpdateCharacterNotesVariablesBuilder(this._dataConnect, {required  this.id,});
  Deserializer<UpdateCharacterNotesData> dataDeserializer = (dynamic json)  => UpdateCharacterNotesData.fromJson(jsonDecode(json));
  Serializer<UpdateCharacterNotesVariables> varsSerializer = (UpdateCharacterNotesVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateCharacterNotesData, UpdateCharacterNotesVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateCharacterNotesData, UpdateCharacterNotesVariables> ref() {
    UpdateCharacterNotesVariables vars= UpdateCharacterNotesVariables(id: id,notes: _notes,);
    return _dataConnect.mutation("UpdateCharacterNotes", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class UpdateCharacterNotesCharacterUpdate {
  final String id;
  UpdateCharacterNotesCharacterUpdate.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateCharacterNotesCharacterUpdate otherTyped = other as UpdateCharacterNotesCharacterUpdate;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateCharacterNotesCharacterUpdate({
    required this.id,
  });
}

@immutable
class UpdateCharacterNotesData {
  final UpdateCharacterNotesCharacterUpdate? character_update;
  UpdateCharacterNotesData.fromJson(dynamic json):
  
  character_update = json['character_update'] == null ? null : UpdateCharacterNotesCharacterUpdate.fromJson(json['character_update']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateCharacterNotesData otherTyped = other as UpdateCharacterNotesData;
    return character_update == otherTyped.character_update;
    
  }
  @override
  int get hashCode => character_update.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (character_update != null) {
      json['character_update'] = character_update!.toJson();
    }
    return json;
  }

  UpdateCharacterNotesData({
    this.character_update,
  });
}

@immutable
class UpdateCharacterNotesVariables {
  final String id;
  late final Optional<String>notes;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateCharacterNotesVariables.fromJson(Map<String, dynamic> json):
  
  id = nativeFromJson<String>(json['id']) {
  
  
  
    notes = Optional.optional(nativeFromJson, nativeToJson);
    notes.value = json['notes'] == null ? null : nativeFromJson<String>(json['notes']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final UpdateCharacterNotesVariables otherTyped = other as UpdateCharacterNotesVariables;
    return id == otherTyped.id && 
    notes == otherTyped.notes;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, notes.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if(notes.state == OptionalState.set) {
      json['notes'] = notes.toJson();
    }
    return json;
  }

  UpdateCharacterNotesVariables({
    required this.id,
    required this.notes,
  });
}

