import 'package:tearmusic/models/music/artist.dart';
import 'package:tearmusic/models/music/images.dart';

enum AlbumType { single, album, compilation }

extension AlbumTypeTitle on AlbumType {
  String get title {
    switch (this) {
      case AlbumType.album:
        return "Album";
      case AlbumType.single:
        return "Single";
      case AlbumType.compilation:
        return "Compilation";
    }
  }
}

class MusicAlbum {
  final String id;
  final String name;
  final AlbumType albumType;
  final int trackCount;
  final DateTime releaseDate;
  final List<MusicArtist> artists;
  final Images? images;

  MusicAlbum({
    required this.id,
    required this.name,
    required this.albumType,
    required this.trackCount,
    required this.releaseDate,
    required this.artists,
    required this.images,
  });

  factory MusicAlbum.fromJson(Map json) {
    return MusicAlbum(
      id: json["id"] ?? "",
      name: json["name"],
      albumType: AlbumType.values[["single", "album", "compilation"].indexOf(json["album_type"] ?? "album")],
      trackCount: json["track_count"] ?? 0,
      releaseDate: DateTime.tryParse(json["release_date"] ?? "") ?? DateTime.fromMillisecondsSinceEpoch(0),
      artists: json["artists"].map((e) => MusicArtist.fromJson(e)).toList().cast<MusicArtist>(),
      images: json["images"] != null && json["images"].isNotEmpty ? Images.fromJson(json["images"].cast<Map>()) : null,
    );
  }

  String get artistsLabel {
    if (artists.length == 2) {
      return "${artists[0].name} & ${artists[1].name}";
    }
    return artists.map((e) => e.name).join(", ");
  }

  String get title {
    if (albumType == AlbumType.single && trackCount > 1) {
      return "EP";
    }
    return albumType.title;
  }

  @override
  bool operator ==(other) => other is MusicAlbum && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
