
CREATE TABLE TenderNotice (
	ID int IDENTITY,
	TenderNoticeNumber varchar(200),
	Status varchar(50),
	URL varchar(50),
	ContractNumber varchar(200),
	Issuer varchar(200),
	PublicationDate varchar(200),
	PublishedIn varchar(200),
	DocumentPurchaseDeadline varchar(200),
	SubmissionDeadline varchar(200),
	OpeningDate varchar(200),
	ContractType varchar(200),
	ProjectName varchar(500),
	ProjectNumber varchar(200),
	ProjectFunder varchar(300),
	ProjectDescription varchar(1000),
	ContractName varchar(500),
	Estimate int,
	EstimateCurrency varchar(10),
	CoderName varchar(500),
	DataSource varchar(500)
)

CREATE TABLE Location (
	ID int IDENTITY,
	TENDER_NOTICE_ID int,
	RECIPIENT_ID int,
	ADM1 varchar(200),
	ADM2 varchar(200),
	ADM3 varchar(200),
	ADM4 varchar(200),
	WARD varchar(200),
	OTHER_LOCATION varchar(500),
	OTHER_LOCATION_DESC varchar(500),
	ACTIVITY_DESC varchar(500)
)

CREATE TABLE Award (
	ID int IDENTITY,
	URL varchar(500),
	ESTIMATE int,
	ESTIMATE_CURRENCY varchar(10)
)

CREATE TABLE Recipient (
	ID int IDENTITY,
	AWARD_ID int,
	NAME varchar(2000),
	CODE varchar (2000),
	LOCATION varchar (2000),
	CODE_SOURCE varchar(2000),
	COUNTRY varchar(2000)
)