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

    public List<Feedback> getAllFeedback() {
        List<Feedback> feedbackList = new ArrayList<>();
        String query = "SELECT f.feedbackId, f.userId, f.mentorId, u.fName, u.lName, f.reviewText, f.reviewDateTime "
                + "FROM Feedback f "
                + "JOIN Users u ON f.userId = u.userId";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                int userId = rs.getInt("userId");
                int mentorId = rs.getInt("mentorId");
                String reviewerName = rs.getString("fName");
                String reviewText = rs.getString("reviewText");
                String reviewDateTime = rs.getString("reviewDateTime");

                Feedback feedback = new Feedback(feedbackId, userId, mentorId, 0, 0, reviewText, reviewDateTime);
                feedback.setReviewerName(reviewerName); // Assuming you add a setter method for reviewerName in the Feedback class
                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return feedbackList;
    }

    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
