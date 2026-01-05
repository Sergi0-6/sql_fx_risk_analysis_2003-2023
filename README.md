# sql_fx_risk_analysis_2003-2023
SQL-based analysis of FX market risk (2003–2023), examining volatility dynamics, cross-currency comparisons, and systemic risk regimes.

This project analyzes foreign exchange (FX) market risk using historical daily price data from 2003 to 2023. The analysis focuses on measuring volatility, risk persistence, and cross-currency differences using SQL-based risk metrics. By aggregating risk measures across time and currency pairs, the project examines whether FX volatility is driven by pair-specific dynamics or systemic market forces.

## Dataset
- Source: Kaggle – Foreign Exchange Rates (Daily Updates)
- Time Period: 2003–2023
- Frequency: Daily
- Currency Pairs:
  - EUR/USD
  - EUR/CAD
  - EUR/GBP
  - USD/JPY
  - GBP/JPY
 
## Methodology & Assumptions
- FX risk is measured using direction-free metrics to avoid directional bias.
- Daily returns are normalized by opening prices for comparability.
- Rolling and monthly aggregations are used to capture volatility clustering and risk regimes.
- The analysis focuses on historical behavior rather than predictive modeling.

## Risk Measures Used
- Absolute Daily Return: Measures the magnitude of daily price movements.
- Intraday Range: Captures within-day price instability.
- Rolling 10-Day Average Risk: Identifies short-term volatility clustering.
- Monthly Average Risk: Highlights macro-level risk regimes.
- Coefficient of Variation: Measures risk instability relative to typical daily movement.

## Analysis Structure

### 1. EUR/USD Risk Characteristics
Establishes baseline volatility and intraday risk for a highly liquid FX pair.

### 2. Risk Dynamics Over Time
Examines volatility clustering and regime changes using rolling and monthly aggregation.

### 3. Cross-Currency Risk Comparison
Compares EUR/USD risk to other major FX pairs, highlighting differences in volatility and stability.

### 4. Market-Wide FX Risk Regimes
Aggregates risk across all currency pairs to identify periods of systemic FX stress.

## Key Findings
- EUR/USD exhibits lower average daily risk relative to JPY-based currency pairs.
- FX risk is not constant over time and shows strong volatility clustering.
- JPY and GBP cross-pairs display higher risk instability.
- FX market risk often increases simultaneously across currency pairs during macroeconomic stress periods.
