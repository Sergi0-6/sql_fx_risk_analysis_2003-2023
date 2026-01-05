/* ============================================================
   FX Risk Analysis Summary

   Purpose:
   This file consolidates key risk findings across EUR/USD,
   cross-currency comparisons, and market-wide FX behavior.

   Focus:
   - Baseline FX volatility
   - Risk persistence over time
   - Cross-pair risk differences
   - Systemic FX risk regimes

   Time Period:
   2003–2023
   ============================================================ */


/* ============================================================
   SECTION 0: Risk Metric Construction (EUR/USD)

   Purpose:
   Define core FX risk measures used throughout the analysis.

   Notes:
   - All measures are normalized by opening price
   - Direction-free metrics focus on volatility, not returns
   ============================================================ */

--Construct daily FX risk measures
SELECT [Date], EURUSD_Open, EURUSD_High, EURUSD_Low, EURUSD_Close,

-- Direction-free daily return (volatility proxy)
ABS((EURUSD_Close - EURUSD_Open) / EURUSD_Open) 
AS absolute_daily_ret,

-- Intraday trading range (within-day risk)
(EURUSD_High - EURUSD_Low) / EURUSD_Open 
AS intraday_range,

-- Raw daily return (used for dispersion analysis)
(EURUSD_Close - EURUSD_Open) / EURUSD_Open 
AS daily_ret

FROM fx_data;


/* ============================================================
   SECTION 1: Baseline EUR/USD Risk Characteristics

   Guiding Question:
   How volatile is EUR/USD on a typical trading day?
   ============================================================ */

--1.1: On a typical day, how big is the move?
SELECT AVG(absolute_daily_ret) 
AS AVG_ABS_DAILY_RETURN
FROM v_eurusd_movements;

--1.2: How wide does the market swing within a day?
SELECT AVG(intraday_range) 
AS AVG_INTRADAY_RANGE
FROM v_eurusd_movements;

--1.3: How dispersed are the daily returns?
SELECT STDEV(daily_ret)
AS RETURN_VOLATILITY
FROM v_eurusd_movements;


/* ============================================================
   SECTION 2: EUR/USD Risk Persistence Over Time

   Guiding Question:
   Does EUR/USD risk remain stable, or does it cluster?
   ============================================================ */

--2.1: How does short-term EUR/USD risk evolve over time?
SELECT top 30 *
FROM v_eurusd_rolling_risk
order by [date];

--2.2: When were periods of elevated short-term EUR/USD risk?
SELECT top 10 * from
v_eurusd_rolling_risk
order by ROLLING_10D_AVG_ABS_RET desc;

--2.3: How did EUR/USD risk vary at a monthly (macro) level?
SELECT * from v_eurusd_monthly_risk
order by year, month;


/* ============================================================
   SECTION 3: Cross-Currency FX Risk Comparison

   Guiding Question:
   How does EUR/USD risk compare to other major FX pairs?
   ============================================================ */

--3.1: Which currency pairs exhibit higher average daily volatility?
SELECT pair, AVG(absolute_daily_ret) AS avg_abs_daily_risk
FROM v_fx_risk_long
GROUP BY pair
ORDER BY avg_abs_daily_risk DESC;

--3.2: Which currency pairs experience larger intraday price swings?
SELECT pair, AVG(intraday_range) AS AVG_INTRADAY_RISK
FROM v_fx_risk_long
GROUP BY pair
ORDER BY AVG_INTRADAY_RISK DESC;

--3.3: How stable is risk across currency pairs over time?
SELECT pair, STDEV(absolute_daily_ret) / AVG(absolute_daily_ret) 
	AS RISK_INSTABILITY
FROM v_fx_risk_long
GROUP BY pair
ORDER BY risk_instability DESC;


/* ============================================================
   SECTION 4: Systemic FX Market Risk

   Guiding Question:
   Is FX risk driven by market-wide forces rather than
   individual currency pair dynamics?
   ============================================================ */

--4.1: How does overall FX market risk evolve over time?
SELECT *
FROM v_fx_market_monthly_risk
ORDER BY year, month;

--4.2: When did the FX market experience peak systemic risk?
SELECT TOP 12 *
FROM v_fx_market_monthly_risk
ORDER BY market_avg_abs_risk DESC;