CREATE TABLE [dbo].[Refunds]
(
    -- 원 결제(Payment)에 대해 발생하는 환불(부분/전체)을 저장하는 테이블
    -- 성공한 환불, 대기 중인 환불, 실패한 환불 등 상태 관리 가능

    [RefundId]              INT IDENTITY(1,1) NOT NULL PRIMARY KEY,

    -- 원 결제 ID (dbo.Payments.PaymentId)
    [PaymentId]             INT NULL,

    -- 외부 환불 고유 ID (예: PG사 Refund ID)
    [ExternalRefundId]      NVARCHAR(100) NOT NULL,

    -- 외부 결제 시스템에서 제공하는 원 결제 고유 ID (백업/검색용)
    [ExternalTransactionId] NVARCHAR(100) NULL,

    -- 환불 금액
    [Amount]                INT NOT NULL,

    -- 통화
    [Currency]              CHAR(3) NOT NULL,

    -- 환불 사유 (예: 'requested_by_user', 'duplicate', 'product_issue')
    [Reason]                NVARCHAR(100) NULL,

    -- 환불 상태 (예: 'pending', 'succeeded', 'failed')
    [Status]                NVARCHAR(50) NOT NULL,

    -- 부분 환불 여부 (결제 금액보다 작다면 TRUE)
    [IsPartial]             BIT NOT NULL CONSTRAINT DF_Refunds_IsPartial DEFAULT 0,

    -- 외부 PG사로부터 받은 메타데이터 또는 Raw JSON 일부 저장 가능
    [MetadataJson]          NVARCHAR(MAX) NULL,

    -- 생성 시각
    [CreatedAtUtc]          DATETIME2 NOT NULL CONSTRAINT DF_Refunds_CreatedAtUtc DEFAULT SYSUTCDATETIME(),

    -- 상태 업데이트 시각
    [UpdatedAtUtc]          DATETIME2 NULL
)
