/*
Run this script on:

(localdb)\MSSQLLocalDB.Anagrafica_empty    -  This database will be modified

to synchronize it with:

(localdb)\MSSQLLocalDB.Anagrafica

You are recommended to back up your database before running this script

Script created by SQL Data Compare version 15.0.9.23488 from Red Gate Software Ltd at 16/10/2025 16:05:55

*/
		
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
GO
SET DATEFORMAT YMD
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION

PRINT(N'Drop constraints from [anm].[PersoneAnimali]')
ALTER TABLE [anm].[PersoneAnimali] NOCHECK CONSTRAINT [FK_PersoneAnimali_Animali]
ALTER TABLE [anm].[PersoneAnimali] NOCHECK CONSTRAINT [FK_PersoneAnimali_Persone]

PRINT(N'Drop constraints from [ang].[SecondiNomi]')
ALTER TABLE [ang].[SecondiNomi] NOCHECK CONSTRAINT [FK_SecondiNomi_Persone]

PRINT(N'Drop constraints from [geo].[Capitali]')
ALTER TABLE [geo].[Capitali] NOCHECK CONSTRAINT [FK_Capitali_Citta]
ALTER TABLE [geo].[Capitali] NOCHECK CONSTRAINT [FK_Capitali_Nazioni]

PRINT(N'Drop constraints from [ang].[Persone]')
ALTER TABLE [ang].[Persone] NOCHECK CONSTRAINT [FK_Persone_Citta]

PRINT(N'Drop constraints from [geo].[Citta]')
ALTER TABLE [geo].[Citta] NOCHECK CONSTRAINT [FK_Citta_Nazioni]

PRINT(N'Drop constraints from [anm].[Animali]')
ALTER TABLE [anm].[Animali] NOCHECK CONSTRAINT [FK_Animali_TipoAnimale]

PRINT(N'Add rows to [anm].[TipoAnimale]')
SET IDENTITY_INSERT [anm].[TipoAnimale] ON
INSERT INTO [anm].[TipoAnimale] ([TipoAnimaleId], [TipoAnimale]) VALUES (1, N'Cane')
INSERT INTO [anm].[TipoAnimale] ([TipoAnimaleId], [TipoAnimale]) VALUES (2, N'Gatto')
INSERT INTO [anm].[TipoAnimale] ([TipoAnimaleId], [TipoAnimale]) VALUES (3, N'Criceto')
INSERT INTO [anm].[TipoAnimale] ([TipoAnimaleId], [TipoAnimale]) VALUES (4, N'Pesce rosso')
INSERT INTO [anm].[TipoAnimale] ([TipoAnimaleId], [TipoAnimale]) VALUES (5, N'Capra')
SET IDENTITY_INSERT [anm].[TipoAnimale] OFF
PRINT(N'Operation applied to 5 rows out of 5')

PRINT(N'Add rows to [geo].[Nazioni]')
SET IDENTITY_INSERT [geo].[Nazioni] ON
INSERT INTO [geo].[Nazioni] ([NazioneId], [NomeNazione]) VALUES (1, N'Italia')
INSERT INTO [geo].[Nazioni] ([NazioneId], [NomeNazione]) VALUES (2, N'Perù')
SET IDENTITY_INSERT [geo].[Nazioni] OFF
PRINT(N'Operation applied to 2 rows out of 2')

PRINT(N'Add rows to [anm].[Animali]')
SET IDENTITY_INSERT [anm].[Animali] ON
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (1, 1, N'Sally')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (2, 5, N'Ebbeè')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (3, 2, N'Eragon')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (4, 2, N'Saphira')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (5, 2, N'Monchino')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (6, 2, N'Maya')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (7, 2, N'Tony')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (8, 1, N'Dana')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (9, 1, N'Holly')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (10, 4, N'Diego')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (11, 4, N'Filippo')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (12, 2, N'Micia')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (13, 3, N'Sasà')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (14, 2, N'Rucola')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (15, 1, N'Noche')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (16, 1, N'Birba')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (17, 3, N'Eddy')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (18, 3, N'Eddy 2.0')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (19, 2, N'Nike')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (20, 2, N'Tigro')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (21, 1, N'Joe')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (22, 4, N'Pinco')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (23, 4, N'Palla')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (24, 1, N'Sasha')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (25, 2, N'Mizu')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (26, 1, N'Kermit')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (27, 1, N'Angie')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (28, 1, N'Asia')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (29, 1, N'Gin')
INSERT INTO [anm].[Animali] ([AnimaleId], [TipoAnimaleId], [NomeAnimale]) VALUES (30, 1, N'Lara')
SET IDENTITY_INSERT [anm].[Animali] OFF
PRINT(N'Operation applied to 30 rows out of 30')

PRINT(N'Add rows to [geo].[Citta]')
SET IDENTITY_INSERT [geo].[Citta] ON
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (1, 1, N'Torino')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (2, 1, N'Roma')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (3, 1, N'Genova')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (4, 1, N'Siena')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (5, 1, N'Chieri')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (6, 1, N'San Giovanni Rotondo')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (7, 1, N'Catania')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (8, 1, N'Potenza')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (9, 1, N'Moncalieri')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (10, 2, N'Cusco')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (11, 1, N'Rivoli')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (12, 1, N'Bari')
INSERT INTO [geo].[Citta] ([CittaId], [NazioneId], [NomeCitta]) VALUES (13, 1, N'Lecce')
SET IDENTITY_INSERT [geo].[Citta] OFF
PRINT(N'Operation applied to 13 rows out of 13')

