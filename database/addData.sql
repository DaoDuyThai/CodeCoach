-- Insert data into UserStatus table
INSERT INTO UserStatus (statusName)
VALUES
  ('Active'),
  ('Unverified'),
  ('Locked');

-- Insert data into Roles table
INSERT INTO Roles (roleName)
VALUES
  ('Admin'),
  ('Mentor'),
  ('Mentee');

-- Insert data into Users table
INSERT INTO Users (email, password, fName, lName, gender, phoneNum, roleId, statusId, address, maqh, facebook)
VALUES
  ('admin@admin.com','123456' , 'Admin', 'User', 'Male', '123456', 1, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/'),
  ('mentor@mentor.com','123456', 'Mentor', 'User', 'Male', '234567', 2, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/'),
  ('mentee@mentee.com','123456', 'Mentee', 'User', 'Male', '345678', 3, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/'),
  ('thaiddhe176315@fpt.edu.vn','123456', N'Đào', N'Duy Thái', 'Male', '0796428094', 2, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/');

-- Insert data into Categories table
INSERT INTO Categories (categoryName) VALUES
('Web Development'),
('Mobile Development'),
('Database Administration'),
('Programming Languages'),
('Data Science and Analytics');

-- Insert data into SubCategories table
INSERT INTO Subcategories (CategoryId, subCategoryName) VALUES
(1, 'Front-end Development'),
(1, 'Back-end Development'),
(1, 'Full-stack Development'),
(2, 'iOS Development'),
(2, 'Android Development'),
(3, 'SQL Server'),
(3, 'Oracle Database'),
(3, 'MySQL'),
(4, 'Java'),
(4, 'Python'),
(4, 'C++'),
(5, 'Machine Learning'),
(5, 'Big Data Analytics');

-- Insert data into Skills table
INSERT INTO Skills (skillName, subCategoryId)
VALUES
  ('HTML', 1),
  ('CSS', 1),
  ('JavaScript', 1),
  ('Node.js', 2),
  ('Express.js', 2),
  ('React.js', 1),
  ('React Native', 2),
  ('iOS Development', 4),
  ('Android Development', 5),
  ('SQL Server', 6),
  ('Oracle Database', 7),
  ('MySQL', 8),
  ('Java', 9),
  ('Python', 10),
  ('C++', 11),
  ('Machine Learning', 12),
  ('Big Data Analytics', 13),
   ('PHP', 1),
  ('ASP.NET', 2),
  ('Swift', 4),
  ('Kotlin', 5),
  ('MongoDB', 3),
  ('PostgreSQL', 3),
  ('Ruby', 4),
  ('R', 5),
  ('Go', 6),
  ('TensorFlow', 5);

  -- Insert data into Mentors table
INSERT INTO Mentors (userId, bio, hourlyRate)
VALUES
  (2, 'I am really good at Java and Python', 450000),
  (4, 'I am expert at React and NodeJS', 500000);

  -- Insert data into Experience table
  INSERT INTO Experience (mentorId, description)
VALUES
  (1, 'Worked as a Java developer for 5 years'),
  (2, 'Developed Python applications for various clients');

  -- Insert data into Expertise table
  INSERT INTO Expertise (mentorId, skillId)
VALUES
  (1, 13),
  (1, 14),
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4),
  (2, 5),
  (2, 6),
  (2, 12),
  (2, 22);

  -- Insert data into Mentees table
INSERT INTO Mentees (userId)
VALUES
  (3);

  -- Insert data into MenteeInterests table
INSERT INTO MenteeInterests (menteeId, skillId, categoryId, subCategoryId)
VALUES
  (1, 3, 2, 3);

  -- Insert data into Slot table
INSERT INTO Slot (startTime, endTime)
VALUES
  ('08:00', '10:00'),
  ('10:00', '12:00'),
  ('13:00', '15:00'),
  ('15:00', '17:00'),
  ('17:00', '19:00'),
  ('19:00', '21:00'),
  ('21:00', '23:00');

  -- Insert data into Booking table
INSERT INTO Booking (mentorId, menteeId, skillId, status)
VALUES
  (1, 1, 13, 'Accepted'),
  (1, 1, 14, 'Pending'),
  (2, 1, 1, 'Accepted'),
  (2, 1, 2, 'Rejected'),
  (2, 1, 3, 'Pending');

  -- Insert data into BookingDetails table
INSERT INTO BookingDetails (bookingId, slotId, date)
VALUES
  (1, 1, '2023-05-01'),
  (2, 2, '2023-05-03'),
  (3, 3, '2023-05-05'),
  (4, 3, '2023-05-06'),
  (5, 3, '2023-05-06');

  -- Insert data into Feedback table
INSERT INTO Feedback (menteeId, mentorId, bookingId, rating, reviewText, reviewDateTime)
VALUES
  (1, 1, 1, 5, 'Great mentor!', GETDATE());

  -- Insert data into Notifications table
INSERT INTO Notifications (userId, bookingId, content, dateTime, type, status)
VALUES
  (1, 1, 'New booking request', GETDATE(), 'Booking', 'Pending');

  -- Insert data into ChatRoom table
INSERT INTO ChatRoom (chatRoomName)
VALUES
  ('General Chat'),
  ('Mentors Chat'),
  ('Mentees Chat');


  -- Insert data into ChatRoomUsers table
INSERT INTO ChatRoomUsers (chatRoomId, userId)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 2),
  (3, 1),
  (3, 3);

  
-- Insert data into ChatMessages table
INSERT INTO ChatMessages (chatRoomId, userId, message, sentDateTime)
VALUES
  (1, 1, 'Hello everyone!', GETDATE()),
  (1, 2, 'Hi there!', GETDATE());