CREATE TABLE [dbo].[InvoiceItems]
(
    [Id] BIGINT IDENTITY(1,1) NOT NULL,
    [InvoiceId] BIGINT NOT NULL,
    [Description] NVARCHAR(200) NOT NULL,
    [Quantity] DECIMAL(18,2) NOT NULL CONSTRAINT DF_InvoiceItems_Quantity DEFAULT (1),
    [UnitPrice] DECIMAL(18,2) NOT NULL CONSTRAINT DF_InvoiceItems_UnitPrice DEFAULT (0),
    CONSTRAINT PK_InvoiceItems PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT FK_InvoiceItems_Invoices FOREIGN KEY ([InvoiceId]) REFERENCES [dbo].[Invoices]([Id]) ON DELETE CASCADE
);
GO

CREATE NONCLUSTERED INDEX IX_InvoiceItems_InvoiceId
ON [dbo].[InvoiceItems] ([InvoiceId]);
GO
