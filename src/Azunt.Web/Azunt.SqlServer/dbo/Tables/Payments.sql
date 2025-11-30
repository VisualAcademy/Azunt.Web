CREATE TABLE [dbo].[Payments]
(
    -- 모든 결제(승인/정상 결제)의 원본 정보를 저장하는 테이블
    -- Refunds, Disputes 등 후속 사건들은 항상 특정 결제에 종속됨

    [PaymentId]             INT IDENTITY(1,1) NOT NULL PRIMARY KEY,

    -- 외부 결제 시스템의 결제 고유 ID (예: PG사 TransactionId)
    [ExternalTransactionId] NVARCHAR(100) NOT NULL,

    -- 결제 금액 (최소 단위: 원, 센트 등)
    [Amount]                INT NOT NULL,

    -- 통화 코드 (예: 'usd', 'krw')
    [Currency]              CHAR(3) NOT NULL,

    -- 내부 고객 ID (선택)
    [CustomerId]            INT NULL,

    -- 결제 상태 (예: 'paid', 'failed', 'pending')
    [Status]                NVARCHAR(50) NOT NULL,

    -- 결제가 생성된 시각 (UTC 기준 권장)
    [CreatedAtUtc]          DATETIME2 NOT NULL CONSTRAINT DF_Payments_CreatedAtUtc DEFAULT SYSUTCDATETIME()
)
