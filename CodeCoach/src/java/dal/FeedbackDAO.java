package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;

public class FeedbackDAO extends DBContext {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    //Use mentorId to get their feedback
    public List<Object> getAllFeedbackOfMentor(int revMentorId) {
        List<Object> feedbackList = new ArrayList<>();
        String query = "Select f.feedbackId, f.mentorId, f.userId, u.fName, u.lName, f.rating, f.reviewText, CONVERT(date, reviewDateTime, 112) AS reviewDate\n"
                + "From Feedback f join Users u on f.userId = u.userId\n"
                + "where mentorId = ? ";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, revMentorId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Object[] feedbackInfo = new Object[9];
                feedbackInfo[0] = rs.getInt("feedbackId");
                feedbackInfo[2] = rs.getInt("mentorId");
                feedbackInfo[3] = rs.getInt("userId");
                feedbackInfo[4] = rs.getString("fName");
                feedbackInfo[5] = rs.getString("lName");
                feedbackInfo[6] = rs.getString("rating");
                feedbackInfo[7] = rs.getString("reviewText");
                feedbackInfo[8] = rs.getString("reviewDate");
                feedbackList.add(feedbackInfo);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbackList;
    }

}


