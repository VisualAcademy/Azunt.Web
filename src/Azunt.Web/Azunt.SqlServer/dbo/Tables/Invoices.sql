CREATE TABLE [dbo].[Invoices]
(
    [Id] BIGINT IDENTITY(1,1) NOT NULL,
    [TenantId] NVARCHAR(64) NOT NULL,
    [CustomerId] BIGINT NOT NULL,
    [InvoiceNumber] NVARCHAR(32) NOT NULL,
    [IssueDateUtc] DATETIME2(7) NOT NULL,
    [DueDateUtc] DATETIME2(7) NULL,
    [Currency] NVARCHAR(8) NOT NULL CONSTRAINT DF_Invoices_Currency DEFAULT (N'USD'),
    [ApplyTax] BIT NOT NULL CONSTRAINT DF_Invoices_ApplyTax DEFAULT (0),
    [TaxRate] DECIMAL(18,4) NOT NULL CONSTRAINT DF_Invoices_TaxRate DEFAULT (0),
    [Subtotal] DECIMAL(18,2) NOT NULL CONSTRAINT DF_Invoices_Subtotal DEFAULT (0),
    [Tax] DECIMAL(18,2) NOT NULL CONSTRAINT DF_Invoices_Tax DEFAULT (0),
    [Total] DECIMAL(18,2) NOT NULL CONSTRAINT DF_Invoices_Total DEFAULT (0),
    [Status] INT NOT NULL CONSTRAINT DF_Invoices_Status DEFAULT (0),
    [PdfPath] NVARCHAR(512) NULL,
    [CreatedUtc] DATETIME2(7) NOT NULL CONSTRAINT DF_Invoices_CreatedUtc DEFAULT (SYSUTCDATETIME()),
    [UpdatedUtc] DATETIME2(7) NOT NULL CONSTRAINT DF_Invoices_UpdatedUtc DEFAULT (SYSUTCDATETIME()),
    [EmailSentUtc] DATETIME2(7) NULL,
    [IsDeleted] BIT NOT NULL CONSTRAINT DF_Invoices_IsDeleted DEFAULT (0),
    [DeletedUtc] DATETIME2(7) NULL,
    CONSTRAINT PK_Invoices PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT FK_Invoices_Customers FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers]([Id])
);
GO

CREATE UNIQUE NONCLUSTERED INDEX IX_Invoices_Tenant_InvoiceNumber
ON [dbo].[Invoices] ([TenantId], [InvoiceNumber]);
GO

CREATE NONCLUSTERED INDEX IX_Invoices_Tenant_Status_IssueDate
ON [dbo].[Invoices] ([TenantId], [Status], [IssueDateUtc] DESC);
GO
