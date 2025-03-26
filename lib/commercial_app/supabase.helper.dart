import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> removeImage({required String bucket, required String path}) async {
  await supabase.storage.from(bucket).remove([path]);
}

Stream<List<T>> getDataStream<T>(
    {required String table,
    required List<String> ids,
    required T Function(Map<String, dynamic> json) fromJson}) {
  var stream = supabase.from(table).stream(primaryKey: ids);
  return stream.map(
    (mapList) => mapList
        .map(
          (e) => fromJson(e),
        )
        .toList(),
  );
}

Future<Map<int, T>> getMapData<T>(
    {required String table,
    required T Function(Map<String, dynamic> json) fromJson,
    required int Function(T) getId}) async {
  final data = await supabase.from(table).select("");
  var iterable = data.map(
    (e) => fromJson(e),
  );
  Map<int, T> maps = Map.fromIterable(
    iterable,
    key: (t) => getId(t),
    value: (t) => t,
  );
  return maps;
}

listenDataChange<T>(Map<int, T> maps,
    {Function()? updateUI,
    required String channel,
    required String schema,
    required T Function(Map<String, dynamic> json) fromJson,
    required int Function(T) getId,
    required String table}) {
  supabase
      .channel(channel)
      .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: schema,
          table: table,
          callback: (payload) {
            switch (payload.eventType) {
              case PostgresChangeEvent.insert:
                {
                  T t = fromJson(payload.newRecord);
                  maps[getId(t)] = t;
                  updateUI?.call();
                  break;
                }
              case PostgresChangeEvent.update:
                {
                  T t = fromJson(payload.newRecord);
                  maps[getId(t)] = t;
                  updateUI?.call();
                  break;
                }
              case PostgresChangeEvent.delete:
                {
                  maps.remove(payload.oldRecord["id"]);
                  updateUI?.call();
                  break;
                }
              default:
                {
                  return null;
                }
            }
          })
      .subscribe();
}
