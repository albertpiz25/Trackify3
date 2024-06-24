<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trackify - Home page</title>
    <link rel="stylesheet" type="text/css" href="Styles/index.css">
</head>
<body>
<div class="logoContainer">
    <img class="logo" src="image/logo1.png" style="width: 500px">
</div>
<div class="ag-format-container">
    <div class="ag-courses-item-presentation">
        <p>Trackify offre classifiche dettagliate basate su parametri tecnici di Spotify per esplorare e scoprire nuove tendenze musicali.</p>
    </div>
    <!-- Streams -->
    <div class="ag-courses_box">
        <div class="ag-courses_item">
            <a href="./Servlet_Visualizza_Tabella?query=1" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Successi in ascolto
                </div>
                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- Valence -->
        <div class="ag-courses_item">
            <a href="Servlet_Visualizza_Tabella?query=2" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Momenti di gioia
                </div>
                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- Acousticness -->
        <div class="ag-courses_item">
            <a href="Servlet_Visualizza_Tabella?query=3" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Acustiche e intime
                </div>
                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- danceability -->
        <div class="ag-courses_item">
            <a href="Servlet_Visualizza_Tabella?query=4" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Ritmo e movimento
                </div>
                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- Energy -->
        <div class="ag-courses_item">
            <a href="Servlet_Visualizza_Tabella?query=5" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Energia in piena fase
                </div>
                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- Instrumentalness -->
        <div class="ag-courses_item">
            <a href="Servlet_Visualizza_Tabella?query=6" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Viaggi strumentali
                </div>
                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- Liveness -->
        <div class="ag-courses_item">
            <a href="Servlet_Visualizza_Tabella?query=7" class="ag-courses-item_link">
                <div class="ag-courses-item_bg">
                </div>
                <div class="ag-courses-item_title">
                    Canzoni da palco
                </div>
                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- Speechiness -->
        <div class="ag-courses_item">
            <a href="Servlet_Visualizza_Tabella?query=8" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Poesie sonore
                </div>

                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

        <!-- Ricerca personale -->
        <div class="ag-courses_item">
            <a href="./Servlet_Visualizza_Tabella?query=9" class="ag-courses-item_link">
                <div class="ag-courses-item_bg"></div>

                <div class="ag-courses-item_title">
                    Esplora brani
                </div>

                <div class="ag-courses-item_date-box">
          <span class="ag-courses-item_date">
            Scopri la classifica
          </span>
                </div>
            </a>
        </div>

    </div>
</div>
</body>
</html>