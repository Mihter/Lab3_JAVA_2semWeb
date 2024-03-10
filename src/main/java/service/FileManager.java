package service;

import java.io.File;
public class FileManager {
    //папки
    public File[] allFolders(String path) {
        File directory = new File(path);
        return directory.listFiles(File::isDirectory);//передал ссылку на метод isDirectory() чтоб он проверил папка ли
    }
    //файлы
    public File[] allFiles(String path) {
        File directory = new File(path);
        return directory.listFiles(File::isFile);//а здесь проверил файл ли это ну и конечно там и там вернул что надо
    }
}