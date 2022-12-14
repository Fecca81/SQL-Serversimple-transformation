-- Database creation

USE [master]
GO

/****** Object:  Database [Proyecto Inmobiliaria]    Script Date: 10/2/2022 10:33:06 AM ******/
CREATE DATABASE [Proyecto Inmobiliaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto Inmobiliaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proyecto Inmobiliaria.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Proyecto Inmobiliaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Proyecto Inmobiliaria_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto Inmobiliaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET ARITHABORT OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET  MULTI_USER 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET QUERY_STORE = OFF
GO

ALTER DATABASE [Proyecto Inmobiliaria] SET  READ_WRITE 
GO


