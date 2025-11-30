CREATE TABLE [dbo].[Disputes]
(
    -- 결제에 대해 구매자 또는 카드사/은행 등이 문제를 제기한 기록을 저장하는 테이블
    -- 예: 결제 사기, 이중 청구, 미수령, 품목 불만 등

    [DisputeId]             INT IDENTITY(1,1) NOT NULL PRIMARY KEY,

    -- 어떤 결제에 대한 분쟁인지 연결 (dbo.Payments.PaymentId)
    [PaymentId]             INT NULL,

    -- 외부 분쟁 고유 ID (예: PG사에서 제공하는 dispute ID)
    [ExternalDisputeId]     NVARCHAR(100) NOT NULL,

    -- 외부 결제 시스템의 결제 ID (백업/검색용)
    [ExternalTransactionId] NVARCHAR(100) NULL,

    -- 분쟁 금액 (최소 단위)
    [Amount]                INT NOT NULL,

    -- 통화 (예: 'usd', 'krw')
    [Currency]              CHAR(3) NOT NULL,

    -- 분쟁 사유 (예: 'fraud', 'duplicate', 'not_received' 등)
    [Reason]                NVARCHAR(100) NULL,

    -- 분쟁 상태 (예: 'open', 'under_review', 'won', 'lost')
    [Status]                NVARCHAR(50) NOT NULL,

    -- 증빙자료 제출 마감 시각(UTC 기준) - 선택사항
    [EvidenceDueByUtc]      DATETIME2 NULL,

    -- 분쟁 과정 중 외부 결제 시스템에서 자동 환불/취소가 이루어졌는지 여부
    [IsChargeReversed]      BIT NOT NULL CONSTRAINT DF_Disputes_IsChargeReversed DEFAULT 0,

    -- 레코드 생성 시각
    [CreatedAtUtc]          DATETIME2 NOT NULL CONSTRAINT DF_Disputes_CreatedAtUtc DEFAULT SYSUTCDATETIME(),

    -- 분쟁 상태 업데이트 시각
    [UpdatedAtUtc]          DATETIME2 NULL
)
