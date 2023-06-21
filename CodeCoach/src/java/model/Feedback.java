/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Duy Thai
 */
public class Feedback {


    private int feedbackId;
    private int userId;
    private int mentorId;
    private int bookingId;
    private int rating;
    private String reviewText;
    private String reviewDateTime;
    private String reviewerName; // Added reviewerName field

    public Feedback() {
    }

    public Feedback(int feedbackId, int userId, int mentorId, int bookingId, int rating, String reviewText, String reviewDateTime) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.mentorId = mentorId;
        this.bookingId = bookingId;
        this.rating = rating;
        this.reviewText = reviewText;
        this.reviewDateTime = reviewDateTime;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "feedbackId=" + feedbackId +
                ", userId=" + userId +
                ", mentorId=" + mentorId +
                ", bookingId=" + bookingId +
                ", rating=" + rating +
                ", reviewText='" + reviewText + '\'' +
                ", reviewDateTime='" + reviewDateTime + '\'' +
                ", reviewerName='" + reviewerName + '\'' +
                '}';
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMentorId() {
        return mentorId;
    }

    public void setMentorId(int mentorId) {
        this.mentorId = mentorId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getReviewDateTime() {
        return reviewDateTime;
    }

    public void setReviewDateTime(String reviewDateTime) {
        this.reviewDateTime = reviewDateTime;
    }

    public String getReviewerName() {
        return reviewerName;
    }

    public void setReviewerName(String reviewerName) {
        this.reviewerName = reviewerName;
    }
}