PRINT(N'Add rows to [ang].[Persone]')
SET IDENTITY_INSERT [ang].[Persone] ON
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (3, 2, N'Francesca Romana', N'Signorelli', '1997-09-30', 1.70)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (4, 3, N'Tommaso', N'Trevisan', '2003-09-19', 1.76)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (5, 4, N'Duccio', N'Tarno', '2000-11-17', 1.80)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (6, 5, N'Viktor', N'Slicaru', '2005-10-04', 1.88)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (7, 6, N'Lidia', N'Rinaldi', '2000-09-05', 1.65)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (8, 7, N'Giulio', N'Pappalardo', '2003-05-29', 1.78)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (9, 8, N'Claudio', N'Raciti', '2001-04-05', 1.92)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (10, 9, N'Marta', N'Petruzzelli', '1997-12-17', 1.72)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (11, 5, N'Giacomo', N'Marchisio', '2004-05-21', 1.80)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (12, 10, N'Adriano', N'Garrafa', '1999-09-08', 1.70)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (13, 11, N'Stefano', N'Blinio', '2003-08-13', 1.80)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (14, 12, N'Andreina', N'Tritto', '1991-01-08', 1.61)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (15, 13, N'Marcello', N'Coppolino', '1995-10-07', 1.70)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (16, 1, N'Giovanni', N'Topor', '2001-06-04', 1.76)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (17, 2, N'Federico', N'Battisti', '1996-11-07', 1.85)
INSERT INTO [ang].[Persone] ([PersonaId], [CittaId], [Nome], [Cognome], [DataDiNascita], [Altezza]) VALUES (18, 1, N'Giovanni', N'Bertoglio', '1986-05-09', 1.90)
SET IDENTITY_INSERT [ang].[Persone] OFF
PRINT(N'Operation applied to 16 rows out of 16')

PRINT(N'Add row to [geo].[Capitali]')
SET IDENTITY_INSERT [geo].[Capitali] ON
INSERT INTO [geo].[Capitali] ([NazioneId], [CittaId]) VALUES (1, 2)
SET IDENTITY_INSERT [geo].[Capitali] OFF

PRINT(N'Add rows to [ang].[SecondiNomi]')
SET IDENTITY_INSERT [ang].[SecondiNomi] ON
INSERT INTO [ang].[SecondiNomi] ([SecondoNomeId], [PersonaId], [SecondoNome]) VALUES (1, 12, N'Valentino')
INSERT INTO [ang].[SecondiNomi] ([SecondoNomeId], [PersonaId], [SecondoNome]) VALUES (2, 16, N'Luigi')
INSERT INTO [ang].[SecondiNomi] ([SecondoNomeId], [PersonaId], [SecondoNome]) VALUES (3, 18, N'Francesco')
SET IDENTITY_INSERT [ang].[SecondiNomi] OFF
PRINT(N'Operation applied to 3 rows out of 3')

PRINT(N'Add rows to [anm].[PersoneAnimali]')
SET IDENTITY_INSERT [anm].[PersoneAnimali] ON
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (1, 3, 1)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (2, 3, 11)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (3, 4, 2)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (4, 4, 3)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (5, 4, 4)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (6, 4, 5)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (7, 5, 6)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (8, 5, 7)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (9, 5, 8)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (10, 6, 9)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (11, 9, 10)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (12, 10, 12)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (13, 10, 13)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (14, 11, 14)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (15, 12, 15)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (16, 13, 16)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (17, 13, 17)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (18, 13, 18)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (19, 14, 19)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (20, 15, 21)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (21, 15, 22)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (22, 15, 23)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (23, 15, 20)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (24, 16, 24)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (25, 16, 25)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (26, 17, 26)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (27, 17, 27)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (28, 17, 28)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (29, 17, 29)
INSERT INTO [anm].[PersoneAnimali] ([PersonaAnimaleId], [PersonaId], [AnimaleId]) VALUES (30, 17, 30)
SET IDENTITY_INSERT [anm].[PersoneAnimali] OFF
PRINT(N'Operation applied to 30 rows out of 30')

PRINT(N'Add constraints to [anm].[PersoneAnimali]')
ALTER TABLE [anm].[PersoneAnimali] WITH CHECK CHECK CONSTRAINT [FK_PersoneAnimali_Animali]
ALTER TABLE [anm].[PersoneAnimali] WITH CHECK CHECK CONSTRAINT [FK_PersoneAnimali_Persone]

PRINT(N'Add constraints to [ang].[SecondiNomi]')
ALTER TABLE [ang].[SecondiNomi] WITH CHECK CHECK CONSTRAINT [FK_SecondiNomi_Persone]

PRINT(N'Add constraints to [geo].[Capitali]')
ALTER TABLE [geo].[Capitali] WITH CHECK CHECK CONSTRAINT [FK_Capitali_Citta]
ALTER TABLE [geo].[Capitali] WITH CHECK CHECK CONSTRAINT [FK_Capitali_Nazioni]

PRINT(N'Add constraints to [ang].[Persone]')
ALTER TABLE [ang].[Persone] WITH CHECK CHECK CONSTRAINT [FK_Persone_Citta]

PRINT(N'Add constraints to [geo].[Citta]')
ALTER TABLE [geo].[Citta] WITH CHECK CHECK CONSTRAINT [FK_Citta_Nazioni]

PRINT(N'Add constraints to [anm].[Animali]')
ALTER TABLE [anm].[Animali] WITH CHECK CHECK CONSTRAINT [FK_Animali_TipoAnimale]
COMMIT TRANSACTION
GO
