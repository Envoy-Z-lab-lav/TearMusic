import 'package:tearmusic/api/base_api.dart';
import 'package:tearmusic/api/music_api.dart';
import 'package:tearmusic/models/music/album.dart';
import 'package:tearmusic/models/music/artist.dart';
import 'package:tearmusic/models/music/playlist.dart';
import 'package:tearmusic/models/music/search_results.dart';
import 'package:tearmusic/models/music/track.dart';

class MusicInfoProvider {
  MusicInfoProvider({required BaseApi base}) : _api = MusicApi(base: base);

  final MusicApi _api;

  Future<SearchResults> search(String query) async {
    return await _api.search(query);
  }

  Future<PlaylistDetails> playlistTracks(MusicPlaylist playlist) async {
    return await _api.playlistTracks(playlist);
  }

  Future<List<MusicTrack>> albumTracks(MusicAlbum album) async {
    return await _api.albumTracks(album);
  }

  Future<List<MusicAlbum>> newReleases() async {
    return await _api.newReleases();
  }

  Future<List<MusicAlbum>> artistAlbums(MusicArtist artist) async {
    return await _api.artistAlbums(artist);
  }

  Future<List<MusicTrack>> artistTracks(MusicArtist artist) async {
    return await _api.artistTracks(artist);
  }

  Future<List<MusicArtist>> artistRelated(MusicArtist artist) async {
    return await _api.artistRelated(artist);
  }
}
