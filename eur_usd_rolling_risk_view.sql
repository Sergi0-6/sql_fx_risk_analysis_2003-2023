/* ============================================================
   View Purpose:
   Measures short-term EUR/USD risk persistence using a rolling
   10-day average of absolute daily returns.

   Why Rolling Windows:
   FX volatility tends to cluster; rolling averages help detect
   regime shifts and sustained stress periods.

   Interpretation:
   Higher values indicate elevated short-term FX risk.
   ============================================================ */

CREATE VIEW v_eurusd_rolling_risk AS
SELECT
    [Date],
    ABSOLUTE_DAILY_RET,
    AVG(absolute_daily_ret) 
    OVER (ORDER BY [Date]
    ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) 
    AS ROLLING_10D_AVG_ABS_RET
FROM v_eurusd_movements;