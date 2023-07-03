CREATE TRIGGER trg_CreateMentee
ON Users
AFTER INSERT
AS
BEGIN
    -- Insert into Mentees table
    INSERT INTO Mentees (userId)
    SELECT i.userId
    FROM inserted i;
END;




