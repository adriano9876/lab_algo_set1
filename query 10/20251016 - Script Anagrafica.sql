USE [master];
GO
IF NOT EXISTS (
SELECT name
FROM sys.databases
WHERE name = N'Anagrafica')

CREATE DATABASE Anagrafica;
GO

USE Anagrafica

/*
Run this script on:

        (localdb)\MSSQLLocalDB.Academy    -  This database will be modified

to synchronize it with:

        (localdb)\MSSQLLocalDB.Academy_empty

You are recommended to back up your database before running this script

Script created by SQL Compare version 15.0.9.23488 from Red Gate Software Ltd at 16/10/2025 08:30:04

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating schemas'
GO
CREATE SCHEMA [ang]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [anm]
AUTHORIZATION [dbo]
GO
CREATE SCHEMA [geo]
AUTHORIZATION [dbo]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [anm].[TipoAnimale]'
GO
CREATE TABLE [anm].[TipoAnimale]
(
[TipoAnimaleId] [smallint] NOT NULL IDENTITY(1, 1),
[TipoAnimale] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__TipoAnim__4D69268B016EA947] on [anm].[TipoAnimale]'
GO
ALTER TABLE [anm].[TipoAnimale] ADD CONSTRAINT [PK__TipoAnim__4D69268B016EA947] PRIMARY KEY CLUSTERED ([TipoAnimaleId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [anm].[Animali]'
GO
CREATE TABLE [anm].[Animali]
(
[AnimaleId] [smallint] NOT NULL IDENTITY(1, 1),
[TipoAnimaleId] [smallint] NOT NULL,
[NomeAnimale] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Animali__2DBB11059F5D3844] on [anm].[Animali]'
GO
ALTER TABLE [anm].[Animali] ADD CONSTRAINT [PK__Animali__2DBB11059F5D3844] PRIMARY KEY CLUSTERED ([AnimaleId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [geo].[Citta]'
GO
CREATE TABLE [geo].[Citta]
(
[CittaId] [smallint] NOT NULL IDENTITY(1, 1),
[NazioneId] [smallint] NOT NULL,
[NomeCitta] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Citta__B733441CF322802D] on [geo].[Citta]'
GO
ALTER TABLE [geo].[Citta] ADD CONSTRAINT [PK__Citta__B733441CF322802D] PRIMARY KEY CLUSTERED ([CittaId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [geo].[Capitali]'
GO
CREATE TABLE [geo].[Capitali]
(
[NazioneId] [smallint] NOT NULL IDENTITY(1, 1),
[CittaId] [smallint] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Capitali__E2D801AA4D6FEC52] on [geo].[Capitali]'
GO
ALTER TABLE [geo].[Capitali] ADD CONSTRAINT [PK__Capitali__E2D801AA4D6FEC52] PRIMARY KEY CLUSTERED ([NazioneId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating index [IX_Capitali] on [geo].[Capitali]'
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Capitali] ON [geo].[Capitali] ([CittaId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [geo].[Nazioni]'
GO
CREATE TABLE [geo].[Nazioni]
(
[NazioneId] [smallint] NOT NULL IDENTITY(1, 1),
[NomeNazione] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Nazioni__E2D801AA2F187655] on [geo].[Nazioni]'
GO
ALTER TABLE [geo].[Nazioni] ADD CONSTRAINT [PK__Nazioni__E2D801AA2F187655] PRIMARY KEY CLUSTERED ([NazioneId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [ang].[Persone]'
GO
CREATE TABLE [ang].[Persone]
(
[PersonaId] [smallint] NOT NULL IDENTITY(1, 1),
[CittaId] [smallint] NOT NULL,
[Nome] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Cognome] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DataDiNascita] [date] NOT NULL,
[Altezza] [numeric] (3, 2) NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Persone__7C34D303A5133862] on [ang].[Persone]'
GO
ALTER TABLE [ang].[Persone] ADD CONSTRAINT [PK__Persone__7C34D303A5133862] PRIMARY KEY CLUSTERED ([PersonaId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [anm].[PersoneAnimali]'
GO
CREATE TABLE [anm].[PersoneAnimali]
(
[PersonaAnimaleId] [smallint] NOT NULL IDENTITY(1, 1),
[PersonaId] [smallint] NOT NULL,
[AnimaleId] [smallint] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__PersoneA__E9C0A7161012A8CE] on [anm].[PersoneAnimali]'
GO
ALTER TABLE [anm].[PersoneAnimali] ADD CONSTRAINT [PK__PersoneA__E9C0A7161012A8CE] PRIMARY KEY CLUSTERED ([PersonaAnimaleId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [ang].[SecondiNomi]'
GO
CREATE TABLE [ang].[SecondiNomi]
(
[SecondoNomeId] [smallint] NOT NULL IDENTITY(1, 1),
[PersonaId] [smallint] NOT NULL,
[SecondoNome] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__SecondiN__5E90A5D6AAD00830] on [ang].[SecondiNomi]'
GO
ALTER TABLE [ang].[SecondiNomi] ADD CONSTRAINT [PK__SecondiN__5E90A5D6AAD00830] PRIMARY KEY CLUSTERED ([SecondoNomeId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [ang].[Persone]'
GO
ALTER TABLE [ang].[Persone] ADD CONSTRAINT [FK_Persone_Citta] FOREIGN KEY ([CittaId]) REFERENCES [geo].[Citta] ([CittaId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [ang].[SecondiNomi]'
GO
ALTER TABLE [ang].[SecondiNomi] ADD CONSTRAINT [FK_SecondiNomi_Persone] FOREIGN KEY ([PersonaId]) REFERENCES [ang].[Persone] ([PersonaId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [anm].[Animali]'
GO
ALTER TABLE [anm].[Animali] ADD CONSTRAINT [FK_Animali_TipoAnimale] FOREIGN KEY ([TipoAnimaleId]) REFERENCES [anm].[TipoAnimale] ([TipoAnimaleId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [anm].[PersoneAnimali]'
GO
ALTER TABLE [anm].[PersoneAnimali] ADD CONSTRAINT [FK_PersoneAnimali_Animali] FOREIGN KEY ([AnimaleId]) REFERENCES [anm].[Animali] ([AnimaleId])
GO
ALTER TABLE [anm].[PersoneAnimali] ADD CONSTRAINT [FK_PersoneAnimali_Persone] FOREIGN KEY ([PersonaId]) REFERENCES [ang].[Persone] ([PersonaId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [geo].[Capitali]'
GO
ALTER TABLE [geo].[Capitali] ADD CONSTRAINT [FK_Capitali_Citta] FOREIGN KEY ([CittaId]) REFERENCES [geo].[Citta] ([CittaId])
GO
ALTER TABLE [geo].[Capitali] ADD CONSTRAINT [FK_Capitali_Nazioni] FOREIGN KEY ([NazioneId]) REFERENCES [geo].[Nazioni] ([NazioneId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [geo].[Citta]'
GO
ALTER TABLE [geo].[Citta] ADD CONSTRAINT [FK_Citta_Nazioni] FOREIGN KEY ([NazioneId]) REFERENCES [geo].[Nazioni] ([NazioneId])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
