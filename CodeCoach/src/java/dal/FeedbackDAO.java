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
        String query = "Select f.feedbackId, f.menteeId, f.mentorId, u.userId, u.fName, u.lName, f.rating, f.reviewText, CONVERT(date, reviewDateTime, 112) AS reviewDate\n" +
                       "From Feedback f join Mentees m on f.menteeId = m.menteeId join Users u on m.userId = u.userId\n" +
                        "where mentorId = ? ";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, revMentorId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Object[] feedbackInfo = new Object[9];
                feedbackInfo[0] = rs.getInt("feedbackId");
                feedbackInfo[1] = rs.getInt("menteeId");
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

    public static void main(String[] args) {
        MentorDAO mentorDao = new MentorDAO();
        FeedbackDAO dao= new FeedbackDAO();
        // Get the userId from the session or request parameters
            int userId = 2;
            
            // Get the mentorId associated with the userId
            int mentorId = mentorDao.getMentorIdByUserId(userId, 0);
             // Get the feedback for the mentor
        List<Object> feedbackList = dao.getAllFeedbackOfMentor(mentorId);
        
        for (Object feedback : feedbackList) {
            System.out.println(feedback.toString());
        }
    }
    
}
