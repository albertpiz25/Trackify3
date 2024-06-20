<%@ page import="model.Song" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Data Table</title>
    <link rel="stylesheet" type="text/css" href="Styles/table.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .card {
            padding: 20px;
            margin: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .table-title {
            margin-bottom: 20px;
        }
        .button-container {
            margin-bottom: 20px;
        }
        .button-container span {
            margin-right: 10px;
        }
        .button-container button {
            margin-right: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        .pagination {
            margin-top: 20px;
        }
        .pagination label {
            margin-right: 5px;
            cursor: pointer;
        }
        .pagination .disabled {
            cursor: not-allowed;
            color: grey;
        }
        .pagination .active {
            font-weight: bold;
        }
        input[type="radio"].table-radio {
            display: none;
        }
        input[type="radio"].table-radio:not(:checked) ~ .table-display,
        input[type="radio"].table-radio:not(:checked) ~ table,
        input[type="radio"].table-radio:not(:checked) ~ .pagination {
            display: none;
        }
    </style>
</head>
<body>

<div class="card">
    <div class="table-title">
        <h2>Music Data Table</h2>
    </div>
    <div class="button-container">
        <a href="results/insertData.jsp"><button class="primary" title="Add New Data"></button></a>
        <button class="danger" title="Delete Selected"></button>
    </div>
    <div class="table-concept">
        <!-- Table display -->
        <table id="music-table">
            <thead>
            <tr>
                <th>Select</th>
                <th>Id</th>
                <th>Track_Name</th>
                <th>Artist_Name</th>
                <th>Streams</th>
                <th>Acousticness</th>
                <th>Danceability</th>
                <th>Energy</th>
                <th>Instrumentalness</th>
                <th>Liveness</th>
                <th>Speechiness</th>
                <th>Valence</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="table-body">
            <% if (request.getAttribute("songList") != null) {
                List<Song> songs = (List<Song>) request.getAttribute("songList");
                for (Song song : songs) { %>
            <tr>
                <td><input type="checkbox"></td>
                <td><%= song.getId() %></td>
                <td><%= song.getTrackName() %></td>
                <td><%= song.getArtistName() %></td>
                <td><%= song.getStreams() %></td>
                <td><%= song.getAcousticness() %></td>
                <td><%= song.getDanceability() %></td>
                <td><%= song.getEnergy() %></td>
                <td><%= song.getInstrumentalness() %></td>
                <td><%= song.getLiveness() %></td>
                <td><%= song.getSpeechiness() %></td>
                <td><%= song.getValence() %></td>
                <td>
                    <a href="results/update.jsp?id=<%= song.getId() %>"><button class="edit" title="Edit">Edit</button></a>
                </td>
            </tr>
            <%     }
            } %>
            </tbody>
        </table>
        <div class="pagination">
            <button id="prev-page" class="freccSX" onclick="prevPage()"> < </button>
            <span id="page-info">Pagina 1 di 5</span>
            <button id="next-page" class="freccDX" onclick="nextPage()"> > </button>
        </div>
    </div>
</div>

<script>
    <%
    if (request.getAttribute("songList") != null) {
                List<Song> songs = (List<Song>) request.getAttribute("songList");
    %> // Inizializza songs con la lista di canzoni ottenuta dalla servlet
    const nsongs = <%=songs.size()%>;
    let currentPage = 1;
    const itemsPerPage = 20;

    function displayTablePage(page) {
        const tableBody = document.getElementById('table-body');
        tableBody.innerHTML = '';

        const startIndex = (page - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;
        const pageData = songs.slice(startIndex, endIndex);
        <%for (Song song : songs) { %>
            const row = document.createElement('tr');
            row.innerHTML = `
                <td><input type="checkbox"></td>
                <td><%= song.getId() %></td>
                <td><%= song.getTrackName() %></td>
                <td><%= song.getArtistName() %></td>
                <td><%= song.getStreams() %></td>
                <td><%= song.getAcousticness() %></td>
                <td><%= song.getDanceability() %></td>
                <td><%= song.getEnergy() %></td>
                <td><%= song.getInstrumentalness() %></td>
                <td><%= song.getLiveness() %></td>
                <td><%= song.getSpeechiness() %></td>
                <td><%= song.getValence() %></td>
                <td>
                    <a href="results/update.jsp?id=<%= song.getId() %>"><button class="edit" title="Edit">Edit</button></a>
                </td>
            `;
            tableBody.appendChild(row);
        <%}%>
        const totalPages = Math.ceil(nsongs / itemsPerPage);
        document.getElementById('page-info').innerText = `Pagina ${page} di ${totalPages}`;
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            displayTablePage(currentPage);
        }
    }

    function nextPage() {
        const totalPages = Math.ceil(songs.length / itemsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            displayTablePage(currentPage);
        }
    }

    // Visualizza la prima pagina al caricamento
    displayTablePage(currentPage);
</script>
</body>
</html>