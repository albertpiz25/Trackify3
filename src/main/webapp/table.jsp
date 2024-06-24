<%@ page import="model.Song" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <a href="insertData.jsp"><button class="primary" title="Add New Data">Add New Data</button></a>
        <button class="danger" title="Delete Selected" onclick="submitDelate()" >Delete Selected</button>
    </div>
    <div class="table-concept">
        <form id="deleteForm" action="Servlet_Delate" method="post">
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
                <%
                    if (request.getAttribute("songList") != null) {
                        List<Song> songList = (List<Song>) request.getAttribute("songList");
                        for (Song song : songList) {
                %>
                <tr>
                    <td><input type="checkbox" name="selectedIds" value="<%=song.getId()%>"></td>
                    <td><%= song.getId() %></td>
                    <td><%= song.getTrackName() %></td>
                    <td><%= song.getArtistName() %></td>
                    <td><%= song.getStreams() %></td>
                    <td><%= String.format("%.3f",song.getAcousticness()) %></td>
                    <td><%= String.format("%.3f",song.getDanceability()) %></td>
                    <td><%= String.format("%.3f",song.getEnergy()) %></td>
                    <td><%= String.format("%.3f",song.getInstrumentalness()) %></td>
                    <td><%= String.format("%.3f",song.getLiveness()) %></td>
                    <td><%= String.format("%.3f",song.getSpeechiness()) %></td>
                    <td><%= String.format("%.3f",song.getValence()) %></td>
                    <td>
                        <a href="update.jsp?songId=<%= song.getId() %>">Edit</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </form>
        <div class="pagination">
            <button id="prev-page" class="freccSX" > < </button>
            <span id="page-info">Pagina <span id="curp"></span> di <span id="totp"></span></span>
            <button id="next-page" class="freccDX" > > </button>
        </div>
    </div>
</div>

<script>
    const itemsPerPage = 10; // Numero di elementi per pagina
    let currentPage = 1;

    function displayTablePage(page) {
        const tableRows = document.querySelectorAll('#table-body tr');
        const startIdx = (page - 1) * itemsPerPage;
        const endIdx = startIdx + itemsPerPage;

        tableRows.forEach((row, index) => {
            if (index >= startIdx && index < endIdx) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });

        const totalPages = Math.ceil(tableRows.length / itemsPerPage);
        document.getElementById('curp').innerText = page;
        document.getElementById('totp').innerText = totalPages
        //document.getElementById('page-info').innerText = 'Pagina ${page} di ${totalPages}';
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            displayTablePage(currentPage);
        }
    }

    function nextPage() {
        const tableRows = document.querySelectorAll('#table-body tr');
        const totalPages = Math.ceil(tableRows.length / itemsPerPage);
        if (currentPage < totalPages) {
            currentPage++;
            displayTablePage(currentPage);
        }
    }

    function submitDelate(){
        document.getElementById('deleteForm').submit();
    }

    // Mostra la prima pagina al caricamento
    displayTablePage(currentPage);

    // Aggiungi gestori di eventi ai pulsanti di navigazione
    document.getElementById('prev-page').addEventListener('click', prevPage);
    document.getElementById('next-page').addEventListener('click', nextPage);
</script>

</body>
</html>
