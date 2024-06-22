<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>insertData</title>
    <link rel="stylesheet" type="text/css" href="Styles/update.css">
</head>
<body>
<div class="form">
    <div class="title">Modifica</div>
    <form>
        <div class="input-container ic1">
            <input id="track_name" class="input" type="text" placeholder=" " />
            <label for="track_name" class="placeholder">TRACK_NAME</label>
        </div>
        <div class="input-container ic1">
            <input id="artist_name" class="input" type="text" placeholder=" " />
            <label for="artist_name" class="placeholder">ARTIST_NAME</label>
        </div>
        <div class="input-container ic1">
            <input id="streams" class="input" type="text" placeholder=" " />
            <label for="streams" class="placeholder">STREAMS</label>
        </div>
        <div class="input-container ic1">
            <input id="valence" class="input" type="text" placeholder=" " />
            <label for="valence" class="placeholder">VALENCE</label>
        </div>
        <div class="input-container ic1">
            <input id="acousticness" class="input" type="text" placeholder=" " />
            <label for="acousticness" class="placeholder">ACOUSTICNESS</label>
        </div>
        <div class="input-container ic1">
            <input id="danceability" class="input" type="text" placeholder=" " />
            <label for="danceability" class="placeholder">DANCEABILITY</label>
        </div>
        <div class="input-container ic1">
            <input id="energy" class="input" type="text" placeholder=" " />
            <label for="energy" class="placeholder">ENERGY</label>
        </div>
        <div class="input-container ic1">
            <input id="instrumentalness" class="input" type="text" placeholder=" " />
            <label for="instrumentalness" class="placeholder">INSTRUMENTALNESS</label>
        </div>
        <div class="input-container ic1">
            <input id="liveness" class="input" type="text" placeholder=" " />
            <label for="liveness" class="placeholder">LIVENESS</label>
        </div>
        <div class="input-container ic1">
            <input id="speechiness" class="input" type="text" placeholder=" " />
            <label for="speechiness" class="placeholder">SPEECHINESS</label>
        </div>
        <button type="submit" class="submit">Submit</button>
    </form>
</div>
</body>
</html>
