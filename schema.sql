/* this schema was written as a backend for an OpenOffice Base interface, and so uses the HSQLDB flabour of SQL syntax */
/* fully capitalized field names are used b/c OpenOffice converts everything to caps automatically for some reason */
/* http://hsqldb.org/ */



DROP TABLE IF EXISTS CODEDLOCATION;
DROP TABLE IF EXISTS CODEDTENDERNOTICE;
DROP TABLE IF EXISTS TENDERNOTICE;
DROP TABLE IF EXISTS CODEDSUPPLIER;
DROP TABLE IF EXISTS AWARD;
DROP TABLE IF EXISTS CODER;



CREATE TABLE TenderNotice (
	ID int IDENTITY,
	TenderNoticeNumber varchar(2000),
	Status varchar(2000),
	URL varchar(2000),
	ContractDetails varchar(2000),
	Issuer varchar(2000),
	PublicationDate varchar(2000),
	PublishedIn varchar(2000),
	DocumentPurchaseDeadline varchar(2000),
	SubmissionDeadline varchar(2000),
	OpeningDate varchar(2000),
	ContractName varchar(2000),
	ContractDescription varchar(2000),
	CostEstimate numeric,
	EstimateCurrency varchar(2000),
	DataSource varchar(2000)
)

CREATE TABLE Award (
	ID int IDENTITY,
	COST_ESTIMATE numeric,
	ESTIMATE_CURRENCY varchar(2000),
	DATA_SOURCE varchar(2000),
	SCRAPED_SUPPLIER_NAME varchar(2000),
	SCRAPED_SUPPLIER_LOCATION varchar(2000)
)

CREATE TABLE Coder (
	ID int IDENTITY,
	NAME varchar(2000)
)

CREATE TABLE CodedTenderNotice (
	ID int IDENTITY,
	TENDER_NOTICE_ID int,
	CODER_ID int,
	TenderNoticeNumber varchar(2000),
	ContractNumber varchar(2000),
	ContractType varchar(2000),
	ProjectName varchar(2000),
	ProjectNumber varchar(2000),
	ProjectFunder varchar(2000),
	ContractName varchar(2000),
	ContractDescription varchar(2000),
	CostEstimate numeric,
	EstimateCurrency varchar(2000),
	DataSource varchar(2000),
	FOREIGN KEY (TENDER_NOTICE_ID) REFERENCES TenderNotice (ID),
	FOREIGN KEY (CODER_ID) REFERENCES Coder(ID)

)

CREATE TABLE CodedLocation (
	ID int IDENTITY,
	CODED_TENDER_NOTICE_ID int,
	ADM1 varchar(2000),
	ADM2 varchar(2000),
	ADM3 varchar(2000),
	ADM4 varchar(2000),
	WARD varchar(2000),
	OTHER_LOCATION varchar(2000),
	OTHER_LOCATION_DESC varchar(2000),
	ACTIVITY_DESC varchar(2000),
	FOREIGN KEY (CODED_TENDER_NOTICE_ID) REFERENCES CodedTenderNotice (ID)
)


CREATE TABLE CodedSupplier (
	ID int IDENTITY,
	AWARD_ID int,
	CODER_ID int,
	SUPPLIER_NAME varchar(2000),
	SUPPLIER_REGISTRATION_CODE varchar (2000),
	SUPPLIER_REGISTRATION_CODE_SOURCE varchar(2000),
	SUPPLIER_COUNTRY varchar(2000),
	ADM1 varchar(2000),
	ADM2 varchar(2000),
	ADM3 varchar(2000),
	ADM4 varchar(2000),
	WARD varchar(2000),
	OTHER_LOCATION varchar(2000),
	OTHER_LOCATION_DESC varchar(2000),
	FOREIGN KEY (AWARD_ID) REFERENCES Award (ID),
	FOREIGN KEY (CODER_ID) REFERENCES Coder(ID)
)


