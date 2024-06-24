package com.example.trackify2;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Song;
import model.SongService;
import org.bson.types.ObjectId;

import java.io.IOException;

@WebServlet(name = "Servlet_Insert", value = "/Servlet_Insert")
public class Servlet_Insert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Song song = new Song(null,
                Double.parseDouble(request.getParameter("acousticness")),
                request.getParameter("artist_name"),
                Double.parseDouble(request.getParameter("danceability")),
                Double.parseDouble(request.getParameter("energy")),
                Double.parseDouble(request.getParameter("instrumentalness")),
                Double.parseDouble(request.getParameter("liveness")),
                Double.parseDouble(request.getParameter("speechiness")),
                Long.parseLong(request.getParameter("streams")),
                request.getParameter("track_name"),
                Double.parseDouble(request.getParameter("valence")));

        SongService songService = new SongService();
        songService.insertSong(song);
        HttpSession session = request.getSession();
        int query = (int)session.getAttribute("query");
        response.sendRedirect("Servlet_Visualizza_Tabella?query="+query);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}