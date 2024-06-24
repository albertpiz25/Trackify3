<%@ page import="model.Song" %>
<%@ page import="model.SongService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>insertData</title>
    <link rel="stylesheet" type="text/css" href="Styles/update.css">
</head>
<body>
<div class="form">
    <%
        String id = request.getParameter("songId");
        SongService songService = new SongService();
        Song song = songService.getSongById(id);

    %>
    <div class="title">Modifica</div>
    <form action="Servlet_Update" method="post">
        <div class="input-container ic1">
            <input id="track_name" name="track_name" class="input" type="text" value="<%=song.getTrackName()%>" placeholder=" " />
            <label for="track_name" class="placeholder">TRACK_NAME</label>
        </div>
        <div class="input-container ic1">
            <input id="artist_name" name="artist_name" class="input" type="text" value="<%=song.getArtistName()%>" placeholder=" " />
            <label for="artist_name" class="placeholder">ARTIST_NAME</label>
        </div>
        <div class="input-container ic1">
            <input id="streams" name="streams" class="input" type="text" value="<%=song.getStreams()%>" placeholder=" " />
            <label for="streams" class="placeholder">STREAMS</label>
        </div>
        <div class="input-container ic1">
            <input id="valence" name="valence" class="input" type="text" value="<%=song.getValence()%>" placeholder=" " />
            <label for="valence" class="placeholder">VALENCE</label>
        </div>
        <div class="input-container ic1">
            <input id="acousticness" name="acousticness" class="input" type="text" value="<%=song.getAcousticness()%>" placeholder=" " />
            <label for="acousticness" class="placeholder">ACOUSTICNESS</label>
        </div>
        <div class="input-container ic1">
            <input id="danceability" name="danceability" class="input" type="text" value="<%=song.getDanceability()%>" placeholder=" " />
            <label for="danceability" class="placeholder">DANCEABILITY</label>
        </div>
        <div class="input-container ic1">
            <input id="energy" name="energy" class="input" type="text" value="<%=song.getEnergy()%>" placeholder=" " />
            <label for="energy" class="placeholder">ENERGY</label>
        </div>
        <div class="input-container ic1">
            <input id="instrumentalness" name="instrumentalness" class="input" type="text" value="<%=song.getInstrumentalness()%>" placeholder=" " />
            <label for="instrumentalness" class="placeholder">INSTRUMENTALNESS</label>
        </div>
        <div class="input-container ic1">
            <input id="liveness" name="liveness" class="input" type="text" value="<%=song.getLiveness()%>" placeholder=" " />
            <label for="liveness" class="placeholder">LIVENESS</label>
        </div>
        <div class="input-container ic1">
            <input id="speechiness" name="speechiness" class="input" type="text" value="<%=song.getSpeechiness()%>" placeholder=" " />
            <label for="speechiness" class="placeholder">SPEECHINESS</label>
        </div>
        <input type="hidden" name="songId" value="<%=song.getId()%>">
        <button type="submit" class="submit">Submit</button>
    </form>
</div>
</body>
</html>
