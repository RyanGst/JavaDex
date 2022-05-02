package com.trabalho.trabalho.dao;

import com.trabalho.trabalho.bean.Team;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeamDao {
    private static final String url = "jdbc:postgresql://localhost:5432/javadex";
    private static final String user = "postgres";
    private static final String password = "0101";


    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }

        return connection;
    }

    public static List<Team> getTeams() {
        List<Team> list = new ArrayList<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM teams");
            ResultSet result = ps.executeQuery();

            while (result.next()) {
                Team team = new Team();
                team.setId(result.getInt("id"));
                team.setTitle(result.getString("title"));
                team.setGame(result.getString("game"));

                list.add(team);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    public static Team getTeamById(int id) {
        Team team = null;

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM teams WHERE id=?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();

            while (result.next()) {
                team = new Team();
                team.setId(result.getInt("id"));
                team.setTitle(result.getString("title"));
                team.setGame(result.getString("game"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return team;
    }


    public static Team createTeam(Team team) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO teams(title, game) VALUES (?, ?);");
            ps.setString(1, team.getTitle());
            ps.setString(2, team.getGame());
            ResultSet result = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return team;
    }


    public static int updateTeam(Team team) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE teams SET title=?, game=? WHERE id=?");
            ps.setString(1, team.getTitle());
            ps.setString(2, team.getGame());
            ps.setInt(3, team.getId());
            System.out.println(ps.toString());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return status;
    }

    public static void deleteTeam(int id) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM teams WHERE id=?");
            ps.setInt(1, id);
            ResultSet result = ps.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
