/* ============================================================
   View Purpose:
   Transforms FX data into a long format for cross-currency
   risk comparison.

   Currency Pairs Included:
   - EUR/USD
   - EUR/CAD
   - EUR/GBP
   - USD/JPY
   - GBP/JPY

   Rationale:
   Enables pair-level risk ranking and relative stability
   analysis using consistent metrics.
   ============================================================ */

CREATE VIEW v_fx_risk_long AS

-- EUR/USD
SELECT
    [Date],
    'EURUSD' AS pair,
    ABS((EURUSD_Close - EURUSD_Open) / EURUSD_Open) AS absolute_daily_ret,
    (EURUSD_High - EURUSD_Low) / EURUSD_Open AS intraday_range
FROM fx_data

UNION ALL

-- EUR/CAD
SELECT
    [Date],
    'EURCAD' AS pair,
    ABS((EURCAD_Close - EURCAD_Open) / EURCAD_Open),
    (EURCAD_High - EURCAD_Low) / EURCAD_Open
FROM fx_data

UNION ALL

-- EUR/GBP
SELECT
    [Date],
    'EURGBP' AS pair,
    ABS((EURGBP_Close - EURGBP_Open) / EURGBP_Open),
    (EURGBP_High - EURGBP_Low) / EURGBP_Open
FROM fx_data

UNION ALL

-- USD/JPY
SELECT
    [Date],
    'USDJPY' AS pair,
    ABS((USDJPY_Close - USDJPY_Open) / USDJPY_Open),
    (USDJPY_High - USDJPY_Low) / USDJPY_Open
FROM fx_data

UNION ALL

-- GBP/JPY
SELECT
    [Date],
    'GBPJPY' AS pair,
    ABS((GBPJPY_Close - GBPJPY_Open) / GBPJPY_Open),
    (GBPJPY_High - GBPJPY_Low) / GBPJPY_Open
FROM fx_data;
