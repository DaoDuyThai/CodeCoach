package dal;

import model.Notifications;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private static final String ADD_NOTIFICATION = "INSERT INTO Notifications (userId, bookingId, content, dateTime, type, status) VALUES (?,?,?,?,?,?)";

    public void addNotification(Notifications notifications) {
        try ( Connection conn = new DBContext().getConnection();  PreparedStatement ps = conn.prepareStatement(ADD_NOTIFICATION)) {
            ps.setInt(1, notifications.getUserId());
            ps.setInt(2, notifications.getBookingId());
            ps.setString(3, notifications.getContent());
            ps.setString(4, notifications.getDateTime());
            ps.setString(5, notifications.getType());
            ps.setString(6, notifications.getStatus());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Notifications> getNotificationbyUserId(String userId) {
        List<Notifications> listNotifications = new ArrayList<>();
        String querry = "select * from Notifications Where userId=" + userId + "";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(querry);
            rs = ps.executeQuery();
            while (rs.next()) {
                listNotifications.add(new Notifications(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }

        return listNotifications;
    }
}
