<%--
  Created by IntelliJ IDEA.
  User: mihail
  Date: 03.03.2024
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String directory = request.getParameter("path").replace("\\","/");
    File file = new File(directory);
    String parentDirectoryPath = "/";


    parentDirectoryPath = file.getParent();  // Получаем путь к родительской директории
    String login =(String) request.getAttribute("login");
    if (parentDirectoryPath == null || parentDirectoryPath.length() < ("D:\\dev\\Java_dev\\Java\\2sem_Spring\\Lab5\\".length() + login.length())) {
        parentDirectoryPath = "D:\\dev\\Java_dev\\Java\\2sem_Spring\\Lab5\\"+request.getAttribute("login");
    }


%>
<html>
<head>
    <title>Менеджер файлов</title>
</head>
<body>
<h1>Текущая директория: "<%=(String) request.getAttribute("currentPath")%> "</h1>
<a href=<%="?path="+parentDirectoryPath.replace("\\","/")%>>Назад</a>
<table>
    <tr>
        <th>Папка</th>
        <th>Перейти</th>
        <th>Размер(байты)</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] itemList = (File[]) request.getAttribute("folders"); // Получаем список из объекта запроса
        for (File item : itemList) {
    %>
    <tr>
        <th><%= item.getName()%></th>
        <th><a href=<%="?path="+item.getAbsolutePath().replace("\\", "/")%>/>Перейти</th>


        <th><%= item.length()%></th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
    <tr>
        <th>Файл</th>
        <th>Ссылка на скачивание</th>
        <th>Размер(байты)</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] list = (File[]) request.getAttribute("files"); // Получаем список из объекта запроса
        for (File item : list) {
    %>
    <tr>
        <th><%= item.getName()%></th>

        <th><a href=<%="http://localhost:8080/Lab3_JAVA_2semWeb_war_exploded/Download?path="+ item.getAbsolutePath().replace("\\","/")%>> Скачать </a> </th>
        <th><%= item.length()%></th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
</table>
<p>
<form action="Manager" method="POST">
    <input type="submit" value="Выйти">
</form>
</p>
</body>
</html>
