-- THIS TABLE WAS IMPORTED WITH A SQL Server TOOL!!!!!!!!!!!!!!!!
/* This script create the structure.*/


USE [Proyecto Inmobiliaria]
GO

/****** Object:  Table [dbo].[Housing]    Script Date: 10/2/2022 10:35:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Housing](
	[UniqueID ] [float] NULL,
	[ParcelID] [nvarchar](255) NULL,
	[LandUse] [nvarchar](255) NULL,
	[SalePrice] [float] NULL,
	[LegalReference] [nvarchar](255) NULL,
	[SoldAsVacant] [nvarchar](255) NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Acreage] [float] NULL,
	[TaxDistrict] [nvarchar](255) NULL,
	[LandValue] [float] NULL,
	[BuildingValue] [float] NULL,
	[TotalValue] [float] NULL,
	[YearBuilt] [float] NULL,
	[Bedrooms] [float] NULL,
	[FullBath] [float] NULL,
	[HalfBath] [float] NULL,
	[SaleDateCnverted] [date] NULL,
	[ProperySplitAddress] [nvarchar](max) NULL,
	[ProperySplitCity] [nvarchar](max) NULL,
	[OwnerSplitAddress] [nvarchar](max) NULL,
	[OwnerSplitCity] [nvarchar](max) NULL,
	[OwnerSplitState] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

