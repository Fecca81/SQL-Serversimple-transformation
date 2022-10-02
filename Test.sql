USE [Proyecto Inmobiliaria]
GO
SELECT * FROM housing
--TRANSFORMATIONS

ALTER TABLE Housing
ADD SaleDateCnverted DATE;

UPDATE Housing
SET SaleDateCnverted = CONVERT(date, SaleDate)

UPDATE Housing
SET SaleDateCnverted = CONVERT(date, SaleDate)

-------------------------------------------------
--Standarize date format
SELECT
	SaleDate
	,SaleDateCnverted
FROM
	Housing

-----------------------------------------------------------------
--Property Address

SELECT *
FROM Housing
WHERE PropertyAddress IS NULL
order by ParcelID
--NULLS PROPERTY ADDRESS
/*
SELECT a.PropertyAddress
	,a.ParcelID
	,b.PropertyAddress
	,ISNULL(a.PropertyAddress,b.PropertyAddress) AS NUWVADIRE
FROM Housing a
	JOIN Housing b
	ON A.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL
ORDER BY a.ParcelID
*/

--POPULATING PROPERTY ADDRESS
UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM Housing a
	JOIN Housing b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress IS NULL

-- Booking address into diferent columns
SELECT
	PropertyAddress
	,trim(SUBSTRING(PropertyAddress, 0, CHARINDEX(',', PropertyAddress))) as Adrress
	,trim(SUBSTRING(PropertyAddress
		,CHARINDEX(',', PropertyAddress) + 1
		,LEN(PropertyAddress))) as Hood
FROM
	Housing

--OWENER ADDRESS
SELECT
	PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1) AS STATE
	,PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2) AS CITY
	,PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3) AS ADDRESSOW
FROM Housing

--Change Y and N in "Solad as Vacant"
SELECT
	DISTINCT( SoldAsVacant )
	,COUNT( SOLDASVACANT )
FROM Housing
GROUP BY SoldAsVacant

SELECT
DISTINCT(
	CASE
		WHEN UPPER(SoldAsVacant) = 'Y'
		THEN 'Yes'
		WHEN UPPER(SoldAsVacant) = 'N'
		THEN 'No'
		ELSE
			SoldAsVacant
	END) AS A
FROM Housing


--Remove duplicates

with RowNumCTE AS(	
	SELECT *
		,ROW_NUMBER() OVER (
			PARTITION BY ParcelID
						,PropertyAddress
						,SalePrice
						,SaleDate
						,LegalReference
						ORDER BY
							UniqueiD
						) row_num
	FROM
		Housing
	--ORDER BY row_num DESC
)
SELECT *
FROM RowNumCTE
where row_num > 1

--Deleting Unnecesary columns
---Directly in MainTransformations.sql