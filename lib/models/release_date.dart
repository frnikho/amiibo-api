class ReleaseDate {
  String zone;
  String date;

  ReleaseDate(this.zone, this.date);

  static List<ReleaseDate> arrayFromJson(Map<dynamic, dynamic> releasesJson) {
    List<ReleaseDate> releases = [];
    for (String k in releasesJson.keys) {
      releases.add(ReleaseDate(k, releasesJson[k]));
    }
    return (releases);
  }

}