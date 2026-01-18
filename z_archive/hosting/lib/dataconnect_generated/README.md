# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetCharacterById
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.getCharacterById(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetCharacterByIdData, GetCharacterByIdVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getCharacterById(
  id: id,
);
GetCharacterByIdData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.getCharacterById(
  id: id,
).ref();
ref.execute();

ref.subscribe(...);
```


### ListPublicCustomContent
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.listPublicCustomContent().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListPublicCustomContentData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.listPublicCustomContent();
ListPublicCustomContentData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.listPublicCustomContent().ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateNewCharacter
#### Required Arguments
```dart
String userId = ...;
String class = ...;
String gameSystem = ...;
int level = ...;
String name = ...;
ExampleConnector.instance.createNewCharacter(
  userId: userId,
  class: class,
  gameSystem: gameSystem,
  level: level,
  name: name,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<CreateNewCharacterData, CreateNewCharacterVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createNewCharacter(
  userId: userId,
  class: class,
  gameSystem: gameSystem,
  level: level,
  name: name,
);
CreateNewCharacterData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String userId = ...;
String class = ...;
String gameSystem = ...;
int level = ...;
String name = ...;

final ref = ExampleConnector.instance.createNewCharacter(
  userId: userId,
  class: class,
  gameSystem: gameSystem,
  level: level,
  name: name,
).ref();
ref.execute();
```


### UpdateCharacterNotes
#### Required Arguments
```dart
String id = ...;
ExampleConnector.instance.updateCharacterNotes(
  id: id,
).execute();
```

#### Optional Arguments
We return a builder for each query. For UpdateCharacterNotes, we created `UpdateCharacterNotesBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class UpdateCharacterNotesVariablesBuilder {
  ...
   UpdateCharacterNotesVariablesBuilder notes(String? t) {
   _notes.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.updateCharacterNotes(
  id: id,
)
.notes(notes)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<UpdateCharacterNotesData, UpdateCharacterNotesVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.updateCharacterNotes(
  id: id,
);
UpdateCharacterNotesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = ExampleConnector.instance.updateCharacterNotes(
  id: id,
).ref();
ref.execute();
```

