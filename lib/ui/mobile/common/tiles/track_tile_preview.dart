import 'package:flutter/material.dart';
import 'package:tearmusic/models/music/track.dart';
import 'package:tearmusic/ui/mobile/common/tiles/track_tile.dart';

class TrackTilePreview extends StatelessWidget {
  const TrackTilePreview(this.track, {Key? key}) : super(key: key);

  final MusicTrack track;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withValues(alpha: .5),
        child: TrackTile(
          track,
          onLongPressed: () {},
          onPressed: () {},
          trailingDuration: true,
        ),
      ),
    );
  }
}
