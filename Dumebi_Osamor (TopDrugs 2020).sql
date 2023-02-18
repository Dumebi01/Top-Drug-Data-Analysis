CREATE DATABASE Top_Drugs_2020;

USE Top_Drugs_2020;

CREATE TABLE Pharma_DrugRanking
(SalesRank INT NOT NULL,
Code VARCHAR(3) NOT NULL,
DrugName VARCHAR(50) NOT NULL,
Manufacturer VARCHAR(50) NULL,
Symbol VARCHAR(6) NULL,
DosageForm VARCHAR(200) NULL,
SalesInUSD DECIMAL(15) NOT NULL);


 
INSERT INTO Pharma_DrugRanking
VALUES
(1, "XX6", "Humira", "AbbVie", "ABBV", "Subcutaneous Injection", 19832000000),
(2, "X10", "Keytruda", "Merck", "MRK", "Intravenous Infusion", 14380000000),
(3, "X14", "Revlimid", "Bristol Myers Squibb", "BMY", "Capsules for Oral Use", 12106000000),
(4, "XX3", "Eliquis", "Bristol Myers Squibb", "BMY", "Tablets for Oral Use", 9168000000),
(5, "XX8", "Imbruvica", "AbbVie", "ABBV", "Capsules for Oral Use", 8430000000),
(6, "XX5", "Eylea", "Regeneron Pharmaceuticals", "REGN", "Intravitreal Injection", 8360000000),
(7, "X16", "Stelara", "Johnson & Johnson", "JNJ", "Intravenous Infusion", 7940000000),
(8, "XX2", "Biktarvy", "Gilead Sciences", "GILD", "Tablets for Oral Use",  7259000000),
(9, "X12", "Opdivo", "Bristol Myers Squibb", "BMY", "Intravenous Infusion", 6992000000),
(10, "X19", "Xarelto", "Bayer", "BAYN", "Tablets for Oral Use", 6930000000),
(11, "XX4", "Enbrel", "Amgen", "AMGN", "Subcutaneous Injection", 6370000000),
(12, "X13", "Prevnar 13", "Pfizer", "PFE", "Intramuscular Injection", 5950000000),
(13, "XX7", "Ibrance", "Pfizer", "PFE", "Capsules for Oral Use", 5390000000),
(14, "XX1", "Avastin", "Roche", "RHHBY", "Intravenous Infusion", 5320000000),
(15, "XX9", "Januvia and Janumet", "Merck", "MRK", "Tablets for Oral Use", 5276000000),
(16, "X18", "Trulicity", "Eli Lilly", "LLY", "Subcutaneous Injection", 5070000000),
(17, "X11", "Ocrevus", "Roche", "RHHBY", "Intravenous Infusion", 4610000000),
(18, "X15", "Rituxan", "Roche", "RHHBY", "Intravenous Infusion", 4500000000),
(19, "X20", "Xtandi", "Astellas Pharma", "TYO", "Tablets for Oral Use", 4390000000),
(20, "X17", "Tagrisso", "AstraZeneca", "AZN", "Tablets for Oral Use", 4330000000);

#TABLE2

CREATE TABLE DrugGenericName
(SalesRank INT NOT NULL PRIMARY KEY,
DrugName VARCHAR(50) NOT NULL,
GenericName VARCHAR(50) NOT NULL,
OtherGenericName VARCHAR(50) NULL);

DROP TABLE DrugGenericName;
 
INSERT INTO DrugGenericName 
VALUES
(1, "Humira", "Adalimumab", ""),
(2, "Keytruda", "Pembrolizumab", ""),
(3, "Revlimid", "Lenalidomide",""),
(4, "Eliquis", "Apixaban", ""),
(5, "Imbruvica", "Ibrutinib", ""),
(6, "Eylea", "Aflibercept", ""),
(7, "Stelara", "Ustekinumab", ""),
(8, "Biktarvy", "Bictegravir-Emtricitabine-Tenofovir Alafenamide", ""),
(9, "Opdivo", "Nivolumab", ""),
(10, "Xarelto", "Rivaroxaban", ""),
(11, "Enbrel", "Etanercept", ""),
(12, "Prevnar 13", "Pneumococcal 13-valent Conjugate Vaccine", "Diphtheria CRM197 Protein"),
(13, "Ibrance", "Palbociclib", ""),
(14, "Avastin", "Bevacizumab", ""),
(15, "Januvia and Janumet", "Sitagliptin", "Sitagliptin and Metformin"),
(16, "Trulicity", "Dulaglutide", ""),
(17, "Ocrevus", "Ocrelizumab", ""),
(18, "Rituxan", "Rituximab", ""),
(19, "Xtandi", "Enzalutamide", ""),
(20, "Tagrisso", "Osimertinib", "");

#TABLE3

CREATE TABLE DrugBoxedWarning
(SN INT NOT NULL PRIMARY KEY,
Symbol VARCHAR(10) NOT NULL,
DrugName VARCHAR (50) NOT NULL,
BoxedWarning BIT NOT NULL);
 
DROP TABLE DrugBoxedWarning;
 
