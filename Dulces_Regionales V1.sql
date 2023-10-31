USE [master]
GO
/****** Object:  Database [Dulces_Regionales_Los_Robles]    Script Date: 30/10/2023 09:11:24 p. m. ******/
CREATE DATABASE [Dulces_Regionales_Los_Robles]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dulces_Regionales_Los_Robles', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Dulces_Regionales_Los_Robles.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dulces_Regionales_Los_Robles_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Dulces_Regionales_Los_Robles_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dulces_Regionales_Los_Robles].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET RECOVERY FULL 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET  MULTI_USER 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dulces_Regionales_Los_Robles', N'ON'
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET QUERY_STORE = OFF
GO
USE [Dulces_Regionales_Los_Robles]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 30/10/2023 09:11:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](50) NOT NULL,
	[Descripción] [varchar](200) NOT NULL,
 CONSTRAINT [PK__Categori__F353C1C51DC10B6F] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 30/10/2023 09:11:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCliente] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
 CONSTRAINT [PK__Clientes__71ABD0A70E012BD9] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesVenta]    Script Date: 30/10/2023 09:11:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesVenta](
	[DetalleID] [int] IDENTITY(1,1) NOT NULL,
	[VentaID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](10, 2) NOT NULL,
	[PrecioTotal]  AS ([Cantidad]*[PrecioUnitario]),
PRIMARY KEY CLUSTERED 
(
	[DetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 30/10/2023 09:11:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](100) NOT NULL,
	[DescripcionProducto] [varchar](200) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[CategoriaID] [int] NULL,
 CONSTRAINT [PK__Producto__A430AE83B64B50CE] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 30/10/2023 09:11:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ClienteID] [int] NOT NULL,
 CONSTRAINT [PK__Ventas__5B41514CFF635268] PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (1, N'Tradicionales', N'Dulces de leche: cajeta, leche condensada; Ate de frutas; Dulces de tamarindo; Dulces de cacahuate;')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (2, N'Dulces de coco', N'Cocadas, Dulce de coco rayado, Rollos de coco')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (3, N'Dulces de Caramelos', N'Cajeta de celaya, Caramelos suaves o duros')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (4, N'Dulces picantes', N'Mango enchilado, Gomitas enchiladas, Papas enchiladas, Chamoy, Tamarindos enchilados')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (5, N'Dulces de chocolate', N'De mesa, Cacao, Chocoretas')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (6, N'Dulces de frutas', N'De pepita, Frutas cristalizadas, Higos de almibar')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (7, N'Dulces de masa', N'Tamales de elote, Empanadas de cajeta, calabaza y piña, Galletas')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (8, N'Dulces de ajonjolí', N'Alegrías, Mazapanes')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (9, N'Dulces regionales ', N'Jamoncillos, Lechuguillas')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (10, N'Dulces de sabores exóticos', N'Tejocote, Nopal, Jamaica')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (11, N'Aperitivos o Botanas', N'Papas, chicharrón, Tostadas, Snacks')
INSERT [dbo].[Categoria] ([CategoriaID], [NombreCategoria], [Descripción]) VALUES (12, N'Objetos', N'Accesorios, juguetes, decoraciones')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (1, N'No se indentificó', N'', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (2, N'Juan Alexander García González', N'', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (3, N'Fernanda Macías Lopez Moreno ', N'', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (4, N'Alicia Barron Villarreal', N'alicia.barron@ifson.edu.mx.', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (5, N'Esther Flores Reyes', N'', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (6, N'Reginda Valencia Gutierrez', N'', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (7, N'Adrian Pulido León', N'', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (8, N'Fernanda Carmona Velazquez', N'', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (9, N'Sofía Rivera Gallardo', N'sofiarivera@gmail.com', N'')
INSERT [dbo].[Clientes] ([ClienteID], [NombreCliente], [Email], [Telefono]) VALUES (10, N'José Rodriguez Cruz', N'', N'8111793381')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetallesVenta] ON 

INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (1, 1, 20, 50, CAST(2.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (2, 1, 17, 30, CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (3, 2, 23, 4, CAST(17.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (4, 3, 33, 1, CAST(32.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (5, 4, 34, 1, CAST(330.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (6, 4, 50, 1, CAST(13.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (7, 5, 1, 15, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (8, 6, 5, 3, CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (9, 7, 9, 5, CAST(13.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (10, 7, 10, 8, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (11, 7, 18, 2, CAST(26.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (12, 7, 40, 10, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (13, 7, 22, 5, CAST(9.50 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (14, 8, 10, 8, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (15, 8, 11, 5, CAST(68.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (16, 9, 16, 4, CAST(6.50 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (17, 9, 15, 1, CAST(14.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (18, 10, 19, 5, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (19, 11, 29, 3, CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (20, 12, 38, 1, CAST(70.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (21, 12, 72, 1, CAST(9.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (22, 13, 75, 1, CAST(26.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (23, 13, 7, 2, CAST(45.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (24, 14, 23, 7, CAST(13.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (25, 14, 25, 4, CAST(13.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (26, 15, 30, 12, CAST(3.50 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (27, 15, 36, 6, CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (28, 15, 37, 4, CAST(55.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (29, 15, 73, 1, CAST(16.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (30, 16, 10, 8, CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (31, 17, 38, 5, CAST(3.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (32, 17, 44, 1, CAST(11.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (33, 18, 47, 1, CAST(60.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (34, 18, 14, 1, CAST(11.50 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (35, 19, 2, 6, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (36, 19, 17, 5, CAST(4.00 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (37, 19, 3, 7, CAST(10.50 AS Decimal(10, 2)))
INSERT [dbo].[DetallesVenta] ([DetalleID], [VentaID], [ProductoID], [Cantidad], [PrecioUnitario]) VALUES (38, 19, 45, 2, CAST(3.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DetallesVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (1, N'Palenqueta', N'barra de cacahuate pelado', CAST(15.50 AS Decimal(10, 2)), 160, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (2, N'Glorias', N'dulce de leche con nuez', CAST(10.50 AS Decimal(10, 2)), 92, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (3, N'Borrachitos', N'Dulce de leche con licor', CAST(18.00 AS Decimal(10, 2)), 44, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (4, N'Cajeta Envinada', N'Cajeta con licor', CAST(25.00 AS Decimal(10, 2)), 45, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (5, N'Besos de Novia', N'Dulces rellenos de nuez y chocolate', CAST(10.00 AS Decimal(10, 2)), 90, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (6, N'Canasta surtida dulces tradicionales', N'Canasta surtida dulces tradicionales', CAST(45.00 AS Decimal(10, 2)), 22, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (7, N'Taza surtida dulces tradicionales', N'Taza surtida dulces tradicionales', CAST(35.00 AS Decimal(10, 2)), 37, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (8, N'Cocada', N'coco rayado, azúcar y leche', CAST(22.75 AS Decimal(10, 2)), 176, 2)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (9, N'Besos de Coco', N'Dulces de coco rellenos de cajeta', CAST(13.00 AS Decimal(10, 2)), 86, 2)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (10, N'Rollos de coco', N'Rollos de coco', CAST(12.00 AS Decimal(10, 2)), 35, 2)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (11, N'Caramelos de Menta', N'tasty', CAST(68.00 AS Decimal(10, 2)), 111, 3)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (12, N'Dulce de caramelo', N'Caramel suave', CAST(1.50 AS Decimal(10, 2)), 67, 3)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (13, N'Gomitas de frutas picantes -vaso', N'vaso grande de gomitas de piña con polvo picante', CAST(42.75 AS Decimal(10, 2)), 175, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (14, N'Chamoyadas', N'Bolsa de chamoy líquido', CAST(11.50 AS Decimal(10, 2)), 54, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (15, N'Mango Enchilado', N'Mango verde con chile y sal', CAST(14.00 AS Decimal(10, 2)), 73, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (16, N'Chiles Enchilados', N'Chiles secos enchilados', CAST(6.50 AS Decimal(10, 2)), 96, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (17, N'Barra de Chocolate', N'bocadin', CAST(4.00 AS Decimal(10, 2)), 221, 5)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (18, N'Bombom con chocolate -bolsa', N'Bolsa de bombones con chocolate 100g', CAST(26.00 AS Decimal(10, 2)), 55, 5)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (19, N'Ositos de Goma', N'panditas', CAST(20.00 AS Decimal(10, 2)), 197, 6)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (20, N'Chicles de Frutas', N'bubbalo', CAST(2.00 AS Decimal(10, 2)), 283, 6)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (21, N'Dulce de Calabaza', N'Dulce típico de calabaza cristalizada', CAST(15.00 AS Decimal(10, 2)), 87, 6)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (22, N'Ate de Guayaba', N'Ate de guayaba en tableta', CAST(9.50 AS Decimal(10, 2)), 43, 6)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (23, N'Empanadas de cajeta -paquete de 3', N'3 empanadas grandes de cajeta', CAST(13.00 AS Decimal(10, 2)), 59, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (24, N'Empanadas de cajeta -paquete de 10', N'10 empanadas pequeñas de cajeta', CAST(17.00 AS Decimal(10, 2)), 45, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (25, N'Empanadas de piña -paquete de 3', N'3 empanadas grandes de piña', CAST(13.00 AS Decimal(10, 2)), 63, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (26, N'Empanadas de piña -paquete de 10', N'10 empanadas pequeñas de piña', CAST(17.00 AS Decimal(10, 2)), 28, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (27, N'Empanadas de calabaza -paquete de 3', N'3 empanadas grandes de calabaza', CAST(13.00 AS Decimal(10, 2)), 14, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (28, N'Empanadas de calabaza -paquete de 10', N'10 empanadas pequeñas de calabaza', CAST(17.00 AS Decimal(10, 2)), 16, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (29, N'Tamales dulces', N'Tamales dulces de chocolate, nutela, cajeta', CAST(20.00 AS Decimal(10, 2)), 24, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (30, N'Mazapanes', N'De la Rosa', CAST(3.50 AS Decimal(10, 2)), 403, 8)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (31, N'Jamoncillo -300g', N'300g surtido', CAST(38.00 AS Decimal(10, 2)), 84, 9)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (32, N'Jamaica', N'Flor de jamaica', CAST(36.50 AS Decimal(10, 2)), 53, 10)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (33, N'Chicharrón seco bolsa', N'Chiharrón seco bolsa 70g ', CAST(32.00 AS Decimal(10, 2)), 66, 11)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (34, N'Carne seca', N'Carne seca bolsa 250g ', CAST(330.00 AS Decimal(10, 2)), 30, 11)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (35, N'Tamales de tamarindo', N'bolsa 15 tamalitos', CAST(29.00 AS Decimal(10, 2)), 18, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (36, N'Hojarascas', N'50g', CAST(50.00 AS Decimal(10, 2)), 13, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (37, N'Obleas', N'12 Piezas', CAST(55.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (38, N'Ovnis de tamarindo', N'Una pieza', CAST(3.00 AS Decimal(10, 2)), 79, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (39, N'Papas surtidas', N'botana, mix de papitas para fiesta', CAST(70.00 AS Decimal(10, 2)), 34, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (40, N'Conos de dulce leche', N'individual', CAST(8.50 AS Decimal(10, 2)), 13, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (41, N'Chamoy paquete', N'paquete de bolsitas de chamoy 12pz', CAST(65.00 AS Decimal(10, 2)), 12, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (42, N'Bolsa de gomitas grande', N'1kg dulces lucky gummys', CAST(165.00 AS Decimal(10, 2)), 15, 11)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (43, N'Paletas de bombon', N'individual', CAST(15.00 AS Decimal(10, 2)), 18, 11)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (44, N'papas takis', N'papas takis', CAST(11.00 AS Decimal(10, 2)), 20, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (45, N'bola de tamarindo', N'individual', CAST(3.00 AS Decimal(10, 2)), 34, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (46, N'Caja de nueces', N'225gr', CAST(64.00 AS Decimal(10, 2)), 7, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (47, N'Caja de galletas dulce sutidas', N'40 galletas', CAST(60.00 AS Decimal(10, 2)), 8, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (48, N'Paleta de caramelo', N'individual', CAST(15.00 AS Decimal(10, 2)), 18, 3)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (49, N'Bolsa de nuez garapiñada', N'225g', CAST(101.50 AS Decimal(10, 2)), 6, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (50, N'Botella de cacahuates', N'botella de coronita llena de cacahuates', CAST(13.00 AS Decimal(10, 2)), 29, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (51, N'Combo botella de cacahuates y carne seca', N'botella de cacahuates y bolsita de carne seca', CAST(23.00 AS Decimal(10, 2)), 18, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (52, N'Papas naturales', N'bolsa de papas naturales', CAST(12.00 AS Decimal(10, 2)), 12, 11)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (53, N'Caja galletas dulces', N'10 piezas', CAST(15.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (54, N'Reglazos de frutas', N'Dulces de fresa, mango, piña, guayaba', CAST(8.00 AS Decimal(10, 2)), 27, 6)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (55, N'Pulparindo', N'individual', CAST(6.00 AS Decimal(10, 2)), 60, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (56, N'Minipays', N'mango, limón, piña', CAST(85.00 AS Decimal(10, 2)), 21, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (57, N'Campechanas', N'individual', CAST(4.50 AS Decimal(10, 2)), 14, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (58, N'Gorditas de azucar', N'individual', CAST(8.00 AS Decimal(10, 2)), 13, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (59, N'Bisquet integral', N'individual', CAST(9.00 AS Decimal(10, 2)), 18, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (60, N'Polvoron integral', N'individual', CAST(10.00 AS Decimal(10, 2)), 24, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (61, N'Empanadas de cajeta con nuez', N'individual grande', CAST(6.00 AS Decimal(10, 2)), 16, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (62, N'Pan de pulque', N'individual', CAST(10.00 AS Decimal(10, 2)), 9, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (63, N'Galletas finas', N'caja de 280g', CAST(80.00 AS Decimal(10, 2)), 12, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (64, N'Galletas con gragea', N'bolsa 100g', CAST(15.00 AS Decimal(10, 2)), 46, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (65, N'Besos de ángel', N'bolsa 60g', CAST(15.00 AS Decimal(10, 2)), 38, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (66, N'Orejitas', N'galletas de mantequilla 190g', CAST(70.00 AS Decimal(10, 2)), 58, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (67, N'Cochinito integral', N'individual', CAST(16.50 AS Decimal(10, 2)), 26, 7)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (68, N'Semitas caseras con nuez y pasas', N'individual', CAST(16.00 AS Decimal(10, 2)), 14, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (69, N'Miel pura chica', N'vaso chico', CAST(40.00 AS Decimal(10, 2)), 56, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (70, N'Miel pura grande', N'vaso grande', CAST(80.00 AS Decimal(10, 2)), 43, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (71, N'Piquin', N'vaso mediano', CAST(50.00 AS Decimal(10, 2)), 13, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (72, N'Salsa', N'bote pequeño', CAST(9.00 AS Decimal(10, 2)), 46, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (73, N'Habanero', N'bote mediano', CAST(16.00 AS Decimal(10, 2)), 34, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (74, N'Chile del monte', N'bote grande', CAST(40.00 AS Decimal(10, 2)), 57, 4)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (75, N'Mosaicos', N'caja de 4 piezas', CAST(15.00 AS Decimal(10, 2)), 26, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (76, N'Luneta bolsita', N'bolsita de 48g', CAST(15.00 AS Decimal(10, 2)), 23, 11)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (77, N'Nuez bolsita', N'bolsita de 112g', CAST(35.00 AS Decimal(10, 2)), 21, 1)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (78, N'Fruta cristalizada', N'Dulce tipico de fruta cristalizada 315g', CAST(50.00 AS Decimal(10, 2)), 29, 6)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (79, N'Bolitas de leche con azucar', N'dulce regional bolsa 9 piezas', CAST(90.00 AS Decimal(10, 2)), 18, 9)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (80, N'Monedero', N'monedero artesanal', CAST(35.00 AS Decimal(10, 2)), 65, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (81, N'Imanes', N'imanes para pegar en tu refrigerador', CAST(30.00 AS Decimal(10, 2)), 76, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (82, N'Juguetes mexicanos', N'variedad de juguetes mexicanos', CAST(20.00 AS Decimal(10, 2)), 33, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (83, N'Delantales', N'delantal estilo la loteria', CAST(100.00 AS Decimal(10, 2)), 59, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (84, N'Alcancias', N'alcancias estilo mexicano regional', CAST(60.00 AS Decimal(10, 2)), 67, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (85, N'Molcajete', N'molcajte  de piedra', CAST(70.00 AS Decimal(10, 2)), 45, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (86, N'Quinqué', N'Quinqué antiguo', CAST(180.00 AS Decimal(10, 2)), 36, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (87, N'Juego de loteria', N'juego lotería', CAST(140.00 AS Decimal(10, 2)), 53, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (88, N'Muñecas marías', N'muñeca de trapo maría artesanal', CAST(85.00 AS Decimal(10, 2)), 66, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (89, N'Bolsas y sombreros mexicanos', N'sombrero de palma y bolsa artesanal', CAST(110.00 AS Decimal(10, 2)), 98, 12)
INSERT [dbo].[Productos] ([ProductoID], [NombreProducto], [DescripcionProducto], [Precio], [Stock], [CategoriaID]) VALUES (90, N'tortillera', N'tortillera artesanal', CAST(210.00 AS Decimal(10, 2)), 120, 12)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 

INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (1, CAST(N'2023-10-17T08:10:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (2, CAST(N'2023-10-17T08:35:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (3, CAST(N'2023-10-17T08:56:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (4, CAST(N'2023-10-17T09:34:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (5, CAST(N'2023-10-17T09:52:00.000' AS DateTime), 2)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (6, CAST(N'2023-10-17T10:36:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (7, CAST(N'2023-10-17T10:48:00.000' AS DateTime), 3)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (8, CAST(N'2023-10-17T10:55:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (9, CAST(N'2023-10-17T10:58:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (10, CAST(N'2023-10-17T11:11:00.000' AS DateTime), 4)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (11, CAST(N'2023-10-17T11:45:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (12, CAST(N'2023-10-17T12:04:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (13, CAST(N'2023-10-17T12:22:00.000' AS DateTime), 1)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (14, CAST(N'2023-10-17T13:06:00.000' AS DateTime), 5)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (15, CAST(N'2023-10-17T13:46:00.000' AS DateTime), 6)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (16, CAST(N'2023-10-17T14:33:00.000' AS DateTime), 7)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (17, CAST(N'2023-10-17T15:05:00.000' AS DateTime), 8)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (18, CAST(N'2023-10-17T15:44:00.000' AS DateTime), 9)
INSERT [dbo].[Ventas] ([VentaID], [FechaVenta], [ClienteID]) VALUES (19, CAST(N'2023-10-18T08:21:00.000' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD  CONSTRAINT [FK__DetallesV__Produ__412EB0B6] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[DetallesVenta] CHECK CONSTRAINT [FK__DetallesV__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD  CONSTRAINT [FK__DetallesV__Venta__403A8C7D] FOREIGN KEY([VentaID])
REFERENCES [dbo].[Ventas] ([VentaID])
GO
ALTER TABLE [dbo].[DetallesVenta] CHECK CONSTRAINT [FK__DetallesV__Venta__403A8C7D]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK__Productos__Categ__38996AB5] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categoria] ([CategoriaID])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK__Productos__Categ__38996AB5]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK__Ventas__ClienteI__3D5E1FD2] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK__Ventas__ClienteI__3D5E1FD2]
GO
USE [master]
GO
ALTER DATABASE [Dulces_Regionales_Los_Robles] SET  READ_WRITE 
GO
