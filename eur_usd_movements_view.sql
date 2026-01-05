/* ============================================================
   View Purpose:
   Constructs core EUR/USD daily risk metrics used throughout
   the analysis.

   Metrics Included:
   - Absolute daily return
   - Intraday range
   - Raw daily return (for dispersion)

   Rationale:
   These measures provide direction-free and normalized risk
   indicators suitable for time-series analysis.
   ============================================================ */

CREATE VIEW v_eurusd_movements AS
SELECT
    [Date],
    EURUSD_Open,
    EURUSD_High,
    EURUSD_Low,
    EURUSD_Close,
    ((EURUSD_Close - LAG(EURUSD_Close) OVER (ORDER BY [Date]))
 / (LAG(EURUSD_Close) OVER (ORDER BY [Date]))) AS DAILY_RET,
 abs((EURUSD_Close - LAG(EURUSD_Close) OVER (ORDER BY [Date]))
 / (LAG(EURUSD_Close) OVER (ORDER BY [Date]))) AS ABSOLUTE_DAILY_RET,
 (EURUSD_High - EURUSD_Low) / EURUSD_Open AS INTRADAY_RANGE
 FROM fx_data;