<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cerca</title>
    <link rel="stylesheet" href="Styles/cerca.css">
</head>
<body>

<div class="card">

    <div class="searchBox">

        <input class="searchInput"type="text" name="" placeholder="Search">
        <button class="searchButton" href="#">
            <i class="material-icons">
                search
            </i>
        </button>
    </div>

    <div class="table-title">
        <h2>Music Data Table</h2>
    </div>
    <div class="button-container">
        <a href="results/insertData.jsp"><button class="primary" title="Add New Data">Add New Data</button></a>
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
                        <a href="update.jsp?song=<%= song %>"><button class="edit" title="Edit">Edit</button></a>
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
