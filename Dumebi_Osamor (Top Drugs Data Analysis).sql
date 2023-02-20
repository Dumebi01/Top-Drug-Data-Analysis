#GroupBy Error1 message solution

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));




#1 Example Query with group by and having to demonstrate how to extract data from your DB for analysis
#What are the most popular dosage form among the top 20 drugs and what where their sales in USD

USE Top_Drugs_2020;

SELECT 
DosageForm, Count(DosageForm) as DosageFormAMT, Sum(SalesinUSD) as SalesTotal
FROM 
Pharma_DrugRanking
Group by Dosageform
Having DosageFormAMT > 1
ORDER BY SalesTotal DESC;


#RESULT: Focus on developing a Tablet or Intravenous Injection. 
#In 2020 6 of the top drugs were Intravenous Drugs had they had the highest amount of sales compared to Tablets. 
#Intravenous drugs could be the most viable drug development option. 





#2 Example Query with a subquery to demonstrate how to extract data from your DB for analysis
#Checking for the Genric Names of the top 5 drugs in the database

#STEP1
SELECT SalesRank
From Pharma_DrugRanking
Where SalesRank between 1 AND 5;

#Step2
SELECT
DrugName,GenericName 
From DrugGenericName
WHERE
SalesRank in
(SELECT SalesRank
From Pharma_DrugRanking
Where SalesRank between 1 AND 5);




#3 Using any type of Join create a view that combines multiple tables in a logical way
# This is a view that has all the Indications Grouped by top product categories in within the sales rank

CREATE OR REPLACE VIEW ProdCat_Indications AS
SELECT
D.DrugName, D.Indication
From DrugIndication D
JOIN
(SELECT PC.DrugName, PC.ProductCategory, Count(PC.ProductCategory) AS ProdCat_Freq
FROM
DrugProductCategory PC
GROUP BY ProductCategory
ORDER BY ProdCat_Freq DESC)
AS P
ON D.DrugName = P.Drugname;

#From this we can see the that Metastatic Colorectal Cancer and the drug Avastin are the indications that have had the most developed 
#products for
#Lots of competition



#4 Create a view that uses atleast 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically
#arranged set for analysis

#CREATED A NON UPDATABLE VIEW (it has a group by Function) using 
# 3 tables Pharma_DrugRanking, DrugIndication, DrugBoxedWarning


#View from 3 tables

CREATE OR REPLACE VIEW TopDosageForms AS
SELECT PD.Symbol, PD.DrugName, PD.DosageForm AS TopDosageForms, Count(PD.DosageForm) AS TopDosageForms_Freq, Sum(PD.SalesinUSD) AS SalesTotal,
SD.indication, SD.IndicationDescription, OD.BoxedWarning
FROM Pharma_DrugRanking PD, DrugIndication SD, DrugBoxedWarning OD
WHERE PD.SalesRank = OD.SN
AND PD.DrugName = SD.DrugName
Group by PD.DosageForm
Order by TopDosageForms_Freq DESC;

SELECT * from TopDosageForms;

#View from 3 table - queries which of the top dosage forms came with a box warning. 

SELECT DrugName, TopDosageForms, Indication, TopDosageForms_Freq, BoxedWarning
From TopDosageForms
Group By TopDosageForms;

#Why doeskeytruda not come with a boxed warning - delivered by the Physician. 
# Do we want to develop a drug that will be delivered by Physicians as opposed to self delivery of the drug? 
#Top 2-4 dosage forms have boxed warning with a total of 12 products falling into this category
#Seld delivered drugs instead. 



#5 In your database create a Stored Function that can be applied to a query in your DB

DELIMITER $$

CREATE FUNCTION 
AvgCalculator (SalesinUSD Decimal(50,2))
Returns Decimal (20,2)
DETERMINISTIC 
BEGIN
DECLARE AverageSales Decimal(50,2);
SET AverageSales = SalesinUSD/20;
RETURN AverageSales;
END;
$$

DELIMITER ;

#Running the function we have just created with SELECT statement

SELECT AVGCalculator(1.00);

SELECT
Drugname, AVGCalculator(SalesinUSD) As AVGSales
FROM Pharma_DrugRanking;

drop function AvgCalculator;