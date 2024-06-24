package com.example.trackify2;

import jakarta.servlet.ServletException;
import model.Song;
import model.SongService;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet_Visualizza_Tabella", value = "/Servlet_Visualizza_Tabella")
public class Servlet_Visualizza_Tabella extends HttpServlet {

    private final SongService songService = new SongService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tquerystr = req.getParameter("query");
        int tquery = Integer.parseInt(tquerystr);
        String red = "table.jsp";
        List<Song> songs = null;

         switch (tquery){
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
                 songs = songService.getAllSongs();
                 red = "ceraca.jsp";
                 break;
         }

         HttpSession session = req.getSession(true);
         session.setAttribute("query", tquery);
         req.setAttribute("songList", songs);
         req.getRequestDispatcher(red).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
