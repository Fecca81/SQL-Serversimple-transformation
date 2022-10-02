USE [Proyecto Inmobiliaria]
GO
SELECT * FROM housing
--TRANSFORMATIONS

--------------------Dates
ALTER TABLE Housing
ADD SaleDateCnverted DATE;

UPDATE Housing
SET SaleDateCnverted = CONVERT(date, SaleDate);

-------------------AddresS columns
------Property Address
ALTER TABLE Housing
ADD ProperySplitAddress NVARCHAR(MAX);

UPDATE Housing
SET ProperySplitAddress =
	TRIM(SUBSTRING(PropertyAddress, 0, CHARINDEX(',', PropertyAddress)));

------Property City
ALTER TABLE Housing
ADD ProperySplitCity NVARCHAR(MAX);

UPDATE Housing
SET ProperySplitCity =
	trim(SUBSTRING(PropertyAddress
		,CHARINDEX(',', PropertyAddress) + 1
		,LEN(PropertyAddress)));

------Owner Address with PARSENAME
ALTER TABLE Housing
ADD OwnerSplitAddress NVARCHAR(MAX);
UPDATE Housing
SET OwnerSplitAddress =
	PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3);

ALTER TABLE Housing
ADD OwnerSplitCity NVARCHAR(MAX);
UPDATE Housing
SET OwnerSplitCity =
	PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2);

ALTER TABLE Housing
ADD OwnerSplitState NVARCHAR(MAX);
UPDATE Housing
SET OwnerSplitState =
	PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1);

------------------Change Y and N in "Solad as Vacant"
UPDATE Housing
SET SoldAsVacant =
	CASE
		WHEN UPPER(SoldAsVacant) = 'Y' THEN 'Yes'
		WHEN UPPER(SoldAsVacant) = 'N' THEN 'No'
		ELSE SoldAsVacant
	END;

----------------------------Remove Duplicates

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
DELETE 
FROM RowNumCTE
where row_num > 1

-------------------Deleting Unnecesary columns

ALTER TABLE Housing
DROP COLUMN
	PropertyAddress
	,SaleDate
	,OwnerAddress