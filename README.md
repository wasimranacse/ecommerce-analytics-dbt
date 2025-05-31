# Analytics Engineering with Snowflake, dbt & SQL

This dbt project transforms and models e-commerce order data using Snowflake as the data warehouse.

## Structure

- `models/staging/`: Cleaned raw data
- `models/marts/facts/`: Fact tables
- `models/marts/dims/`: Dimension tables
- `models/core/`: Aggregated metrics and summaries

## How to run

```bash
dbt run
dbt test
