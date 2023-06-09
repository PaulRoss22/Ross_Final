USE [master]
GO
/****** Object:  Database [DMV]    Script Date: 5/12/2023 11:34:38 PM ******/
CREATE DATABASE [DMV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DMV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DMV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DMV] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMV] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMV] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DMV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMV] SET RECOVERY FULL 
GO
ALTER DATABASE [DMV] SET  MULTI_USER 
GO
ALTER DATABASE [DMV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DMV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMV', N'ON'
GO
ALTER DATABASE [DMV] SET QUERY_STORE = OFF
GO
USE [DMV]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 5/12/2023 11:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverId] [varchar](10) NOT NULL,
	[DriverFirstName] [varchar](52) NOT NULL,
	[DriverLastName] [varchar](52) NOT NULL,
	[DriverSSN] [varchar](11) NOT NULL,
	[DriverGender] [varchar](1) NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Infraction]    Script Date: 5/12/2023 11:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Infraction](
	[InfractionId] [varchar](10) NOT NULL,
	[InfractionType] [varchar](100) NOT NULL,
	[InfractionPenalty] [varchar](25) NULL,
	[InfractionFine] [varchar](25) NULL,
	[InfractionSentence] [varchar](52) NULL,
 CONSTRAINT [PK_Infraction] PRIMARY KEY CLUSTERED 
(
	[InfractionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InfractionInfo]    Script Date: 5/12/2023 11:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfractionInfo](
	[UsersId] [varchar](10) NOT NULL,
	[DriverId] [varchar](10) NOT NULL,
	[InfractionId] [varchar](10) NOT NULL,
	[VehicleId] [varchar](10) NOT NULL,
	[DateofInfraction] [date] NULL,
 CONSTRAINT [PK_InfractionInfo] PRIMARY KEY CLUSTERED 
(
	[UsersId] ASC,
	[DriverId] ASC,
	[InfractionId] ASC,
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/12/2023 11:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UsersId] [varchar](10) NOT NULL,
	[UsersFirstName] [varchar](52) NOT NULL,
	[UsersLastName] [varchar](52) NOT NULL,
	[UsersEmployer] [varchar](25) NOT NULL,
	[UsesrUserName] [varchar](25) NOT NULL,
	[UsersPassword] [varchar](52) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 5/12/2023 11:34:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleId] [varchar](10) NOT NULL,
	[DriverId] [varchar](10) NOT NULL,
	[VehicleLicensePlate] [varchar](10) NOT NULL,
	[VehicleMake] [varchar](52) NOT NULL,
	[VehicleModel] [varchar](52) NOT NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D01', N'Dorian', N'Guzman', N'011-42-1171', N'F')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D02', N'Dollie', N'Gentry', N'522-77-6843', N'F')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D03', N'Shirley', N'O''Connell', N'532-69-0231', N'F')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D04', N'Merlin', N'Bauer', N'009-38-1036', N'M')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D05', N'Vern', N'Daugherty', N'416-61-3070', N'M')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D06', N'Bertram', N'Jordan', N'545-63-4293', N'M')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D07', N'Ginger', N'Nicholson', N'510-66-6712', N'F')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D08', N'Conrad', N'Huffman', N'009-52-2930', N'M')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D09', N'Trina', N'Avila', N'253-91-4407', N'F')
