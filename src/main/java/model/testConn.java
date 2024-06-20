package model;

import java.util.List;

public class testConn {

    public static void main(String[] args) {
        SongService songService = new SongService();
        List<Song> songs = songService.getAllSongs();

        for (Song song : songs) {
            System.out.println(song.getTrackName() + " by " + song.getArtistName());
        }
    }
}