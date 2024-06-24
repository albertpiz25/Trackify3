<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>insertData</title>
    <link rel="stylesheet" type="text/css" href="Styles/insertData.css">
</head>
<body>
<div class="form">
    <div class="title">Aggiunta</div>
    <form action="Servlet_Insert" method="post">
        <div class="input-container ic1">
            <input id="track_name" name="track_name" class="input" type="text" placeholder=" " />
            <label for="track_name" class="placeholder">TRACK_NAME</label>
        </div>
        <div class="input-container ic1">
            <input id="artist_name" name="artist_name" class="input" type="text" placeholder=" " />
            <label for="artist_name" class="placeholder">ARTIST_NAME</label>
        </div>
        <div class="input-container ic1">
            <input id="streams" name="streams" class="input" type="text" placeholder=" " />
            <label for="streams" class="placeholder">STREAMS</label>
        </div>
        <div class="input-container ic1">
            <input id="valence" name="valence" class="input" type="text" placeholder=" " />
            <label for="valence" class="placeholder">VALENCE</label>
        </div>
        <div class="input-container ic1">
            <input id="acousticness" name="acousticness" class="input" type="text" placeholder=" " />
            <label for="acousticness" class="placeholder">ACOUSTICNESS</label>
        </div>
        <div class="input-container ic1">
            <input id="danceability" name="danceability" class="input" type="text" placeholder=" " />
            <label for="danceability" class="placeholder">DANCEABILITY</label>
        </div>
        <div class="input-container ic1">
            <input id="energy" name="energy" class="input" type="text" placeholder=" " />
            <label for="energy" class="placeholder">ENERGY</label>
        </div>
        <div class="input-container ic1">
            <input id="instrumentalness" name="instrumentalness" class="input" type="text" placeholder=" " />
            <label for="instrumentalness" class="placeholder">INSTRUMENTALNESS</label>
        </div>
        <div class="input-container ic1">
            <input id="liveness" name="liveness" class="input" type="text" placeholder=" " />
            <label for="liveness" class="placeholder">LIVENESS</label>
        </div>
        <div class="input-container ic1">
            <input id="speechiness" name="speechiness" class="input" type="text" placeholder=" " />
            <label for="speechiness" class="placeholder">SPEECHINESS</label>
        </div>
        <button type="submit" class="submit">Submit</button>
    </form>
</div>
</body>
</html>