INSERT [dbo].[Driver] ([DriverId], [DriverFirstName], [DriverLastName], [DriverSSN], [DriverGender]) VALUES (N'D10', N'Parker', N'Faulkner', N'517-25-1079', N'M')
GO
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I01', N'Speeding', N'Citation', N'$100-$300', N'N/A')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I02', N'Distracted driving', N'Citation', N'$100-$300', N'N/A')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I03', N'Running a red light/stop sign', N'Citation', N'$100-$300', N'N/A')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I04', N'Driving under the influence', N'Felony', N'$500-$15000', N'Jail')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I05', N'Reckless driving', N'Misdemeanor', N'$100-$1000', N'N/A')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I06', N'Driving without a valid driver''s license', N'Misdemeanor', N'$100-$1500', N'N/A')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I07', N'Hit and run', N'Felony', N'$500-$15000', N'Jail')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I08', N'License plate ticket', N'Citation', N'$100-$200', N'N/A')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I09', N'Failure to wear a seatbelt', N'Citation', N'$75-$200', N'N/A')
INSERT [dbo].[Infraction] ([InfractionId], [InfractionType], [InfractionPenalty], [InfractionFine], [InfractionSentence]) VALUES (N'I10', N'Window tint', N'Citation', NULL, NULL)
GO
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U01', N'D01', N'I01', N'V01', CAST(N'2022-05-24' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U02', N'D02', N'I02', N'V02', CAST(N'2023-06-13' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U02', N'D04', N'I09', N'V04', NULL)
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U03', N'D03', N'I03', N'V03', CAST(N'2023-11-14' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U04', N'D04', N'I04', N'V04', CAST(N'2022-12-30' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U04', N'D04', N'I09', N'V04', NULL)
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U05', N'D05', N'I05', N'V05', CAST(N'2023-11-17' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U06', N'D06', N'I06', N'V06', CAST(N'2022-10-25' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U07', N'D07', N'I07', N'V07', CAST(N'2023-04-25' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U08', N'D08', N'I08', N'V08', CAST(N'2023-01-11' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U09', N'D04', N'I09', N'V04', NULL)
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U09', N'D09', N'I09', N'V09', CAST(N'2023-02-15' AS Date))
INSERT [dbo].[InfractionInfo] ([UsersId], [DriverId], [InfractionId], [VehicleId], [DateofInfraction]) VALUES (N'U10', N'D10', N'I10', N'V10', CAST(N'2023-11-14' AS Date))
GO
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U01', N'Caroline', N'Greer', N'DMV', N'DMVcgreer', N'f3euVdqEwSZ6')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U02', N'Roseanna', N'Freeman', N'DMV', N'DMVrfreeman', N'U7yc3ZgbwULg')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U03', N'Raihan', N'Daniels', N'DMV', N'DMVrdaniels', N'j8XUu783V5yK')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U04', N'Ilyas', N'Dunn', N'DMV', N'DMVidunn', N'SJzRZmcSvXES')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U05', N'Filip', N'Austin', N'DMV', N'DMVfaustin', N'brNCcWHKZcFk')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U06', N'Ellis', N'Harrell', N'LAW', N'LAWeharrell', N'3YRMwMcCwHEf')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U07', N'Kelly', N'Walters', N'LAW', N'LAWkwalters', N'w8zRk9ddNnyb')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U08', N'Elif', N'Peck', N'LAW', N'LAWepeck', N'wVSrLzp9Pph8')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U09', N'Joe', N'Wade', N'LAW', N'LAWjwade', N'nbhBr8mchjTB')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U10', N'Terence', N'Gentry', N'LAW', N'LAWtgentry', N'QSxxjKY2LK9B')
INSERT [dbo].[Users] ([UsersId], [UsersFirstName], [UsersLastName], [UsersEmployer], [UsesrUserName], [UsersPassword]) VALUES (N'U12', N'Jon', N'Law', N'LAW', N'LAWjlaw', N'Dssawwe4')
GO
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V01', N'D01', N'UL4R1Z', N'Ford', N'Fiesta')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V02', N'D02', N'701 PJX', N'Audi', N'A4')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V03', N'D03', N'KDF3642', N'Toyota', N'Prius')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V04', N'D04', N'853 QNQ', N'BMW', N'i3')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V05', N'D05', N'GDM251', N'Mitsubishi', N'ASX')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V06', N'D06', N'CJ57329', N'Renault', N'Captur')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V07', N'D07', N'5DTU808', N'Honda ', N'Pilot')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V08', N'D08', N'5ZHF731', N'Hyundai', N'Santa Fe')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V09', N'D09', N'D93 GZP', N'Acura', N'RDX')
INSERT [dbo].[Vehicle] ([VehicleId], [DriverId], [VehicleLicensePlate], [VehicleMake], [VehicleModel]) VALUES (N'V10', N'D10', N'DJR7578', N'Hyundai', N'Tucson')
GO
ALTER TABLE [dbo].[InfractionInfo]  WITH CHECK ADD  CONSTRAINT [FK_InfractionInfo_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([DriverId])
GO
ALTER TABLE [dbo].[InfractionInfo] CHECK CONSTRAINT [FK_InfractionInfo_Driver]
GO
ALTER TABLE [dbo].[InfractionInfo]  WITH CHECK ADD  CONSTRAINT [FK_InfractionInfo_Infraction] FOREIGN KEY([InfractionId])
REFERENCES [dbo].[Infraction] ([InfractionId])
GO
ALTER TABLE [dbo].[InfractionInfo] CHECK CONSTRAINT [FK_InfractionInfo_Infraction]
GO
ALTER TABLE [dbo].[InfractionInfo]  WITH CHECK ADD  CONSTRAINT [FK_InfractionInfo_Users] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([UsersId])
GO
ALTER TABLE [dbo].[InfractionInfo] CHECK CONSTRAINT [FK_InfractionInfo_Users]
GO
ALTER TABLE [dbo].[InfractionInfo]  WITH CHECK ADD  CONSTRAINT [FK_InfractionInfo_Vehicle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehicle] ([VehicleId])
GO
ALTER TABLE [dbo].[InfractionInfo] CHECK CONSTRAINT [FK_InfractionInfo_Vehicle]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([DriverId])
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Driver]
GO
USE [master]
GO
ALTER DATABASE [DMV] SET  READ_WRITE 
GO
