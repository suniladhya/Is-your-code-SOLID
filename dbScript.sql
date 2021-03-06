/****** Object:  StoredProcedure [dbo].[AddRecord]    Script Date: 01/25/2011 22:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[AddRecord]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFile1]    Script Date: 01/25/2011 22:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteFile1]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteFile1]
GO
/****** Object:  StoredProcedure [dbo].[DeleteFile2]    Script Date: 01/25/2011 22:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteFile2]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteFile2]
GO
/****** Object:  StoredProcedure [dbo].[DeleteRecord]    Script Date: 01/25/2011 22:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DeleteRecord]
GO
/****** Object:  StoredProcedure [dbo].[GetRecordByID]    Script Date: 01/25/2011 22:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRecordByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[GetRecordByID]
GO
/****** Object:  StoredProcedure [dbo].[UpdateRecord]    Script Date: 01/25/2011 22:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRecord]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[UpdateRecord]
GO
/****** Object:  Table [dbo].[BoxDetails]    Script Date: 01/25/2011 22:18:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BoxDetails]') AND type in (N'U'))
DROP TABLE [dbo].[BoxDetails]
GO
/****** Object:  Table [dbo].[BoxDetails]    Script Date: 01/25/2011 22:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BoxDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BoxDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[ClientNumber] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[ClientLeader] [nvarchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[ReviewDate] [smalldatetime] NOT NULL,
	[Comments] [ntext] COLLATE Latin1_General_CI_AS NOT NULL,
	[FileLocation] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[FileLocation2] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[SecureStorage] [bit] NOT NULL,
	[BoxDetails] [ntext] COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_BoxDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[BoxDetails] ON
INSERT [dbo].[BoxDetails] ([ID], [ClientName], [ClientNumber], [ClientLeader], [ReviewDate], [Comments], [FileLocation], [FileLocation2], [SecureStorage], [BoxDetails]) VALUES (1, N'abc', N'123', N'John', CAST(0x9E5E0000 AS SmallDateTime), N'', N'BT.pdf', N'', 0, N'')
INSERT [dbo].[BoxDetails] ([ID], [ClientName], [ClientNumber], [ClientLeader], [ReviewDate], [Comments], [FileLocation], [FileLocation2], [SecureStorage], [BoxDetails]) VALUES (2, N'abc', N'123', N'abc', CAST(0x9E5E0000 AS SmallDateTime), N'', N'', N'', 0, N'')
INSERT [dbo].[BoxDetails] ([ID], [ClientName], [ClientNumber], [ClientLeader], [ReviewDate], [Comments], [FileLocation], [FileLocation2], [SecureStorage], [BoxDetails]) VALUES (7, N'Dodgy Data', N'321', N'Geezer', CAST(0x9FCB0000 AS SmallDateTime), N'', N'', N'', 0, N'')
INSERT [dbo].[BoxDetails] ([ID], [ClientName], [ClientNumber], [ClientLeader], [ReviewDate], [Comments], [FileLocation], [FileLocation2], [SecureStorage], [BoxDetails]) VALUES (8, N'Safe Data', N'123456', N'Simon Safe', CAST(0x9FCB0000 AS SmallDateTime), N'Mr Safe has paid for full year.', N'', N'', 1, N'')
SET IDENTITY_INSERT [dbo].[BoxDetails] OFF
/****** Object:  StoredProcedure [dbo].[UpdateRecord]    Script Date: 01/25/2011 22:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateRecord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateRecord]
	@ID int,
	@ClientName nvarchar(50),
    @ClientNumber nvarchar(50),
    @ClientLeader nvarchar(50),
    @ReviewDate smalldatetime,
    @Comments ntext,
    @FileLocation varchar(50),
    @FileLocation2 varchar(50),
    @SecureStorage bit,
    @BoxDetails ntext
AS
BEGIN

	SET NOCOUNT ON;

UPDATE [dbo].[BoxDetails]
   SET [ClientName] = @ClientName,
      [ClientNumber] = @ClientNumber,
      [ClientLeader] = @ClientLeader,
      [ReviewDate] = @ReviewDate,
      [Comments] = @Comments,
      [FileLocation] = @FileLocation,
      [FileLocation2] = @FileLocation2,
      [SecureStorage] = @SecureStorage,
      [BoxDetails] = @BoxDetails
 WHERE ID = @ID


END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetRecordByID]    Script Date: 01/25/2011 22:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetRecordByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetRecordByID]
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

	SELECT [ID]
		  ,[ClientName]
		  ,[ClientNumber]
		  ,[ClientLeader]
		  ,[ReviewDate]
		  ,[Comments]
		  ,[FileLocation]
		  ,[FileLocation2]
		  ,[SecureStorage]
		  ,[BoxDetails]
	  FROM [dbo].[BoxDetails]
	  WHERE ID = @ID 
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteRecord]    Script Date: 01/25/2011 22:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteRecord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteRecord]
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

	DELETE [dbo].[BoxDetails]
    WHERE ID = @ID
      
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFile2]    Script Date: 01/25/2011 22:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteFile2]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteFile2]
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE BoxDetails
	SET FileLocation2 = ''''
	WHERE ID = @ID
      
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFile1]    Script Date: 01/25/2011 22:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteFile1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteFile1]
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE BoxDetails
	SET FileLocation = ''''
	WHERE ID = @ID
      
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddRecord]    Script Date: 01/25/2011 22:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AddRecord]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddRecord]
	@ClientName nvarchar(50),
    @ClientNumber nvarchar(50),
    @ClientLeader nvarchar(50),
    @ReviewDate smalldatetime,
    @Comments ntext,
    @FileLocation varchar(50),
    @FileLocation2 varchar(50),
    @SecureStorage varchar(50),
    @BoxDetails ntext
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[BoxDetails]
           ([ClientName]
           ,[ClientNumber]
           ,[ClientLeader]
           ,[ReviewDate]
           ,[Comments]
           ,[FileLocation]
           ,[FileLocation2]
           ,[SecureStorage]
           ,[BoxDetails])
     VALUES
           (
				@ClientName,
				@ClientNumber,
				@ClientLeader,
				@ReviewDate,
				@Comments,
				@FileLocation,
				@FileLocation2,
				@SecureStorage,
				@BoxDetails
			)

	RETURN SCOPE_IDENTITY()

END
' 
END
GO
