Merge INTO [dbo].[Customers] AS target
USING (VALUES
    (1, 'Harry', 'Smith', 'harry.smith@example.com'),
    (2, 'Emily', 'Johnson', 'emily.johnson@example.com')
) AS source (CustomerID, FirstName, LastName, Email)
ON target.CustomerID = source.CustomerID
WHEN MATCHED THEN
    UPDATE SET
        FirstName = source.FirstName,
        LastName = source.LastName,
        Email = source.Email
WHEN NOT MATCHED THEN
    INSERT (CustomerID, FirstName, LastName, Email)
    VALUES (source.CustomerID, source.FirstName, source.LastName, source.Email);