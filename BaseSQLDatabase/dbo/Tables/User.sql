CREATE TABLE [dbo].[User]
(
	[UserId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [FirstName] NCHAR(50) NOT NULL, 
    [LastName] NCHAR(50) NULL, 
    [OrganizationId] BIGINT NOT NULL,
    [UserTypeLookupId] BIGINT NOT NULL,
    [DateCreated] DATETIME NOT NULL DEFAULT getDate(),
    [IsDeleted] BIT NOT NULL DEFAULT 0
)
