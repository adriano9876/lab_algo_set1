BEGIN TRY
    BEGIN TRANSACTION;

    -- Tabella Users
    CREATE TABLE Users (
        Id INT PRIMARY KEY IDENTITY(1,1),
        Nome NVARCHAR(100) NOT NULL,
        Email NVARCHAR(255) UNIQUE NOT NULL,
        DataRegistrazione DATETIME DEFAULT GETDATE()
    );

    -- Tabella Fotos
    CREATE TABLE Fotos (
        Id INT PRIMARY KEY IDENTITY(1,1),
        UserId INT NOT NULL,
        Percorso NVARCHAR(500) NOT NULL,
        Descrizione NVARCHAR(255),
        DataCaricamento DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (UserId) REFERENCES Users(Id)  ON DELETE CASCADE
    );

    -- Tabella Comments
    CREATE TABLE Comments (
        Id INT PRIMARY KEY IDENTITY(1,1),
        FotoId INT NOT NULL,
        UserId INT NOT NULL,
        Testo NVARCHAR(1000) NOT NULL,
        DataCommento DATETIME DEFAULT GETDATE(),
        FOREIGN KEY (FotoId) REFERENCES Fotos(Id)  ON DELETE CASCADE,
        FOREIGN KEY (UserId) REFERENCES Users(Id)  ON DELETE CASCADE
    );

    COMMIT TRANSACTION;
    PRINT 'Tabelle create con successo.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Errore durante la creazione delle tabelle:';
    PRINT ERROR_MESSAGE();
END CATCH;
