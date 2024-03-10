package org.example;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.FileManager;
import java.io.*;

@WebServlet(urlPatterns = {"/Manager"})
public class MainServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        FileManager fileManager = new FileManager();
        File[] folders = fileManager.allFolders(request.getParameter("path"));//все папки по пути <_<
        if (folders == null) {
            folders = new File[0];
        }

        File[] files = fileManager.allFiles(request.getParameter("path"));//все файлы по пути -_-
        if (files == null) {
            files = new File[0];
        }

        request.setAttribute("folders", folders);//задаю атрибут запросу...и присвоил массив
        request.setAttribute("files", files);//и тута тоже
        request.getRequestDispatcher("Manager.jsp").forward(request, response);//попросил Manager.jsp обработать запросек

    }

    public void destroy() {
    }
}
