CREATE TABLE [dbo].[Customers]
(
    [Id] BIGINT IDENTITY(1,1) NOT NULL,
    [TenantId] NVARCHAR(64) NOT NULL,
    [OrganizationName] NVARCHAR(200) NOT NULL,
    [BillingEmail] NVARCHAR(200) NOT NULL,
    [Domain] NVARCHAR(200) NULL,
    [Type] INT NOT NULL CONSTRAINT DF_Customers_Type DEFAULT(0),
    CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED ([Id] ASC)
);
GO

CREATE NONCLUSTERED INDEX IX_Customers_Tenant_OrgName
ON [dbo].[Customers]([TenantId], [OrganizationName]);
GO
