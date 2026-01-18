part of 'generated.dart';

class ListPublicCustomContentVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListPublicCustomContentVariablesBuilder(this._dataConnect, );
  Deserializer<ListPublicCustomContentData> dataDeserializer = (dynamic json)  => ListPublicCustomContentData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListPublicCustomContentData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListPublicCustomContentData, void> ref() {
    
    return _dataConnect.query("ListPublicCustomContent", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class ListPublicCustomContentCustomContents {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  final String type;
  final String? stats;
  ListPublicCustomContentCustomContents.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  name = nativeFromJson<String>(json['name']),
  description = json['description'] == null ? null : nativeFromJson<String>(json['description']),
  imageUrl = json['imageUrl'] == null ? null : nativeFromJson<String>(json['imageUrl']),
  type = nativeFromJson<String>(json['type']),
  stats = json['stats'] == null ? null : nativeFromJson<String>(json['stats']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListPublicCustomContentCustomContents otherTyped = other as ListPublicCustomContentCustomContents;
    return id == otherTyped.id && 
    name == otherTyped.name && 
    description == otherTyped.description && 
    imageUrl == otherTyped.imageUrl && 
    type == otherTyped.type && 
    stats == otherTyped.stats;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, name.hashCode, description.hashCode, imageUrl.hashCode, type.hashCode, stats.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['name'] = nativeToJson<String>(name);
    if (description != null) {
      json['description'] = nativeToJson<String?>(description);
    }
    if (imageUrl != null) {
      json['imageUrl'] = nativeToJson<String?>(imageUrl);
    }
    json['type'] = nativeToJson<String>(type);
    if (stats != null) {
      json['stats'] = nativeToJson<String?>(stats);
    }
    return json;
  }

  ListPublicCustomContentCustomContents({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    required this.type,
    this.stats,
  });
}

@immutable
class ListPublicCustomContentData {
  final List<ListPublicCustomContentCustomContents> customContents;
  ListPublicCustomContentData.fromJson(dynamic json):
  
  customContents = (json['customContents'] as List<dynamic>)
        .map((e) => ListPublicCustomContentCustomContents.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final ListPublicCustomContentData otherTyped = other as ListPublicCustomContentData;
    return customContents == otherTyped.customContents;
    
  }
  @override
  int get hashCode => customContents.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['customContents'] = customContents.map((e) => e.toJson()).toList();
    return json;
  }

  ListPublicCustomContentData({
    required this.customContents,
  });
}

