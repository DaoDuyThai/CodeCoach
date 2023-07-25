package dal;

import model.MenteeInterests;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MenteeInterestDAO extends DBContext{

    private static final String ADD_INTEREST_SQL = "INSERT INTO MenteeInterests(menteeId, skillId) VALUES (?, ?);";

    private static final String GET_INTEREST_BY_USERID_SQL = "SELECT mi.*\n" +
            "FROM MenteeInterests mi\n" +
            "         JOIN Mentees m ON mi.menteeId = m.menteeId\n" +
            "         JOIN Users u ON m.userId = u.userId\n" +
            "WHERE u.userId = ?;";

    private static final String GET_ALL_INTERESTS_SQL = "SELECT * FROM MenteeInterests";

    private static final String REMOVE_INTEREST_SQL = "DELETE FROM MenteeInterests WHERE menteeInterestId = ?;";

    public int removeInterest(int menteeInterestID){
        try (PreparedStatement preparedStatement = getConnection().prepareStatement(REMOVE_INTEREST_SQL)) {
            preparedStatement.setInt(1, menteeInterestID);
            return preparedStatement.executeUpdate();
        }catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public int addInterest(MenteeInterests menteeInterests){
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_INTEREST_SQL);
            preparedStatement.setInt(1, menteeInterests.getMenteeId());
            preparedStatement.setInt(2, menteeInterests.getSkillId());
            return preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public ArrayList<MenteeInterests> getAllInterests(){
        ArrayList<MenteeInterests> menteeInterests = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_INTERESTS_SQL);
            return getMenteeInterests(menteeInterests, preparedStatement);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private ArrayList<MenteeInterests> getMenteeInterests(ArrayList<MenteeInterests> menteeInterests, PreparedStatement preparedStatement) throws SQLException {
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()){
            MenteeInterests menteeInterest = new MenteeInterests();
            menteeInterest.setMenteeInterestId(rs.getInt("menteeInterestId"));
            menteeInterest.setSkillId(rs.getInt("skillId"));
            menteeInterests.add(menteeInterest);
        }
        return menteeInterests;
    }

    public ArrayList<MenteeInterests> getMenteeInterestsByUserId(int userID){
        ArrayList<MenteeInterests> menteeInterests = new ArrayList<>();
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_INTEREST_BY_USERID_SQL);
            preparedStatement.setInt(1, userID);
            return getMenteeInterests(menteeInterests, preparedStatement);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
}
