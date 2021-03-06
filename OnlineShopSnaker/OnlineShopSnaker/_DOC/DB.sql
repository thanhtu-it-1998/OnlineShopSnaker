USE [master]
GO
/****** Object:  Database [ShoppingSneaker]    Script Date: 11/26/2020 5:29:43 PM ******/
DROP DATABASE [ShoppingSneaker]
GO
CREATE DATABASE [ShoppingSneaker]

ALTER DATABASE [ShoppingSneaker] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingSneaker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingSneaker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoppingSneaker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingSneaker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingSneaker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingSneaker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingSneaker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingSneaker] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingSneaker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingSneaker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingSneaker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingSneaker] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoppingSneaker] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShoppingSneaker]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/26/2020 5:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/26/2020 5:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [nvarchar](50) NOT NULL,
	[Firstname] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryAddresses]    Script Date: 11/26/2020 5:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryAddresses](
	[ID] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK_DeliveryAddresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 11/26/2020 5:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [nvarchar](50) NOT NULL,
	[CustomerID] [nvarchar](50) NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 11/26/2020 5:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[ID] [nvarchar](50) NOT NULL,
	[OrderID] [nvarchar](50) NULL,
	[ProductID] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/26/2020 5:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [nvarchar](50) NOT NULL,
	[CustomerID] [nvarchar](50) NULL,
	[DeliveryAddID] [nvarchar](50) NULL,
	[PaymentType] [nvarchar](100) NULL,
	[Date] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/26/2020 5:29:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [nvarchar](50) NOT NULL,
	[CategoryID] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Price] [float] NULL,
	[Gender] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Customers]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Orders]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_DeliveryAddresses] FOREIGN KEY([DeliveryAddID])
REFERENCES [dbo].[DeliveryAddresses] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_DeliveryAddresses]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [ShoppingSneaker] SET  READ_WRITE 
GO
