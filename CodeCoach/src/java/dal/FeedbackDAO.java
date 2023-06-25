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
    public List<Object[]> getAllFeedbackOfMentor(int revMentorId) {
        List<Object[]> feedbackList = new ArrayList<>();
        String query = "SELECT f.feedbackId, u.userId, f.mentorId, u.fName, u.lName, f.rating, f.reviewText, CONVERT(date, reviewDateTime, 112) AS reviewDate "
                + "FROM Feedback f "
                + "JOIN Users u ON f.userId = u.userId where mentorId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, revMentorId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Object[] feedbackInfo = new Object[8];
                feedbackInfo[0] = rs.getInt("feedbackId");
                feedbackInfo[1] = rs.getInt("userId");
                feedbackInfo[2] = rs.getInt("mentorId");
                feedbackInfo[3] = rs.getString("fName");
                feedbackInfo[4] = rs.getString("lName");
                feedbackInfo[5] = rs.getInt("rating");
                feedbackInfo[6] = rs.getString("reviewText");
                feedbackInfo[7] = rs.getString("reviewDate");
                feedbackList.add(feedbackInfo);
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbackList;
    }

    public static void main(String[] args) {
        MentorDAO mentorDao = new MentorDAO();
        FeedbackDAO dao= new FeedbackDAO();
        // Get the userId from the session or request parameters
            int userId = 2;
            
            // Get the mentorId associated with the userId
            int mentorId = mentorDao.getMentorIdByUserId(userId, 0);
             // Get the feedback for the mentor
        List<Object[]> feedbackList = dao.getAllFeedbackOfMentor(mentorId);
        
         for (Object[] feedback : feedbackList) {
        int feedbackId = (int) feedback[0];
        int ruserId = (int) feedback[1];
        int rmentorId = (int) feedback[2];
        String fName = (String) feedback[3];
        String lName = (String) feedback[4];
        int rating = (int) feedback[5];
        String reviewText = (String) feedback[6];
        String reviewDate = (String) feedback[7];
        
        System.out.println("Feedback ID: " + feedbackId);
        System.out.println("User ID: " + ruserId);
        System.out.println("Mentor ID: " + rmentorId);
        System.out.println("Reviewer Name: " + fName + " " + lName);
        System.out.println("Rating: " + rating);
        System.out.println("Review Text: " + reviewText);
        System.out.println("Review Date: " + reviewDate);
        System.out.println();
    }
    
}
}
