USE [BaseDotnetDatabase];

SET IDENTITY_INSERT dbo.Organization ON;

Merge Into dbo.Organization AS Target
    Using (Values
           (1,'First Organization',getDate(),0),
           (2,'Second Organization',getDate(),0)
           )
        AS Source ([OrganizationId],	[OrganizationName],	[DateCreated],	[IsDeleted])
    On Target.[OrganizationId] = Source.[OrganizationId]
    When MATCHED Then
        Update Set
        [OrganizationName] = Source.[OrganizationName],
        [DateCreated] = Source.[DateCreated],
        [IsDeleted] = Source.[IsDeleted]
    WHEN NOT MATCHED BY TARGET THEN 
    INSERT ([OrganizationId],	[OrganizationName],	[DateCreated],	[IsDeleted])
    VALUES ([OrganizationId],	[OrganizationName],	[DateCreated],	[IsDeleted])
WHEN NOT MATCHED BY SOURCE THEN
DELETE;

SET IDENTITY_INSERT dbo.Organization OFF;  
