/* ============================================================
   View Purpose:
   Constructs a proxy for systemic FX market risk by averaging
   absolute daily returns across major currency pairs at the
   monthly level.

   Methodology:
   - Uses normalized (percentage-based) daily returns
   - Aggregates across currency pairs
   - Further aggregated by calendar month

   Interpretation:
   Elevated values suggest market-wide FX stress rather than
   isolated pair-specific volatility.
   ============================================================ */

CREATE VIEW v_fx_market_monthly_risk AS
SELECT
    YEAR([Date]) AS year,
    MONTH([Date]) AS month,
    AVG(absolute_daily_ret) AS market_avg_abs_risk
FROM v_fx_risk_long
GROUP BY YEAR([Date]), MONTH([Date]);
