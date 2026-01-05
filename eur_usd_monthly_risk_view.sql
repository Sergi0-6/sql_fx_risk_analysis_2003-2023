/* ============================================================
   View Purpose:
   Aggregates EUR/USD daily risk to a monthly level.

   Why Monthly Aggregation:
   Smooths daily noise and highlights macroeconomic risk
   regimes across time.

   Interpretation:
   Monthly spikes often align with global financial stress,
   policy shifts, or crisis periods.
   ============================================================ */

CREATE VIEW v_eurusd_monthly_risk AS
SELECT
    YEAR([Date]) AS year,
    MONTH([Date]) AS month,
    AVG(ABSOLUTE_DAILY_RET) AS AVG_MONTHLY_ABS_RET
FROM v_eurusd_movements
GROUP BY
    YEAR([Date]),
    MONTH([Date]);
