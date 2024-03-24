package service;

import model.User;

import java.util.HashMap;
import java.util.Objects;

public class AuthService
{
    private static HashMap<String, User> Users = new HashMap<>()
    {
        {
            put("admin", new User("admin", "123", "baobab@mail.ru"));
            put("anonimus228", new User("anonimus228", "87654321", "anonimus228@mail.ru"));
            put("test", new User("test", "123", "test@mail.ru"));
        }
    };
    public static  void CreateUser(User user)
    {
        Users.put(user.getLogin(), user);
    }
    public static User GetUser(String login, String password)
    {
        User user = Users.get(login);

        if( user == null || !Objects.equals(user.getPassword(), password)) return null;

        return user;
    }
}
