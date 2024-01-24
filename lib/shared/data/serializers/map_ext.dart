extension MapExtentions on Map {
  dynamic getValueByKeyList(List<String> keys) {
    if (keys.isEmpty) return null;

    if (keys.length == 1) return this[keys.first];
    final current = this[keys.first] as Map<String, dynamic>?;

    keys.remove(keys.first);
    return current?.getValueByKeyList(keys);
  }

  dynamic getValueImageByKeyList(List<String> keys) {
    if (keys.isEmpty) return null;

    if (keys.length == 1) return this[0][keys.first];
    final current = this[0][keys.first] as Map<String, dynamic>?;

    keys.remove(keys.first);
    return current?.getValueImageByKeyList(keys);
  }

  dynamic getValueByKeyListLon(List<String> keys) {
    if (keys.isEmpty) return null;

    if (keys.length == 1) return this[keys.first];
    final current = this[keys.first] as Map<String, dynamic>?;

    keys.remove(keys.first);
    return current?.getValueByKeyList(keys).replaceAll(',', '.');
  }

  dynamic getValueByKeyListLonNps(List<String> keys) {
    if (keys.isEmpty) return null;

    if (keys.length == 1) return this[keys.first];
    final current = this[keys.first] as Map<String, dynamic>?;

    keys.remove(keys.first);
    var resul =
        current?.getValueByKeyList(keys).replaceAll(',', '.').split('.')[0];
    return int.parse(resul);
  }

  dynamic getValueByKeyListPhoto(List<String> keys) {
    if (keys.isEmpty) return null;

    if (keys.length == 1) return this[keys.first];
    final current = this[keys.first] as Map<String, dynamic>?;
    keys.remove(keys.first);
    final key = current?.getValueByKeyListPhoto(keys);
    return key ?? " ";
  }

  dynamic getValueByKeyListPhotoNav(List<String> keys) {
    if (keys.isEmpty) return null;

    if (keys.length == 1) return this[keys.first];
    final current = this[keys.first] as Map<String, dynamic>?;
    keys.remove(keys.first);
    return current?.getValueByKeyListPhoto(keys);
  }
}
