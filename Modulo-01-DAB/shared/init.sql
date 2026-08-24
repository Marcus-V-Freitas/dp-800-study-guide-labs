IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DemoDb')
BEGIN
    CREATE DATABASE DemoDb;
END
GO
USE DemoDb;
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
    CREATE TABLE dbo.Products (
        Id INT NOT NULL PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL,
        Price DECIMAL(18, 2) NOT NULL
    );
    INSERT INTO dbo.Products (Id, Name, Price)
    VALUES
        (1, 'Notebook', 5000.00),
        (2, 'Mouse', 100.00),
        (3, 'Keyboard', 250.00),
        (4, 'Monitor', 1500.00),
        (5, 'Mousepad', 50.00),
        (6, 'Webcam', 450.00);
END
GO
