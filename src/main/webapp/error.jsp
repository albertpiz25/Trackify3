<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="Styles/error.css">
</head>
<body>
<div class="logoContainer">
    <img class="logo" src="image/logo1.png" style="width: 500px">
</div>
<div class="hamburger-menu">
    <button class="burger" data-state="closed">
        <span></span>
        <span></span>
        <span></span>
    </button>
</div>
<nav data-state="closed">
    <ul>
        <li>
            <a href="./Servlet_Visualizza_Tabella?query=1">Successi in Ascolto</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=2">Momenti di Gioia</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=3">Acustiche e Intime</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=4">Ritmo e Movimento</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=5">Energia in Piena Fase</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=6">Viaggi Strumentali</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=7">Canzoni da Palco</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=8">Poesie Sonore</a>
        </li>
        <li>
            <a href="Servlet_Visualizza_Tabella?query=9">Esplora Brani</a>
        </li>
    </ul>
</nav>

<div class="image-container">
    <img src="./image/error.png">
    <a href="index.jsp">
        <button type="submit" class="submit">HOME</button></a>
</div>


<main>
    <div class="container">
        <!-- SVG content goes here -->
    </div>
</main>

<script>
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('nav');

    burger.addEventListener('click', () => {
        const isOpen = burger.getAttribute('data-state') === 'open';
        burger.setAttribute('data-state', isOpen ? 'closed' : 'open');
        nav.setAttribute('data-state', isOpen ? 'closed' : 'open');
    });

</script>
</body>
</html>