INSERT INTO DrugBoxedWarning
VALUES
(1, "ABBV", "Humira", 1),
(2, "MRK", "Keytruda", 0),
(3, "BMY", "Revlimid", 1),
(4, "BMY", "Eliquis", 1),
(5, "ABBV", "Imbruvica", 0),
(6, "REGN", "Eylea", 0),
(7, "JNJ", "Stelara", 0),
(8, "GILD", "Biktarvy", 1),
(9, "BMY", "Opdivo", 0),
(10, "BAYN", "Xarelto", 1),
(11, "AMGN", "Enbrel", 1),
(12, "PFE", "Prevnar 13", 0),
(13, "PFE", "Ibrance", 0),
(14, "RHHBY", "Avastin",  0),
(15, "MRK", "Januvia and Janumet", 0),
(16, "LLY", "Trulicity", 1),
(17, "RHHBY", "Ocrevus", 0),
(18, "RHHBY", "Rituxan", 1),
(19, "TYO", "Xtandi", 0),
(20, "AZN", "Tagrisso", 0);


#TABLE4
CREATE TABLE DrugProductCategory
(Code VARCHAR(3) NOT NULL,
DrugName VARCHAR (50) NOT NULL PRIMARY KEY,
ProductCategory VARCHAR(50) NOT NULL,
Abbreviation VARCHAR(10) NULL);

DROP TABLE DrugProductCategory;
 
INSERT INTO DrugProductCategory
VALUES
("XX6", "Humira", "Immunology", ""),
("X10", "Keytruda", "Oncology",""),
("X14", "Revlimid", "Hematologic Oncology", ""),
("XX3", "Eliquis", "Vascular", ""),
("XX8", "Imbruvica", "Hematologic Oncology", ""),
("XX5", "Eylea", "Ophthalmology", ""),
("X16", "Stelara", "Immunology", ""),
("XX2", "Biktarvy",  "Human Immunodeficiency Virus", "HIV"),
("X12", "Opdivo", "Oncology", ""),
("X19", "Xarelto", "Cardiology", ""),
("XX4", "Enbrel", "Immunology", ""),
("X13", "Prevnar 13", "Vaccine", ""),
("XX7", "Ibrance", "Oncology", ""),
("XX1", "Avastin", "Oncology", ""),
("XX9", "Januvia and Janumet", "Diabetes", ""),
("X18", "Trulicity", "Diabetes", ""),
("X11", "Ocrevus", "Immunology", ""),
("X15", "Rituxan", "Immuno-oncology", ""),
("X20", "Xtandi", "Oncology", ""),
("X17", "Tagrisso","Oncology", "");

#TABLE5
CREATE TABLE DrugIndication
(Code VARCHAR(3) NOT NULL,
DrugName VARCHAR (50) NOT NULL PRIMARY KEY,
Indication VARCHAR(100) NOT NULL,
Abbreviation VARCHAR(10) NULL,
IndicationDescription VARCHAR(200) NULL);


 DROP TABLE DrugIndication;
 
INSERT INTO DrugIndication
VALUES
("XX6", "Humira", "Rheumatoid Arthritis", "RA", ""),
("X10", "Keytruda", "Melanoma","", "" ),
("X14", "Revlimid", "Multiple Myeloma", "MM", ""),
("XX3", "Eliquis", "Stroke", "", "To reduce the risk of stroke and systemic embolism in patients with nonvalvular atrial fibrillation"),
("XX8", "Imbruvica", "Mantle Cell Lymphoma", "MCL", ""),
("XX5", "Eylea", "Macular Degeneration", "AMD", "Neovascular (Wet) Age-Related Macular Degeneration"),
("X16", "Stelara", "Plaque Psoriasis", "", ""),
("XX2", "Biktarvy",  "Human Immunodeficiency Virus",  "HIV", "Treatment of human immunodeficiency virus type 1 (HIV-1) infection" ),
("X12", "Opdivo", "Metastatic Melanoma", "", ""),
("X19", "Xarelto", "Stroke", "", "To reduce risk of stroke and systemic embolism in nonvalvular atrial fibrillation"),
("XX4", "Enbrel", "Rheumatoid Arthritis", "RA", ""),
("X13", "Prevnar 13", "Pneumococcal Disease", "", "Prevention of pneumococcal disease caused by 13 different serotypes"),
("XX7", "Ibrance", "Breast Cancer", "", "Hormone receptor (HR)-positive, human epidermal growth factor receptor 2 (HER2)-negative breast cancer"),
("XX1", "Avastin", "Metastatic Colorectal Cancer", "", ""),
("XX9", "Januvia and Janumet", "Type 2 Diabetes", "", "Improvement of glycemic control in adults with type 2 diabetes mellitus"),
("X18", "Trulicity", "Type 2 Diabetes", "", ""),
("X11", "Ocrevus", "Multiple Sclerosis", "MS", ""),
("X15", "Rituxan", "Non–Hodgkin's Lymphoma", "NHL", ""),
("X20", "Xtandi", "Prostate Cancers", "", "Certain prostate cancers"),
("X17", "Tagrisso", "Non-small Cell Lung Cancer", "NSCLC", "");


#FOREIGN KEYS
 
ALTER TABLE Pharma_DrugRanking
ADD CONSTRAINT FKSalesRank
FOREIGN KEY (SalesRank)
REFERENCES
DrugGenericName(SalesRank);
 
ALTER TABLE Pharma_DrugRanking
ADD CONSTRAINT FKBoxWarning
FOREIGN KEY (SalesRank)
REFERENCES
DrugBoxedWarning(SN);
 
ALTER TABLE Pharma_DrugRanking
ADD CONSTRAINT FKProductCategory
FOREIGN KEY (DrugName)
REFERENCES
DrugProductCategory(DrugName);
 
ALTER TABLE Pharma_DrugRanking
ADD CONSTRAINT FKIndication
FOREIGN KEY (DrugName)
REFERENCES
DrugIndication(DrugName);

