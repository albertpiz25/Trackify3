package com.example.trackify2;

import jakarta.servlet.ServletException;
import model.Song;
import model.SongService;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Servlet_Visualizza_Tabella", value = "/Servlet_Visualizza_Tabella")
public class Servlet_Visualizza_Tabella extends HttpServlet {

    private final SongService songService = new SongService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tquerystr = req.getParameter("query");
        int tquery = Integer.parseInt(tquerystr);
        List<Song> songs = new ArrayList<>();
        HttpSession session = req.getSession(true);

        try {
            String red = "table.jsp";

            switch (tquery) {
                case 1:
                    songs = songService.getSongsSortedByStreams();
                    break;
                case 2:
                    songs = songService.getSongsSortedByValence();
                    break;
                case 3:
                    songs = songService.getSongsSortedByAcousticness();
                    break;
                case 4:
                    songs = songService.getSongsSortedByDanceability();
                    break;
                case 5:
                    songs = songService.getSongsSortedByEnergy();
                    break;
                case 6:
                    songs = songService.getSongsSortedByInstrumentalness();
                    break;
                case 7:
                    songs = songService.getSongsSortedByLiveness();
                    break;
                case 8:
                    songs = songService.getSongsSortedBySpeechiness();
                    break;
                case 9:
                    red = "cerca.jsp";
                    session.setAttribute("attribute", req.getParameter("attribute"));
                    session.setAttribute("value", req.getParameter("value"));
                    String attribute = (String) session.getAttribute("attribute");
                    String value = (String) session.getAttribute("value");
                    if (value != null && !value.equals("")) {

                        switch (attribute) {
                            case "_id":
                                songs.add(songService.getSongById(value));
                                break;
                            case "track_name":
                                songs = songService.searchByTrackName(value);
                                break;
                            case "artist_name":
                                songs = songService.searchByArtistName(value);
                                break;
                            case "streams":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchByStreams(Long.parseLong(values[0]), Long.parseLong(values[1]));
                                } else {
                                    songs = songService.searchByStreams(Long.parseLong(value));
                                }
                                break;
                            case "acousticness":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchByAcousticness(Double.parseDouble(values[0]), Double.parseDouble(values[1]));
                                } else {
                                    songs = songService.searchByAcousticness(Double.parseDouble(value));
                                }
                                break;
                            case "danceability":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchByDanceability(Double.parseDouble(values[0]), Double.parseDouble(values[1]));
                                } else {
                                    songs = songService.searchByDanceability(Double.parseDouble(value));
                                }
                                break;
                            case "energy":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchByEnergy(Double.parseDouble(values[0]), Double.parseDouble(values[1]));
                                } else {
                                    songs = songService.searchByEnergy(Double.parseDouble(value));
                                }
                                break;
                            case "instrumentalness":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchByInstrumentalness(Double.parseDouble(values[0]), Double.parseDouble(values[1]));
                                } else {
                                    songs = songService.searchByInstrumentalness(Double.parseDouble(value));
                                }
                                break;
                            case "liveness":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchByLiveness(Double.parseDouble(values[0]), Double.parseDouble(values[1]));
                                } else {
                                    songs = songService.searchByLiveness(Double.parseDouble(value));
                                }
                                break;
                            case "speechiness":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchBySpeechiness(Double.parseDouble(values[0]), Double.parseDouble(values[1]));
                                } else {
                                    songs = songService.searchBySpeechiness(Double.parseDouble(value));
                                }
                                break;
                            case "valence":
                                if (value.contains("-")) {
                                    String[] values = value.split("-");
                                    songs = songService.searchByValence(Double.parseDouble(values[0]), Double.parseDouble(values[1]));
                                } else {
                                    songs = songService.searchByValence(Double.parseDouble(value));
                                }
                                break;
                        }
                        System.out.println(attribute);
                        System.out.println(value);
                        for (Song song : songs) {
                            System.out.println(song.getTrackName() + " by " + song.getArtistName());
                        }
                    } else {
                        songs = songService.getAllSongs();
                    }
                    break;
            }

            session.setAttribute("query", tquery);

            req.setAttribute("songList", songs);
            req.getRequestDispatcher(red).forward(req, resp);
        }
        catch (Exception e) {
            String red = "error.jsp";
            req.getRequestDispatcher(red).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
