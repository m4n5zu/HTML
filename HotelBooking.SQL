IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
    DROP TABLE [dbo].[User]
GO
CREATE TABLE [dbo].[User] (
[IdUser] CHAR(10)  NOT NULL  
, [Username] VARCHAR(48)  NOT NULL  
, [email] VARCHAR(255)  NOT NULL  
, [Phone] VARCHAR(15)  NOT NULL  
, [IdCountry] INTEGER  NULL  
)
GO

ALTER TABLE [dbo].[User] ADD CONSTRAINT [User_PK] PRIMARY KEY CLUSTERED (
[IdUser]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DictCountry]') AND type in (N'U'))
    DROP TABLE [dbo].[DictCountry]
GO
CREATE TABLE [dbo].[DictCountry] (
[IdCountry] INTEGER  NOT NULL  
, [CountryName] VARCHAR(80)  NOT NULL  
, [CountryShortName] VARCHAR(4)  NOT NULL  
)
GO

ALTER TABLE [dbo].[DictCountry] ADD CONSTRAINT [DictCountry_PK] PRIMARY KEY CLUSTERED (
[IdCountry]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booking]') AND type in (N'U'))
    DROP TABLE [dbo].[Booking]
GO
CREATE TABLE [dbo].[Booking] (
[IdBooking] INTEGER  NOT NULL  
, [BookingDate] DATETIME  NOT NULL  
, [NumOfGuests] CHAR(4)  NULL  
, [MealRequ] BIT  NULL  
, [BalconyRequ] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[Booking] ADD CONSTRAINT [Booking_PK] PRIMARY KEY CLUSTERED (
[IdBooking]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booking_User]') AND type in (N'U'))
    DROP TABLE [dbo].[Booking_User]
GO
CREATE TABLE [dbo].[Booking_User] (
[IdBooking] INTEGER  NOT NULL  
, [IdUser] CHAR(10)  NOT NULL  
, [DateTime] DATETIME  NOT NULL  
)
GO

ALTER TABLE [dbo].[Booking_User] ADD CONSTRAINT [Booking_User_PK] PRIMARY KEY CLUSTERED (
[IdBooking]
, [IdUser]
, [DateTime]
)
GO
GO

ALTER TABLE [dbo].[User] WITH CHECK ADD CONSTRAINT [DictCountry_User_FK1] FOREIGN KEY (
[IdCountry]
)
REFERENCES [dbo].[DictCountry] (
[IdCountry]
)
GO

GO

GO

ALTER TABLE [dbo].[Booking_User] WITH CHECK ADD CONSTRAINT [Booking_Booking_User_FK1] FOREIGN KEY (
[IdBooking]
)
REFERENCES [dbo].[Booking] (
[IdBooking]
)
ALTER TABLE [dbo].[Booking_User] WITH CHECK ADD CONSTRAINT [User_Booking_User_FK1] FOREIGN KEY (
[IdUser]
)
REFERENCES [dbo].[User] (
[IdUser]
)
GO

