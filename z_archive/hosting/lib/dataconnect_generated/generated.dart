library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_new_character.dart';

part 'get_character_by_id.dart';

part 'update_character_notes.dart';

part 'list_public_custom_content.dart';







class ExampleConnector {
  
  
  CreateNewCharacterVariablesBuilder createNewCharacter ({required String userId, required String class, required String gameSystem, required int level, required String name, }) {
    return CreateNewCharacterVariablesBuilder(dataConnect, userId: userId,class: class,gameSystem: gameSystem,level: level,name: name,);
  }
  
  
  GetCharacterByIdVariablesBuilder getCharacterById ({required String id, }) {
    return GetCharacterByIdVariablesBuilder(dataConnect, id: id,);
  }
  
  
  UpdateCharacterNotesVariablesBuilder updateCharacterNotes ({required String id, }) {
    return UpdateCharacterNotesVariablesBuilder(dataConnect, id: id,);
  }
  
  
  ListPublicCustomContentVariablesBuilder listPublicCustomContent () {
    return ListPublicCustomContentVariablesBuilder(dataConnect, );
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-east4',
    'example',
    'dicedungeons',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
