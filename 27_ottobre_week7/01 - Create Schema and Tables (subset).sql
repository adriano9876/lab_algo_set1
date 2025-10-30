USE [master];
GO
IF NOT EXISTS (
SELECT name
FROM sys.databases
WHERE name = N'MusicStreaming')

CREATE DATABASE MusicStreaming;
GO

USE MusicStreaming;

GO

/*
Run this script on:

        (localdb)\MSSQLLocalDB.MusicStreaming_Light_Empty    -  This database will be modified

to synchronize it with:

        (localdb)\MSSQLLocalDB.MusicStreaming_Light

You are recommended to back up your database before running this script

Script created by SQL Compare version 15.0.9.23488 from Red Gate Software Ltd at 28/10/2025 14:56:43

*/
SET NUMERIC_ROUNDABORT OFF;
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON;
GO
SET XACT_ABORT ON;
GO
SET TRANSACTION ISOLATION LEVEL Serializable;
GO
BEGIN TRANSACTION;
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating schemas';
GO
CREATE SCHEMA [music]
AUTHORIZATION [dbo];
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating [music].[Albums]';
GO
CREATE TABLE [music].[Albums]
(
[AlbumId] [int] NOT NULL IDENTITY(1, 1),
[AlbumTitle] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ReleaseYear] [int] NULL
);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating primary key [PK__Albums] on [music].[Albums]';
GO
ALTER TABLE [music].[Albums] ADD CONSTRAINT [PK__Albums] PRIMARY KEY CLUSTERED ([AlbumId]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating [music].[Tracks]';
GO
CREATE TABLE [music].[Tracks]
(
[TrackId] [int] NOT NULL IDENTITY(1, 1),
[AlbumId] [int] NOT NULL,
[GenreId] [int] NOT NULL,
[TrackTitle] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Duration] [int] NOT NULL
);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating primary key [PK__Tracks] on [music].[Tracks]';
GO
ALTER TABLE [music].[Tracks] ADD CONSTRAINT [PK__Tracks] PRIMARY KEY CLUSTERED ([TrackId]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating [music].[Artists]';
GO
CREATE TABLE [music].[Artists]
(
[ArtistId] [int] NOT NULL IDENTITY(1, 1),
[ArtistName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating primary key [PK__Artists] on [music].[Artists]';
GO
ALTER TABLE [music].[Artists] ADD CONSTRAINT [PK__Artists] PRIMARY KEY CLUSTERED ([ArtistId]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating [music].[TrackAuthors]';
GO
CREATE TABLE [music].[TrackAuthors]
(
[TrackAuthorId] [int] NOT NULL IDENTITY(1, 1),
[TrackId] [int] NOT NULL,
[ArtistId] [int] NOT NULL
);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating primary key [PK_TrackCollaborations] on [music].[TrackAuthors]';
GO
ALTER TABLE [music].[TrackAuthors] ADD CONSTRAINT [PK_TrackCollaborations] PRIMARY KEY CLUSTERED ([TrackAuthorId]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating [music].[Genres]';
GO
CREATE TABLE [music].[Genres]
(
[GenreId] [int] NOT NULL IDENTITY(1, 1),
[GenreName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating primary key [PK__Genres] on [music].[Genres]';
GO
ALTER TABLE [music].[Genres] ADD CONSTRAINT [PK__Genres] PRIMARY KEY CLUSTERED ([GenreId]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Creating index [NIX_Genres_Name] on [music].[Genres]';
GO
CREATE UNIQUE NONCLUSTERED INDEX [NIX_Genres_Name] ON [music].[Genres] ([GenreName]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Adding foreign keys to [music].[TrackAuthors]';
GO
ALTER TABLE [music].[TrackAuthors] WITH NOCHECK  ADD CONSTRAINT [FK_TrackCollaborations_Artists] FOREIGN KEY ([ArtistId]) REFERENCES [music].[Artists] ([ArtistId]);
GO
ALTER TABLE [music].[TrackAuthors] WITH NOCHECK  ADD CONSTRAINT [FK_TrackCollaborations_Tracks1] FOREIGN KEY ([TrackId]) REFERENCES [music].[Tracks] ([TrackId]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
PRINT N'Adding foreign keys to [music].[Tracks]';
GO
ALTER TABLE [music].[Tracks] WITH NOCHECK  ADD CONSTRAINT [FK_Tracks_Album] FOREIGN KEY ([AlbumId]) REFERENCES [music].[Albums] ([AlbumId]);
GO
ALTER TABLE [music].[Tracks] WITH NOCHECK  ADD CONSTRAINT [FK_Tracks_Genre] FOREIGN KEY ([GenreId]) REFERENCES [music].[Genres] ([GenreId]);
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
COMMIT TRANSACTION;
GO
IF @@ERROR <> 0 SET NOEXEC ON;
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048);
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"');
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}';
    EXECUTE sys.xp_logevent 55000, @eventMessage;
END;
GO
DECLARE @Success AS BIT;
SET @Success = 1;
SET NOEXEC OFF;
IF (@Success = 1) PRINT 'The database update succeeded';
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
	PRINT 'The database update failed';
END;
GO



INSERT INTO [music].[TrackAuthors] ([TrackId], [ArtistId]) VALUES (18983, 150)
INSERT INTO [music].[TrackAuthors] ([TrackId], [ArtistId]) VALUES (18983, 700)
INSERT INTO [music].[TrackAuthors] ([TrackId], [ArtistId]) VALUES (18936, 680)
