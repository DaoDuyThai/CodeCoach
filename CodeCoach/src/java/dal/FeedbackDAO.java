package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Feedback;
import org.eclipse.jdt.internal.compiler.batch.Main;

public class FeedbackDAO extends DBContext {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    //Use mentorId to get their feedback
    public List<Feedback> getAllFeedbackOfMentor(int revMentorId) {
        List<Feedback> feedbackList = new ArrayList<>();
        String query = "SELECT f.feedbackId, f.userId, f.mentorId, u.fName, u.lName, f.bookingId, f.rating, f.reviewText, f.reviewDateTime "
                + "FROM Feedback f "
                + "JOIN Users u ON f.userId = u.userId where mentorId = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, revMentorId);
            rs = ps.executeQuery();

            while (rs.next()) {
                int feedbackId = rs.getInt("feedbackId");
                int userId = rs.getInt("userId");
                int mentorId = rs.getInt("mentorId");
                String reviewerName = rs.getString("fName");
                int bookingId = rs.getInt("bookingId");
                int rating = rs.getInt("rating");
                String reviewText = rs.getString("reviewText");
                String reviewDateTime = rs.getString("reviewDateTime");

                Feedback feedback = new Feedback(feedbackId, userId, mentorId, bookingId, rating, reviewText, reviewDateTime);
                feedback.setReviewerName(reviewerName);
                feedbackList.add(feedback);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbackList;
    }

    public static void main(String[] args) {
        FeedbackDAO dao= new FeedbackDAO();
        List<Feedback> feedbackList = dao.getAllFeedbackOfMentor(1);
        
        for (Feedback feedback : feedbackList) {
            System.out.println("Reviewer Name: " + feedback.getReviewerName());
            System.out.println("Review Date/Time: " + feedback.getReviewDateTime());
            System.out.println("Rating: " + feedback.getRating());
            System.out.println("Review Text: " + feedback.getReviewText());
            System.out.println();
        }
    }
    
}
