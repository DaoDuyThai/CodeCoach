USE [master]
GO
/****** Object:  Database [CodeCoach]    Script Date: 21/05/2023 10:08:42 pm ******/
CREATE DATABASE [CodeCoach]
GO
ALTER DATABASE [CodeCoach] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodeCoach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodeCoach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodeCoach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodeCoach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodeCoach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodeCoach] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodeCoach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CodeCoach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodeCoach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodeCoach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodeCoach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CodeCoach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodeCoach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodeCoach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodeCoach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodeCoach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CodeCoach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodeCoach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodeCoach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodeCoach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CodeCoach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodeCoach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CodeCoach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodeCoach] SET RECOVERY FULL 
GO
ALTER DATABASE [CodeCoach] SET  MULTI_USER 
GO
ALTER DATABASE [CodeCoach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CodeCoach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodeCoach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CodeCoach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CodeCoach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CodeCoach] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CodeCoach', N'ON'
GO
ALTER DATABASE [CodeCoach] SET QUERY_STORE = OFF
GO
USE [CodeCoach]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[bookingId] [int] IDENTITY(1,1) NOT NULL,
	[mentorId] [int] NOT NULL,
	[menteeId] [int] NOT NULL,
	[skillId] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[bookingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[bookingId] [int] NULL,
	[slotId] [int] NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[chatMessagesId] [int] IDENTITY(1,1) NOT NULL,
	[chatRoomId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[message] [varchar](max) NOT NULL,
	[sentDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[chatMessagesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatRoom]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatRoom](
	[chatRoomId] [int] IDENTITY(1,1) NOT NULL,
	[chatRoomName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[chatRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatRoomUsers]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatRoomUsers](
	[chatRoomId] [int] NOT NULL,
	[userId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Experience]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Experience](
	[experienceId] [int] IDENTITY(1,1) NOT NULL,
	[mentorId] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[experienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expertise]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expertise](
	[expertiseId] [int] IDENTITY(1,1) NOT NULL,
	[mentorId] [int] NOT NULL,
	[skillId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[expertiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
	[menteeId] [int] NOT NULL,
	[mentorId] [int] NOT NULL,
	[bookingId] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[reviewText] [varchar](max) NOT NULL,
	[reviewDateTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenteeInterests]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenteeInterests](
	[menteeInterestId] [int] IDENTITY(1,1) NOT NULL,
	[menteeId] [int] NOT NULL,
	[categoryId] [int] NULL,
	[subCategoryId] [int] NULL,
	[skillId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[menteeInterestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentees]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentees](
	[menteeId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[menteeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentors]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentors](
	[mentorId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[bio] [varchar](max) NOT NULL,
	[hourlyRate] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mentorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[notificationId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[bookingId] [int] NOT NULL,
	[content] [varchar](max) NOT NULL,
	[dateTime] [datetime] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[notificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quanhuyen]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quanhuyen](
	[maqh] [varchar](5) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[type] [nvarchar](30) NOT NULL,
	[mattp] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maqh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[skillId] [int] IDENTITY(1,1) NOT NULL,
	[skillName] [varchar](50) NOT NULL,
	[subCategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[skillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[slotId] [int] IDENTITY(1,1) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[slotId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[subCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[subCategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tinhthanhpho]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tinhthanhpho](
	[mattp] [varchar](5) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[type] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mattp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fName] [varchar](50) NOT NULL,
	[lName] [varchar](50) NOT NULL,
	[gender] [varchar](10) NOT NULL,
	[phoneNum] [varchar](20) NOT NULL,
	[roleId] [int] NOT NULL,
	[statusId] [int] NOT NULL,
	[address] [varchar](100) NULL,
	[maqh] [varchar](5) NOT NULL,
	[facebook] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 21/05/2023 10:08:42 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[statusID] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 
GO
INSERT [dbo].[Booking] ([bookingId], [mentorId], [menteeId], [skillId], [status]) VALUES (1, 1, 1, 13, N'Accepted')
GO
INSERT [dbo].[Booking] ([bookingId], [mentorId], [menteeId], [skillId], [status]) VALUES (2, 1, 1, 14, N'Pending')
GO
INSERT [dbo].[Booking] ([bookingId], [mentorId], [menteeId], [skillId], [status]) VALUES (3, 2, 1, 1, N'Accepted')
GO
INSERT [dbo].[Booking] ([bookingId], [mentorId], [menteeId], [skillId], [status]) VALUES (4, 2, 1, 2, N'Rejected')
GO
INSERT [dbo].[Booking] ([bookingId], [mentorId], [menteeId], [skillId], [status]) VALUES (5, 2, 1, 3, N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[BookingDetails] ON 
GO
INSERT [dbo].[BookingDetails] ([bookingDetailId], [bookingId], [slotId], [date]) VALUES (1, 1, 1, CAST(N'2023-05-01' AS Date))
GO
INSERT [dbo].[BookingDetails] ([bookingDetailId], [bookingId], [slotId], [date]) VALUES (2, 2, 2, CAST(N'2023-05-03' AS Date))
GO
INSERT [dbo].[BookingDetails] ([bookingDetailId], [bookingId], [slotId], [date]) VALUES (3, 3, 3, CAST(N'2023-05-05' AS Date))
GO
INSERT [dbo].[BookingDetails] ([bookingDetailId], [bookingId], [slotId], [date]) VALUES (4, 4, 3, CAST(N'2023-05-06' AS Date))
GO
INSERT [dbo].[BookingDetails] ([bookingDetailId], [bookingId], [slotId], [date]) VALUES (5, 5, 3, CAST(N'2023-05-06' AS Date))
GO
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (1, N'Web Development')
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (2, N'Mobile Development')
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (3, N'Database Administration')
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (4, N'Programming Languages')
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName]) VALUES (5, N'Data Science and Analytics')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatMessages] ON 
GO
INSERT [dbo].[ChatMessages] ([chatMessagesId], [chatRoomId], [userId], [message], [sentDateTime]) VALUES (1, 1, 1, N'Hello everyone!', CAST(N'2023-05-21T22:08:07.267' AS DateTime))
GO
INSERT [dbo].[ChatMessages] ([chatMessagesId], [chatRoomId], [userId], [message], [sentDateTime]) VALUES (2, 1, 2, N'Hi there!', CAST(N'2023-05-21T22:08:07.267' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ChatMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatRoom] ON 
GO
INSERT [dbo].[ChatRoom] ([chatRoomId], [chatRoomName]) VALUES (1, N'General Chat')
GO
INSERT [dbo].[ChatRoom] ([chatRoomId], [chatRoomName]) VALUES (2, N'Mentors Chat')
GO
INSERT [dbo].[ChatRoom] ([chatRoomId], [chatRoomName]) VALUES (3, N'Mentees Chat')
GO
SET IDENTITY_INSERT [dbo].[ChatRoom] OFF
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (1, 1)
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (1, 2)
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (1, 3)
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (1, 4)
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (2, 1)
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (2, 2)
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (3, 1)
GO
INSERT [dbo].[ChatRoomUsers] ([chatRoomId], [userId]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[Experience] ON 
GO
INSERT [dbo].[Experience] ([experienceId], [mentorId], [description]) VALUES (1, 1, N'Worked as a Java developer for 5 years')
GO
INSERT [dbo].[Experience] ([experienceId], [mentorId], [description]) VALUES (2, 2, N'Developed Python applications for various clients')
GO
SET IDENTITY_INSERT [dbo].[Experience] OFF
GO
SET IDENTITY_INSERT [dbo].[Expertise] ON 
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (1, 1, 13)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (2, 1, 14)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (3, 2, 1)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (4, 2, 2)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (5, 2, 3)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (6, 2, 4)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (7, 2, 5)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (8, 2, 6)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (9, 2, 12)
GO
INSERT [dbo].[Expertise] ([expertiseId], [mentorId], [skillId]) VALUES (10, 2, 22)
GO
SET IDENTITY_INSERT [dbo].[Expertise] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 
GO
INSERT [dbo].[Feedback] ([feedbackId], [menteeId], [mentorId], [bookingId], [rating], [reviewText], [reviewDateTime]) VALUES (1, 1, 1, 1, 5, N'Great mentor!', CAST(N'2023-05-21T22:08:07.263' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[MenteeInterests] ON 
GO
INSERT [dbo].[MenteeInterests] ([menteeInterestId], [menteeId], [categoryId], [subCategoryId], [skillId]) VALUES (1, 1, 2, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[MenteeInterests] OFF
GO
SET IDENTITY_INSERT [dbo].[Mentees] ON 
GO
INSERT [dbo].[Mentees] ([menteeId], [userId]) VALUES (1, 3)
GO
SET IDENTITY_INSERT [dbo].[Mentees] OFF
GO
SET IDENTITY_INSERT [dbo].[Mentors] ON 
GO
INSERT [dbo].[Mentors] ([mentorId], [userId], [bio], [hourlyRate]) VALUES (1, 2, N'I am really good at Java and Python', N'450000')
GO
INSERT [dbo].[Mentors] ([mentorId], [userId], [bio], [hourlyRate]) VALUES (2, 4, N'I am expert at React and NodeJS', N'500000')
GO
SET IDENTITY_INSERT [dbo].[Mentors] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([notificationId], [userId], [bookingId], [content], [dateTime], [type], [status]) VALUES (1, 1, 1, N'New booking request', CAST(N'2023-05-21T22:08:07.263' AS DateTime), N'Booking', N'Pending')
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'001', N'Quận Ba Đình', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'002', N'Quận Hoàn Kiếm', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'003', N'Quận Tây Hồ', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'004', N'Quận Long Biên', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'005', N'Quận Cầu Giấy', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'006', N'Quận Đống Đa', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'007', N'Quận Hai Bà Trưng', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'008', N'Quận Hoàng Mai', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'009', N'Quận Thanh Xuân', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'016', N'Huyện Sóc Sơn', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'017', N'Huyện Đông Anh', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'018', N'Huyện Gia Lâm', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'019', N'Quận Nam Từ Liêm', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'020', N'Huyện Thanh Trì', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'021', N'Quận Bắc Từ Liêm', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'024', N'Thành phố Hà Giang', N'Thành phố', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'026', N'Huyện Đồng Văn', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'027', N'Huyện Mèo Vạc', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'028', N'Huyện Yên Minh', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'029', N'Huyện Quản Bạ', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'030', N'Huyện Vị Xuyên', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'031', N'Huyện Bắc Mê', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'032', N'Huyện Hoàng Su Phì', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'033', N'Huyện Xín Mần', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'034', N'Huyện Bắc Quang', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'035', N'Huyện Quang Bình', N'Huyện', N'02')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'040', N'Thành phố Cao Bằng', N'Thành phố', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'042', N'Huyện Bảo Lâm', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'043', N'Huyện Bảo Lạc', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'044', N'Huyện Thông Nông', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'045', N'Huyện Hà Quảng', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'046', N'Huyện Trà Lĩnh', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'047', N'Huyện Trùng Khánh', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'048', N'Huyện Hạ Lang', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'049', N'Huyện Quảng Uyên', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'050', N'Huyện Phục Hoà', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'051', N'Huyện Hoà An', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'052', N'Huyện Nguyên Bình', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'053', N'Huyện Thạch An', N'Huyện', N'04')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'058', N'Thành Phố Bắc Kạn', N'Thành phố', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'060', N'Huyện Pác Nặm', N'Huyện', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'061', N'Huyện Ba Bể', N'Huyện', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'062', N'Huyện Ngân Sơn', N'Huyện', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'063', N'Huyện Bạch Thông', N'Huyện', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'064', N'Huyện Chợ Đồn', N'Huyện', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'065', N'Huyện Chợ Mới', N'Huyện', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'066', N'Huyện Na Rì', N'Huyện', N'06')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'070', N'Thành phố Tuyên Quang', N'Thành phố', N'08')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'071', N'Huyện Lâm Bình', N'Huyện', N'08')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'072', N'Huyện Nà Hang', N'Huyện', N'08')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'073', N'Huyện Chiêm Hóa', N'Huyện', N'08')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'074', N'Huyện Hàm Yên', N'Huyện', N'08')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'075', N'Huyện Yên Sơn', N'Huyện', N'08')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'076', N'Huyện Sơn Dương', N'Huyện', N'08')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'080', N'Thành phố Lào Cai', N'Thành phố', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'082', N'Huyện Bát Xát', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'083', N'Huyện Mường Khương', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'084', N'Huyện Si Ma Cai', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'085', N'Huyện Bắc Hà', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'086', N'Huyện Bảo Thắng', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'087', N'Huyện Bảo Yên', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'088', N'Huyện Sa Pa', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'089', N'Huyện Văn Bàn', N'Huyện', N'10')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'094', N'Thành phố Điện Biên Phủ', N'Thành phố', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'095', N'Thị Xã Mường Lay', N'Thị xã', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'096', N'Huyện Mường Nhé', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'097', N'Huyện Mường Chà', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'098', N'Huyện Tủa Chùa', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'099', N'Huyện Tuần Giáo', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'100', N'Huyện Điện Biên', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'101', N'Huyện Điện Biên Đông', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'102', N'Huyện Mường Ảng', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'103', N'Huyện Nậm Pồ', N'Huyện', N'11')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'105', N'Thành phố Lai Châu', N'Thành phố', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'106', N'Huyện Tam Đường', N'Huyện', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'107', N'Huyện Mường Tè', N'Huyện', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'108', N'Huyện Sìn Hồ', N'Huyện', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'109', N'Huyện Phong Thổ', N'Huyện', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'110', N'Huyện Than Uyên', N'Huyện', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'111', N'Huyện Tân Uyên', N'Huyện', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'112', N'Huyện Nậm Nhùn', N'Huyện', N'12')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'116', N'Thành phố Sơn La', N'Thành phố', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'118', N'Huyện Quỳnh Nhai', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'119', N'Huyện Thuận Châu', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'120', N'Huyện Mường La', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'121', N'Huyện Bắc Yên', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'122', N'Huyện Phù Yên', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'123', N'Huyện Mộc Châu', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'124', N'Huyện Yên Châu', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'125', N'Huyện Mai Sơn', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'126', N'Huyện Sông Mã', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'127', N'Huyện Sốp Cộp', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'128', N'Huyện Vân Hồ', N'Huyện', N'14')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'132', N'Thành phố Yên Bái', N'Thành phố', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'133', N'Thị xã Nghĩa Lộ', N'Thị xã', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'135', N'Huyện Lục Yên', N'Huyện', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'136', N'Huyện Văn Yên', N'Huyện', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'137', N'Huyện Mù Căng Chải', N'Huyện', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'138', N'Huyện Trấn Yên', N'Huyện', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'139', N'Huyện Trạm Tấu', N'Huyện', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'140', N'Huyện Văn Chấn', N'Huyện', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'141', N'Huyện Yên Bình', N'Huyện', N'15')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'148', N'Thành phố Hòa Bình', N'Thành phố', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'150', N'Huyện Đà Bắc', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'151', N'Huyện Kỳ Sơn', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'152', N'Huyện Lương Sơn', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'153', N'Huyện Kim Bôi', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'154', N'Huyện Cao Phong', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'155', N'Huyện Tân Lạc', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'156', N'Huyện Mai Châu', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'157', N'Huyện Lạc Sơn', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'158', N'Huyện Yên Thủy', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'159', N'Huyện Lạc Thủy', N'Huyện', N'17')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'164', N'Thành phố Thái Nguyên', N'Thành phố', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'165', N'Thành phố Sông Công', N'Thành phố', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'167', N'Huyện Định Hóa', N'Huyện', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'168', N'Huyện Phú Lương', N'Huyện', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'169', N'Huyện Đồng Hỷ', N'Huyện', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'170', N'Huyện Võ Nhai', N'Huyện', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'171', N'Huyện Đại Từ', N'Huyện', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'172', N'Thị xã Phổ Yên', N'Thị xã', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'173', N'Huyện Phú Bình', N'Huyện', N'19')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'178', N'Thành phố Lạng Sơn', N'Thành phố', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'180', N'Huyện Tràng Định', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'181', N'Huyện Bình Gia', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'182', N'Huyện Văn Lãng', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'183', N'Huyện Cao Lộc', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'184', N'Huyện Văn Quan', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'185', N'Huyện Bắc Sơn', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'186', N'Huyện Hữu Lũng', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'187', N'Huyện Chi Lăng', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'188', N'Huyện Lộc Bình', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'189', N'Huyện Đình Lập', N'Huyện', N'20')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'193', N'Thành phố Hạ Long', N'Thành phố', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'194', N'Thành phố Móng Cái', N'Thành phố', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'195', N'Thành phố Cẩm Phả', N'Thành phố', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'196', N'Thành phố Uông Bí', N'Thành phố', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'198', N'Huyện Bình Liêu', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'199', N'Huyện Tiên Yên', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'200', N'Huyện Đầm Hà', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'201', N'Huyện Hải Hà', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'202', N'Huyện Ba Chẽ', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'203', N'Huyện Vân Đồn', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'204', N'Huyện Hoành Bồ', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'205', N'Thị xã Đông Triều', N'Thị xã', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'206', N'Thị xã Quảng Yên', N'Thị xã', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'207', N'Huyện Cô Tô', N'Huyện', N'22')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'213', N'Thành phố Bắc Giang', N'Thành phố', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'215', N'Huyện Yên Thế', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'216', N'Huyện Tân Yên', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'217', N'Huyện Lạng Giang', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'218', N'Huyện Lục Nam', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'219', N'Huyện Lục Ngạn', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'220', N'Huyện Sơn Động', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'221', N'Huyện Yên Dũng', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'222', N'Huyện Việt Yên', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'223', N'Huyện Hiệp Hòa', N'Huyện', N'24')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'227', N'Thành phố Việt Trì', N'Thành phố', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'228', N'Thị xã Phú Thọ', N'Thị xã', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'230', N'Huyện Đoan Hùng', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'231', N'Huyện Hạ Hoà', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'232', N'Huyện Thanh Ba', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'233', N'Huyện Phù Ninh', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'234', N'Huyện Yên Lập', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'235', N'Huyện Cẩm Khê', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'236', N'Huyện Tam Nông', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'237', N'Huyện Lâm Thao', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'238', N'Huyện Thanh Sơn', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'239', N'Huyện Thanh Thuỷ', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'240', N'Huyện Tân Sơn', N'Huyện', N'25')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'243', N'Thành phố Vĩnh Yên', N'Thành phố', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'244', N'Thị xã Phúc Yên', N'Thị xã', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'246', N'Huyện Lập Thạch', N'Huyện', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'247', N'Huyện Tam Dương', N'Huyện', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'248', N'Huyện Tam Đảo', N'Huyện', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'249', N'Huyện Bình Xuyên', N'Huyện', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'250', N'Huyện Mê Linh', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'251', N'Huyện Yên Lạc', N'Huyện', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'252', N'Huyện Vĩnh Tường', N'Huyện', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'253', N'Huyện Sông Lô', N'Huyện', N'26')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'256', N'Thành phố Bắc Ninh', N'Thành phố', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'258', N'Huyện Yên Phong', N'Huyện', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'259', N'Huyện Quế Võ', N'Huyện', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'260', N'Huyện Tiên Du', N'Huyện', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'261', N'Thị xã Từ Sơn', N'Thị xã', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'262', N'Huyện Thuận Thành', N'Huyện', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'263', N'Huyện Gia Bình', N'Huyện', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'264', N'Huyện Lương Tài', N'Huyện', N'27')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'268', N'Quận Hà Đông', N'Quận', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'269', N'Thị xã Sơn Tây', N'Thị xã', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'271', N'Huyện Ba Vì', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'272', N'Huyện Phúc Thọ', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'273', N'Huyện Đan Phượng', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'274', N'Huyện Hoài Đức', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'275', N'Huyện Quốc Oai', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'276', N'Huyện Thạch Thất', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'277', N'Huyện Chương Mỹ', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'278', N'Huyện Thanh Oai', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'279', N'Huyện Thường Tín', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'280', N'Huyện Phú Xuyên', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'281', N'Huyện Ứng Hòa', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'282', N'Huyện Mỹ Đức', N'Huyện', N'01')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'288', N'Thành phố Hải Dương', N'Thành phố', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'290', N'Thị xã Chí Linh', N'Thị xã', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'291', N'Huyện Nam Sách', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'292', N'Huyện Kinh Môn', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'293', N'Huyện Kim Thành', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'294', N'Huyện Thanh Hà', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'295', N'Huyện Cẩm Giàng', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'296', N'Huyện Bình Giang', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'297', N'Huyện Gia Lộc', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'298', N'Huyện Tứ Kỳ', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'299', N'Huyện Ninh Giang', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'300', N'Huyện Thanh Miện', N'Huyện', N'30')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'303', N'Quận Hồng Bàng', N'Quận', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'304', N'Quận Ngô Quyền', N'Quận', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'305', N'Quận Lê Chân', N'Quận', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'306', N'Quận Hải An', N'Quận', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'307', N'Quận Kiến An', N'Quận', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'308', N'Quận Đồ Sơn', N'Quận', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'309', N'Quận Dương Kinh', N'Quận', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'311', N'Huyện Thuỷ Nguyên', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'312', N'Huyện An Dương', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'313', N'Huyện An Lão', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'314', N'Huyện Kiến Thuỵ', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'315', N'Huyện Tiên Lãng', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'316', N'Huyện Vĩnh Bảo', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'317', N'Huyện Cát Hải', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'318', N'Huyện Bạch Long Vĩ', N'Huyện', N'31')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'323', N'Thành phố Hưng Yên', N'Thành phố', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'325', N'Huyện Văn Lâm', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'326', N'Huyện Văn Giang', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'327', N'Huyện Yên Mỹ', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'328', N'Huyện Mỹ Hào', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'329', N'Huyện Ân Thi', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'330', N'Huyện Khoái Châu', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'331', N'Huyện Kim Động', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'332', N'Huyện Tiên Lữ', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'333', N'Huyện Phù Cừ', N'Huyện', N'33')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'336', N'Thành phố Thái Bình', N'Thành phố', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'338', N'Huyện Quỳnh Phụ', N'Huyện', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'339', N'Huyện Hưng Hà', N'Huyện', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'340', N'Huyện Đông Hưng', N'Huyện', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'341', N'Huyện Thái Thụy', N'Huyện', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'342', N'Huyện Tiền Hải', N'Huyện', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'343', N'Huyện Kiến Xương', N'Huyện', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'344', N'Huyện Vũ Thư', N'Huyện', N'34')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'347', N'Thành phố Phủ Lý', N'Thành phố', N'35')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'349', N'Huyện Duy Tiên', N'Huyện', N'35')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'350', N'Huyện Kim Bảng', N'Huyện', N'35')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'351', N'Huyện Thanh Liêm', N'Huyện', N'35')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'352', N'Huyện Bình Lục', N'Huyện', N'35')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'353', N'Huyện Lý Nhân', N'Huyện', N'35')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'356', N'Thành phố Nam Định', N'Thành phố', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'358', N'Huyện Mỹ Lộc', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'359', N'Huyện Vụ Bản', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'360', N'Huyện Ý Yên', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'361', N'Huyện Nghĩa Hưng', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'362', N'Huyện Nam Trực', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'363', N'Huyện Trực Ninh', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'364', N'Huyện Xuân Trường', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'365', N'Huyện Giao Thủy', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'366', N'Huyện Hải Hậu', N'Huyện', N'36')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'369', N'Thành phố Ninh Bình', N'Thành phố', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'370', N'Thành phố Tam Điệp', N'Thành phố', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'372', N'Huyện Nho Quan', N'Huyện', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'373', N'Huyện Gia Viễn', N'Huyện', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'374', N'Huyện Hoa Lư', N'Huyện', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'375', N'Huyện Yên Khánh', N'Huyện', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'376', N'Huyện Kim Sơn', N'Huyện', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'377', N'Huyện Yên Mô', N'Huyện', N'37')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'380', N'Thành phố Thanh Hóa', N'Thành phố', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'381', N'Thị xã Bỉm Sơn', N'Thị xã', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'382', N'Thị xã Sầm Sơn', N'Thị xã', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'384', N'Huyện Mường Lát', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'385', N'Huyện Quan Hóa', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'386', N'Huyện Bá Thước', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'387', N'Huyện Quan Sơn', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'388', N'Huyện Lang Chánh', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'389', N'Huyện Ngọc Lặc', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'390', N'Huyện Cẩm Thủy', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'391', N'Huyện Thạch Thành', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'392', N'Huyện Hà Trung', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'393', N'Huyện Vĩnh Lộc', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'394', N'Huyện Yên Định', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'395', N'Huyện Thọ Xuân', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'396', N'Huyện Thường Xuân', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'397', N'Huyện Triệu Sơn', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'398', N'Huyện Thiệu Hóa', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'399', N'Huyện Hoằng Hóa', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'400', N'Huyện Hậu Lộc', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'401', N'Huyện Nga Sơn', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'402', N'Huyện Như Xuân', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'403', N'Huyện Như Thanh', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'404', N'Huyện Nông Cống', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'405', N'Huyện Đông Sơn', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'406', N'Huyện Quảng Xương', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'407', N'Huyện Tĩnh Gia', N'Huyện', N'38')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'412', N'Thành phố Vinh', N'Thành phố', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'413', N'Thị xã Cửa Lò', N'Thị xã', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'414', N'Thị xã Thái Hoà', N'Thị xã', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'415', N'Huyện Quế Phong', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'416', N'Huyện Quỳ Châu', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'417', N'Huyện Kỳ Sơn', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'418', N'Huyện Tương Dương', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'419', N'Huyện Nghĩa Đàn', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'420', N'Huyện Quỳ Hợp', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'421', N'Huyện Quỳnh Lưu', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'422', N'Huyện Con Cuông', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'423', N'Huyện Tân Kỳ', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'424', N'Huyện Anh Sơn', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'425', N'Huyện Diễn Châu', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'426', N'Huyện Yên Thành', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'427', N'Huyện Đô Lương', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'428', N'Huyện Thanh Chương', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'429', N'Huyện Nghi Lộc', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'430', N'Huyện Nam Đàn', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'431', N'Huyện Hưng Nguyên', N'Huyện', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'432', N'Thị xã Hoàng Mai', N'Thị xã', N'40')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'436', N'Thành phố Hà Tĩnh', N'Thành phố', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'437', N'Thị xã Hồng Lĩnh', N'Thị xã', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'439', N'Huyện Hương Sơn', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'440', N'Huyện Đức Thọ', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'441', N'Huyện Vũ Quang', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'442', N'Huyện Nghi Xuân', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'443', N'Huyện Can Lộc', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'444', N'Huyện Hương Khê', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'445', N'Huyện Thạch Hà', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'446', N'Huyện Cẩm Xuyên', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'447', N'Huyện Kỳ Anh', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'448', N'Huyện Lộc Hà', N'Huyện', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'449', N'Thị xã Kỳ Anh', N'Thị xã', N'42')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'450', N'Thành Phố Đồng Hới', N'Thành phố', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'452', N'Huyện Minh Hóa', N'Huyện', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'453', N'Huyện Tuyên Hóa', N'Huyện', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'454', N'Huyện Quảng Trạch', N'Th? xã', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'455', N'Huyện Bố Trạch', N'Huyện', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'456', N'Huyện Quảng Ninh', N'Huyện', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'457', N'Huyện Lệ Thủy', N'Huyện', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'458', N'Thị xã Ba Đồn', N'Huyện', N'44')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'461', N'Thành phố Đông Hà', N'Thành phố', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'462', N'Thị xã Quảng Trị', N'Thị xã', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'464', N'Huyện Vĩnh Linh', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'465', N'Huyện Hướng Hóa', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'466', N'Huyện Gio Linh', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'467', N'Huyện Đa Krông', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'468', N'Huyện Cam Lộ', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'469', N'Huyện Triệu Phong', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'470', N'Huyện Hải Lăng', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'471', N'Huyện Cồn Cỏ', N'Huyện', N'45')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'474', N'Thành phố Huế', N'Thành phố', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'476', N'Huyện Phong Điền', N'Huyện', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'477', N'Huyện Quảng Điền', N'Huyện', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'478', N'Huyện Phú Vang', N'Huyện', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'479', N'Thị xã Hương Thủy', N'Thị xã', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'480', N'Thị xã Hương Trà', N'Thị xã', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'481', N'Huyện A Lưới', N'Huyện', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'482', N'Huyện Phú Lộc', N'Huyện', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'483', N'Huyện Nam Đông', N'Huyện', N'46')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'490', N'Quận Liên Chiểu', N'Quận', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'491', N'Quận Thanh Khê', N'Quận', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'492', N'Quận Hải Châu', N'Quận', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'493', N'Quận Sơn Trà', N'Quận', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'494', N'Quận Ngũ Hành Sơn', N'Quận', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'495', N'Quận Cẩm Lệ', N'Quận', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'497', N'Huyện Hòa Vang', N'Huyện', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'498', N'Huyện Hoàng Sa', N'Huyện', N'48')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'502', N'Thành phố Tam Kỳ', N'Thành phố', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'503', N'Thành phố Hội An', N'Thành phố', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'504', N'Huyện Tây Giang', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'505', N'Huyện Đông Giang', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'506', N'Huyện Đại Lộc', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'507', N'Thị xã Điện Bàn', N'Thị xã', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'508', N'Huyện Duy Xuyên', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'509', N'Huyện Quế Sơn', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'510', N'Huyện Nam Giang', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'511', N'Huyện Phước Sơn', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'512', N'Huyện Hiệp Đức', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'513', N'Huyện Thăng Bình', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'514', N'Huyện Tiên Phước', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'515', N'Huyện Bắc Trà My', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'516', N'Huyện Nam Trà My', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'517', N'Huyện Núi Thành', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'518', N'Huyện Phú Ninh', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'519', N'Huyện Nông Sơn', N'Huyện', N'49')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'522', N'Thành phố Quảng Ngãi', N'Thành phố', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'524', N'Huyện Bình Sơn', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'525', N'Huyện Trà Bồng', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'526', N'Huyện Tây Trà', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'527', N'Huyện Sơn Tịnh', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'528', N'Huyện Tư Nghĩa', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'529', N'Huyện Sơn Hà', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'530', N'Huyện Sơn Tây', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'531', N'Huyện Minh Long', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'532', N'Huyện Nghĩa Hành', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'533', N'Huyện Mộ Đức', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'534', N'Huyện Đức Phổ', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'535', N'Huyện Ba Tơ', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'536', N'Huyện Lý Sơn', N'Huyện', N'51')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'540', N'Thành phố Qui Nhơn', N'Thành phố', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'542', N'Huyện An Lão', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'543', N'Huyện Hoài Nhơn', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'544', N'Huyện Hoài Ân', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'545', N'Huyện Phù Mỹ', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'546', N'Huyện Vĩnh Thạnh', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'547', N'Huyện Tây Sơn', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'548', N'Huyện Phù Cát', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'549', N'Thị xã An Nhơn', N'Thị xã', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'550', N'Huyện Tuy Phước', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'551', N'Huyện Vân Canh', N'Huyện', N'52')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'555', N'Thành phố Tuy Hoà', N'Thành phố', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'557', N'Thị xã Sông Cầu', N'Thị xã', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'558', N'Huyện Đồng Xuân', N'Huyện', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'559', N'Huyện Tuy An', N'Huyện', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'560', N'Huyện Sơn Hòa', N'Huyện', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'561', N'Huyện Sông Hinh', N'Huyện', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'562', N'Huyện Tây Hoà', N'Huyện', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'563', N'Huyện Phú Hoà', N'Huyện', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'564', N'Huyện Đông Hòa', N'Huyện', N'54')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'568', N'Thành phố Nha Trang', N'Thành phố', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'569', N'Thành phố Cam Ranh', N'Thành phố', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'570', N'Huyện Cam Lâm', N'Huyện', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'571', N'Huyện Vạn Ninh', N'Huyện', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'572', N'Thị xã Ninh Hòa', N'Thị xã', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'573', N'Huyện Khánh Vĩnh', N'Huyện', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'574', N'Huyện Diên Khánh', N'Huyện', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'575', N'Huyện Khánh Sơn', N'Huyện', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'576', N'Huyện Trường Sa', N'Huyện', N'56')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'582', N'Thành phố Phan Rang-Tháp Chàm', N'Thành phố', N'58')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'584', N'Huyện Bác Ái', N'Huyện', N'58')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'585', N'Huyện Ninh Sơn', N'Huyện', N'58')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'586', N'Huyện Ninh Hải', N'Huyện', N'58')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'587', N'Huyện Ninh Phước', N'Huyện', N'58')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'588', N'Huyện Thuận Bắc', N'Huyện', N'58')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'589', N'Huyện Thuận Nam', N'Huyện', N'58')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'593', N'Thành phố Phan Thiết', N'Thành phố', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'594', N'Thị xã La Gi', N'Thị xã', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'595', N'Huyện Tuy Phong', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'596', N'Huyện Bắc Bình', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'597', N'Huyện Hàm Thuận Bắc', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'598', N'Huyện Hàm Thuận Nam', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'599', N'Huyện Tánh Linh', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'600', N'Huyện Đức Linh', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'601', N'Huyện Hàm Tân', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'602', N'Huyện Phú Quí', N'Huyện', N'60')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'608', N'Thành phố Kon Tum', N'Thành phố', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'610', N'Huyện Đắk Glei', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'611', N'Huyện Ngọc Hồi', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'612', N'Huyện Đắk Tô', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'613', N'Huyện Kon Plông', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'614', N'Huyện Kon Rẫy', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'615', N'Huyện Đắk Hà', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'616', N'Huyện Sa Thầy', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'617', N'Huyện Tu Mơ Rông', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'618', N'Huyện Ia H Drai', N'Huyện', N'62')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'622', N'Thành phố Pleiku', N'Thành phố', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'623', N'Thị xã An Khê', N'Thị xã', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'624', N'Thị xã Ayun Pa', N'Thị xã', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'625', N'Huyện KBang', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'626', N'Huyện Đăk Đoa', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'627', N'Huyện Chư Păh', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'628', N'Huyện Ia Grai', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'629', N'Huyện Mang Yang', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'630', N'Huyện Kông Chro', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'631', N'Huyện Đức Cơ', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'632', N'Huyện Chư Prông', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'633', N'Huyện Chư Sê', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'634', N'Huyện Đăk Pơ', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'635', N'Huyện Ia Pa', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'637', N'Huyện Krông Pa', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'638', N'Huyện Phú Thiện', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'639', N'Huyện Chư Pưh', N'Huyện', N'64')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'643', N'Thành phố Buôn Ma Thuột', N'Thành phố', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'644', N'Thị Xã Buôn Hồ', N'Thị xã', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'645', N'Huyện Ea Hleo', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'646', N'Huyện Ea Súp', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'647', N'Huyện Buôn Đôn', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'648', N'Huyện Cư Mgar', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'649', N'Huyện Krông Búk', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'650', N'Huyện Krông Năng', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'651', N'Huyện Ea Kar', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'652', N'Huyện MĐrắk', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'653', N'Huyện Krông Bông', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'654', N'Huyện Krông Pắc', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'655', N'Huyện Krông A Na', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'656', N'Huyện Lắk', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'657', N'Huyện Cư Kuin', N'Huyện', N'66')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'660', N'Thị xã Gia Nghĩa', N'Thị xã', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'661', N'Huyện Đăk Glong', N'Huyện', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'662', N'Huyện Cư Jút', N'Huyện', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'663', N'Huyện Đắk Mil', N'Huyện', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'664', N'Huyện Krông Nô', N'Huyện', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'665', N'Huyện Đắk Song', N'Huyện', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'666', N'Huyện Đắk RLấp', N'Huyện', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'667', N'Huyện Tuy Đức', N'Huyện', N'67')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'672', N'Thành phố Đà Lạt', N'Thành phố', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'673', N'Thành phố Bảo Lộc', N'Thành phố', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'674', N'Huyện Đam Rông', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'675', N'Huyện Lạc Dương', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'676', N'Huyện Lâm Hà', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'677', N'Huyện Đơn Dương', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'678', N'Huyện Đức Trọng', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'679', N'Huyện Di Linh', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'680', N'Huyện Bảo Lâm', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'681', N'Huyện Đạ Huoai', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'682', N'Huyện Đạ Tẻh', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'683', N'Huyện Cát Tiên', N'Huyện', N'68')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'688', N'Thị xã Phước Long', N'Thị xã', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'689', N'Thị xã Đồng Xoài', N'Thị xã', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'690', N'Thị xã Bình Long', N'Thị xã', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'691', N'Huyện Bù Gia Mập', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'692', N'Huyện Lộc Ninh', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'693', N'Huyện Bù Đốp', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'694', N'Huyện Hớn Quản', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'695', N'Huyện Đồng Phú', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'696', N'Huyện Bù Đăng', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'697', N'Huyện Chơn Thành', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'698', N'Huyện Phú Riềng', N'Huyện', N'70')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'703', N'Thành phố Tây Ninh', N'Thành phố', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'705', N'Huyện Tân Biên', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'706', N'Huyện Tân Châu', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'707', N'Huyện Dương Minh Châu', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'708', N'Huyện Châu Thành', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'709', N'Huyện Hòa Thành', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'710', N'Huyện Gò Dầu', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'711', N'Huyện Bến Cầu', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'712', N'Huyện Trảng Bàng', N'Huyện', N'72')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'718', N'Thành phố Thủ Dầu Một', N'Thành phố', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'719', N'Huyện Bàu Bàng', N'Huyện', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'720', N'Huyện Dầu Tiếng', N'Huyện', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'721', N'Thị xã Bến Cát', N'Thị xã', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'722', N'Huyện Phú Giáo', N'Huyện', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'723', N'Thị xã Tân Uyên', N'Thị xã', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'724', N'Thị xã Dĩ An', N'Thị xã', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'725', N'Thị xã Thuận An', N'Thị xã', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'726', N'Huyện Bắc Tân Uyên', N'Huyện', N'74')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'731', N'Thành phố Biên Hòa', N'Thành phố', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'732', N'Thị xã Long Khánh', N'Thị xã', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'734', N'Huyện Tân Phú', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'735', N'Huyện Vĩnh Cửu', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'736', N'Huyện Định Quán', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'737', N'Huyện Trảng Bom', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'738', N'Huyện Thống Nhất', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'739', N'Huyện Cẩm Mỹ', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'740', N'Huyện Long Thành', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'741', N'Huyện Xuân Lộc', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'742', N'Huyện Nhơn Trạch', N'Huyện', N'75')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'747', N'Thành phố Vũng Tàu', N'Thành phố', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'748', N'Thành phố Bà Rịa', N'Thành phố', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'750', N'Huyện Châu Đức', N'Huyện', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'751', N'Huyện Xuyên Mộc', N'Huyện', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'752', N'Huyện Long Điền', N'Huyện', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'753', N'Huyện Đất Đỏ', N'Huyện', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'754', N'Huyện Tân Thành', N'Huyện', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'755', N'Huyện Côn Đảo', N'Huyện', N'77')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'760', N'Quận 1', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'761', N'Quận 12', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'762', N'Quận Thủ Đức', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'763', N'Quận 9', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'764', N'Quận Gò Vấp', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'765', N'Quận Bình Thạnh', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'766', N'Quận Tân Bình', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'767', N'Quận Tân Phú', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'768', N'Quận Phú Nhuận', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'769', N'Quận 2', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'770', N'Quận 3', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'771', N'Quận 10', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'772', N'Quận 11', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'773', N'Quận 4', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'774', N'Quận 5', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'775', N'Quận 6', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'776', N'Quận 8', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'777', N'Quận Bình Tân', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'778', N'Quận 7', N'Quận', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'783', N'Huyện Củ Chi', N'Huyện', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'784', N'Huyện Hóc Môn', N'Huyện', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'785', N'Huyện Bình Chánh', N'Huyện', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'786', N'Huyện Nhà Bè', N'Huyện', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'787', N'Huyện Cần Giờ', N'Huyện', N'79')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'794', N'Thành phố Tân An', N'Thành phố', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'795', N'Thị xã Kiến Tường', N'Thị xã', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'796', N'Huyện Tân Hưng', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'797', N'Huyện Vĩnh Hưng', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'798', N'Huyện Mộc Hóa', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'799', N'Huyện Tân Thạnh', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'800', N'Huyện Thạnh Hóa', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'801', N'Huyện Đức Huệ', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'802', N'Huyện Đức Hòa', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'803', N'Huyện Bến Lức', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'804', N'Huyện Thủ Thừa', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'805', N'Huyện Tân Trụ', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'806', N'Huyện Cần Đước', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'807', N'Huyện Cần Giuộc', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'808', N'Huyện Châu Thành', N'Huyện', N'80')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'815', N'Thành phố Mỹ Tho', N'Thành phố', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'816', N'Thị xã Gò Công', N'Thị xã', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'817', N'Thị xã Cai Lậy', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'818', N'Huyện Tân Phước', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'819', N'Huyện Cái Bè', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'820', N'Huyện Cai Lậy', N'Thị xã', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'821', N'Huyện Châu Thành', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'822', N'Huyện Chợ Gạo', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'823', N'Huyện Gò Công Tây', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'824', N'Huyện Gò Công Đông', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'825', N'Huyện Tân Phú Đông', N'Huyện', N'82')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'829', N'Thành phố Bến Tre', N'Thành phố', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'831', N'Huyện Châu Thành', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'832', N'Huyện Chợ Lách', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'833', N'Huyện Mỏ Cày Nam', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'834', N'Huyện Giồng Trôm', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'835', N'Huyện Bình Đại', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'836', N'Huyện Ba Tri', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'837', N'Huyện Thạnh Phú', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'838', N'Huyện Mỏ Cày Bắc', N'Huyện', N'83')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'842', N'Thành phố Trà Vinh', N'Thành phố', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'844', N'Huyện Càng Long', N'Huyện', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'845', N'Huyện Cầu Kè', N'Huyện', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'846', N'Huyện Tiểu Cần', N'Huyện', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'847', N'Huyện Châu Thành', N'Huyện', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'848', N'Huyện Cầu Ngang', N'Huyện', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'849', N'Huyện Trà Cú', N'Huyện', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'850', N'Huyện Duyên Hải', N'Huyện', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'851', N'Thị xã Duyên Hải', N'Thị xã', N'84')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'855', N'Thành phố Vĩnh Long', N'Thành phố', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'857', N'Huyện Long Hồ', N'Huyện', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'858', N'Huyện Mang Thít', N'Huyện', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'859', N'Huyện  Vũng Liêm', N'Huyện', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'860', N'Huyện Tam Bình', N'Huyện', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'861', N'Thị xã Bình Minh', N'Thị xã', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'862', N'Huyện Trà Ôn', N'Huyện', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'863', N'Huyện Bình Tân', N'Huyện', N'86')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'866', N'Thành phố Cao Lãnh', N'Thành phố', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'867', N'Thành phố Sa Đéc', N'Thành phố', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'868', N'Thị xã Hồng Ngự', N'Thị xã', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'869', N'Huyện Tân Hồng', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'870', N'Huyện Hồng Ngự', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'871', N'Huyện Tam Nông', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'872', N'Huyện Tháp Mười', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'873', N'Huyện Cao Lãnh', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'874', N'Huyện Thanh Bình', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'875', N'Huyện Lấp Vò', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'876', N'Huyện Lai Vung', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'877', N'Huyện Châu Thành', N'Huyện', N'87')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'883', N'Thành phố Long Xuyên', N'Thành phố', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'884', N'Thành phố Châu Đốc', N'Thành phố', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'886', N'Huyện An Phú', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'887', N'Thị xã Tân Châu', N'Thị xã', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'888', N'Huyện Phú Tân', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'889', N'Huyện Châu Phú', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'890', N'Huyện Tịnh Biên', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'891', N'Huyện Tri Tôn', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'892', N'Huyện Châu Thành', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'893', N'Huyện Chợ Mới', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'894', N'Huyện Thoại Sơn', N'Huyện', N'89')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'899', N'Thành phố Rạch Giá', N'Thành phố', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'900', N'Thị xã Hà Tiên', N'Thị xã', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'902', N'Huyện Kiên Lương', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'903', N'Huyện Hòn Đất', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'904', N'Huyện Tân Hiệp', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'905', N'Huyện Châu Thành', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'906', N'Huyện Giồng Riềng', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'907', N'Huyện Gò Quao', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'908', N'Huyện An Biên', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'909', N'Huyện An Minh', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'910', N'Huyện Vĩnh Thuận', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'911', N'Huyện Phú Quốc', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'912', N'Huyện Kiên Hải', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'913', N'Huyện U Minh Thượng', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'914', N'Huyện Giang Thành', N'Huyện', N'91')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'916', N'Quận Ninh Kiều', N'Quận', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'917', N'Quận Ô Môn', N'Quận', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'918', N'Quận Bình Thuỷ', N'Quận', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'919', N'Quận Cái Răng', N'Quận', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'923', N'Quận Thốt Nốt', N'Quận', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'924', N'Huyện Vĩnh Thạnh', N'Huyện', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'925', N'Huyện Cờ Đỏ', N'Huyện', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'926', N'Huyện Phong Điền', N'Huyện', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'927', N'Huyện Thới Lai', N'Huyện', N'92')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'930', N'Thành phố Vị Thanh', N'Thành phố', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'931', N'Thị xã Ngã Bảy', N'Thị xã', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'932', N'Huyện Châu Thành A', N'Huyện', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'933', N'Huyện Châu Thành', N'Huyện', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'934', N'Huyện Phụng Hiệp', N'Huyện', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'935', N'Huyện Vị Thuỷ', N'Huyện', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'936', N'Huyện Long Mỹ', N'Huyện', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'937', N'Thị xã Long Mỹ', N'Thị xã', N'93')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'941', N'Thành phố Sóc Trăng', N'Thành phố', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'942', N'Huyện Châu Thành', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'943', N'Huyện Kế Sách', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'944', N'Huyện Mỹ Tú', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'945', N'Huyện Cù Lao Dung', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'946', N'Huyện Long Phú', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'947', N'Huyện Mỹ Xuyên', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'948', N'Thị xã Ngã Năm', N'Thị xã', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'949', N'Huyện Thạnh Trị', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'950', N'Thị xã Vĩnh Châu', N'Thị xã', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'951', N'Huyện Trần Đề', N'Huyện', N'94')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'954', N'Thành phố Bạc Liêu', N'Thành phố', N'95')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'956', N'Huyện Hồng Dân', N'Huyện', N'95')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'957', N'Huyện Phước Long', N'Huyện', N'95')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'958', N'Huyện Vĩnh Lợi', N'Huyện', N'95')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'959', N'Thị xã Giá Rai', N'Thị xã', N'95')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'960', N'Huyện Đông Hải', N'Huyện', N'95')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'961', N'Huyện Hoà Bình', N'Huyện', N'95')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'964', N'Thành phố Cà Mau', N'Thành phố', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'966', N'Huyện U Minh', N'Huyện', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'967', N'Huyện Thới Bình', N'Huyện', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'968', N'Huyện Trần Văn Thời', N'Huyện', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'969', N'Huyện Cái Nước', N'Huyện', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'970', N'Huyện Đầm Dơi', N'Huyện', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'971', N'Huyện Năm Căn', N'Huyện', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'972', N'Huyện Phú Tân', N'Huyện', N'96')
GO
INSERT [dbo].[quanhuyen] ([maqh], [name], [type], [mattp]) VALUES (N'973', N'Huyện Nọc Hiển', N'Huyện', N'96')
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (2, N'Mentor')
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (3, N'Mentee')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (1, N'HTML', 1)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (2, N'CSS', 1)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (3, N'JavaScript', 1)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (4, N'Node.js', 2)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (5, N'Express.js', 2)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (6, N'React.js', 1)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (7, N'React Native', 2)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (8, N'iOS Development', 4)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (9, N'Android Development', 5)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (10, N'SQL Server', 6)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (11, N'Oracle Database', 7)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (12, N'MySQL', 8)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (13, N'Java', 9)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (14, N'Python', 10)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (15, N'C++', 11)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (16, N'Machine Learning', 12)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (17, N'Big Data Analytics', 13)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (18, N'PHP', 1)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (19, N'ASP.NET', 2)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (20, N'Swift', 4)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (21, N'Kotlin', 5)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (22, N'MongoDB', 3)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (23, N'PostgreSQL', 3)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (24, N'Ruby', 4)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (25, N'R', 5)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (26, N'Go', 6)
GO
INSERT [dbo].[Skills] ([skillId], [skillName], [subCategoryId]) VALUES (27, N'TensorFlow', 5)
GO
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 
GO
INSERT [dbo].[Slot] ([slotId], [startTime], [endTime]) VALUES (1, CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [startTime], [endTime]) VALUES (2, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [startTime], [endTime]) VALUES (3, CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [startTime], [endTime]) VALUES (4, CAST(N'15:00:00' AS Time), CAST(N'17:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [startTime], [endTime]) VALUES (5, CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [startTime], [endTime]) VALUES (6, CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time))
GO
INSERT [dbo].[Slot] ([slotId], [startTime], [endTime]) VALUES (7, CAST(N'21:00:00' AS Time), CAST(N'23:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategories] ON 
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (1, 1, N'Front-end Development')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (2, 1, N'Back-end Development')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (3, 1, N'Full-stack Development')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (4, 2, N'iOS Development')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (5, 2, N'Android Development')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (6, 3, N'SQL Server')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (7, 3, N'Oracle Database')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (8, 3, N'MySQL')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (9, 4, N'Java')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (10, 4, N'Python')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (11, 4, N'C++')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (12, 5, N'Machine Learning')
GO
INSERT [dbo].[SubCategories] ([subCategoryId], [categoryId], [subCategoryName]) VALUES (13, 5, N'Big Data Analytics')
GO
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'01', N'Thành phố Hà Nội', N'Thành phố Trung ương')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'02', N'Tỉnh Hà Giang', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'04', N'Tỉnh Cao Bằng', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'06', N'Tỉnh Bắc Kạn', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'08', N'Tỉnh Tuyên Quang', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'10', N'Tỉnh Lào Cai', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'11', N'Tỉnh Điện Biên', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'12', N'Tỉnh Lai Châu', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'14', N'Tỉnh Sơn La', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'15', N'Tỉnh Yên Bái', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'17', N'Tỉnh Hoà Bình', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'19', N'Tỉnh Thái Nguyên', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'20', N'Tỉnh Lạng Sơn', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'22', N'Tỉnh Quảng Ninh', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'24', N'Tỉnh Bắc Giang', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'25', N'Tỉnh Phú Thọ', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'26', N'Tỉnh Vĩnh Phúc', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'27', N'Tỉnh Bắc Ninh', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'30', N'Tỉnh Hải Dương', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'31', N'Thành phố Hải Phòng', N'Thành phố Trung ương')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'33', N'Tỉnh Hưng Yên', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'34', N'Tỉnh Thái Bình', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'35', N'Tỉnh Hà Nam', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'36', N'Tỉnh Nam Định', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'37', N'Tỉnh Ninh Bình', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'38', N'Tỉnh Thanh Hóa', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'40', N'Tỉnh Nghệ An', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'42', N'Tỉnh Hà Tĩnh', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'44', N'Tỉnh Quảng Bình', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'45', N'Tỉnh Quảng Trị', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'46', N'Tỉnh Thừa Thiên Huế', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'48', N'Thành phố Đà Nẵng', N'Thành phố Trung ương')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'49', N'Tỉnh Quảng Nam', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'51', N'Tỉnh Quảng Ngãi', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'52', N'Tỉnh Bình Định', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'54', N'Tỉnh Phú Yên', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'56', N'Tỉnh Khánh Hòa', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'58', N'Tỉnh Ninh Thuận', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'60', N'Tỉnh Bình Thuận', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'62', N'Tỉnh Kon Tum', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'64', N'Tỉnh Gia Lai', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'66', N'Tỉnh Đắk Lắk', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'67', N'Tỉnh Đắk Nông', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'68', N'Tỉnh Lâm Đồng', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'70', N'Tỉnh Bình Phước', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'72', N'Tỉnh Tây Ninh', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'74', N'Tỉnh Bình Dương', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'75', N'Tỉnh Đồng Nai', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'77', N'Tỉnh Bà Rịa - Vũng Tàu', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'79', N'Thành phố Hồ Chí Minh', N'Thành phố Trung ương')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'80', N'Tỉnh Long An', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'82', N'Tỉnh Tiền Giang', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'83', N'Tỉnh Bến Tre', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'84', N'Tỉnh Trà Vinh', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'86', N'Tỉnh Vĩnh Long', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'87', N'Tỉnh Đồng Tháp', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'89', N'Tỉnh An Giang', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'91', N'Tỉnh Kiên Giang', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'92', N'Thành phố Cần Thơ', N'Thành phố Trung ương')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'93', N'Tỉnh Hậu Giang', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'94', N'Tỉnh Sóc Trăng', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'95', N'Tỉnh Bạc Liêu', N'Tỉnh')
GO
INSERT [dbo].[tinhthanhpho] ([mattp], [name], [type]) VALUES (N'96', N'Tỉnh Cà Mau', N'Tỉnh')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([userId], [email], [password], [fName], [lName], [gender], [phoneNum], [roleId], [statusId], [address], [maqh], [facebook]) VALUES (1, N'admin@admin.com', N'123456', N'Admin', N'User', N'Male', N'123456', 1, 1, N'FPT', N'276', N'www.facebook.com/duythai.ddt/')
GO
INSERT [dbo].[Users] ([userId], [email], [password], [fName], [lName], [gender], [phoneNum], [roleId], [statusId], [address], [maqh], [facebook]) VALUES (2, N'mentor@mentor.com', N'123456', N'Mentor', N'User', N'Male', N'234567', 2, 1, N'FPT', N'276', N'www.facebook.com/duythai.ddt/')
GO
INSERT [dbo].[Users] ([userId], [email], [password], [fName], [lName], [gender], [phoneNum], [roleId], [statusId], [address], [maqh], [facebook]) VALUES (3, N'mentee@mentee.com', N'123456', N'Mentee', N'User', N'Male', N'345678', 3, 1, N'FPT', N'276', N'www.facebook.com/duythai.ddt/')
GO
INSERT [dbo].[Users] ([userId], [email], [password], [fName], [lName], [gender], [phoneNum], [roleId], [statusId], [address], [maqh], [facebook]) VALUES (4, N'thaiddhe176315@fpt.edu.vn', N'123456', N'Ðào', N'Duy Thái', N'Male', N'0796428094', 2, 1, N'FPT', N'276', N'www.facebook.com/duythai.ddt/')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserStatus] ON 
GO
INSERT [dbo].[UserStatus] ([statusID], [statusName]) VALUES (1, N'Active')
GO
INSERT [dbo].[UserStatus] ([statusID], [statusName]) VALUES (2, N'Unverified')
GO
INSERT [dbo].[UserStatus] ([statusID], [statusName]) VALUES (3, N'Locked')
GO
SET IDENTITY_INSERT [dbo].[UserStatus] OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([menteeId])
REFERENCES [dbo].[Mentees] ([menteeId])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([mentorId])
REFERENCES [dbo].[Mentors] ([mentorId])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([skillId])
REFERENCES [dbo].[Skills] ([skillId])
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([bookingId])
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD FOREIGN KEY([slotId])
REFERENCES [dbo].[Slot] ([slotId])
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD FOREIGN KEY([chatRoomId])
REFERENCES [dbo].[ChatRoom] ([chatRoomId])
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[ChatRoomUsers]  WITH CHECK ADD FOREIGN KEY([chatRoomId])
REFERENCES [dbo].[ChatRoom] ([chatRoomId])
GO
ALTER TABLE [dbo].[ChatRoomUsers]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Experience]  WITH CHECK ADD FOREIGN KEY([mentorId])
REFERENCES [dbo].[Mentors] ([mentorId])
GO
ALTER TABLE [dbo].[Expertise]  WITH CHECK ADD FOREIGN KEY([mentorId])
REFERENCES [dbo].[Mentors] ([mentorId])
GO
ALTER TABLE [dbo].[Expertise]  WITH CHECK ADD FOREIGN KEY([skillId])
REFERENCES [dbo].[Skills] ([skillId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([bookingId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([menteeId])
REFERENCES [dbo].[Mentees] ([menteeId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([mentorId])
REFERENCES [dbo].[Mentors] ([mentorId])
GO
ALTER TABLE [dbo].[MenteeInterests]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[MenteeInterests]  WITH CHECK ADD FOREIGN KEY([menteeId])
REFERENCES [dbo].[Mentees] ([menteeId])
GO
ALTER TABLE [dbo].[MenteeInterests]  WITH CHECK ADD FOREIGN KEY([skillId])
REFERENCES [dbo].[Skills] ([skillId])
GO
ALTER TABLE [dbo].[MenteeInterests]  WITH CHECK ADD FOREIGN KEY([subCategoryId])
REFERENCES [dbo].[SubCategories] ([subCategoryId])
GO
ALTER TABLE [dbo].[Mentees]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Mentors]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([bookingId])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[quanhuyen]  WITH CHECK ADD FOREIGN KEY([mattp])
REFERENCES [dbo].[tinhthanhpho] ([mattp])
GO
ALTER TABLE [dbo].[Skills]  WITH CHECK ADD FOREIGN KEY([subCategoryId])
REFERENCES [dbo].[SubCategories] ([subCategoryId])
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([maqh])
REFERENCES [dbo].[quanhuyen] ([maqh])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[UserStatus] ([statusID])
GO
USE [master]
GO
ALTER DATABASE [CodeCoach] SET  READ_WRITE 
GO
