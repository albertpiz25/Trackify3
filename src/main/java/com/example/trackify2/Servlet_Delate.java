package com.example.trackify2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.SongService;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "Servlet_Delate", value = "/Servlet_Delate")
public class Servlet_Delate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] selectedIds = req.getParameterValues("selectedIds");
        SongService songService = new SongService();
        if(selectedIds != null) {
            List<String> idList = Arrays.asList(selectedIds);
            for(String id : idList){
                songService.deleteSong(id);
            }
        }
        HttpSession session = req.getSession();
        int query = (int)session.getAttribute("query");
        resp.sendRedirect("Servlet_Visualizza_Tabella?query="+query);
        //req.getRequestDispatcher("Servlet_Visualizza_Tabella?query="+query).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
