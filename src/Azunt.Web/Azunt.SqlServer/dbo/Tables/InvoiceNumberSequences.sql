CREATE TABLE [dbo].[InvoiceNumberSequences]
(
    [TenantId] NVARCHAR(64) NOT NULL,
    [NextValue] BIGINT NOT NULL,
    CONSTRAINT PK_InvoiceNumberSequences PRIMARY KEY CLUSTERED ([TenantId] ASC)
);
GO
