# Build Data Models With dbt

A learning project demonstrating **dbt (data build tool)** fundamentals with a sample Jaffle Shop data warehouse project. The starter project developed by [dbt-learn-group-traing](https://github.com/dbt-labs/dbt-learn-group-training.git) was used.

## 📋 Overview

This project provides a practical introduction to dbt and its core concepts, including:

- **Models** — SQL-based transformations organized in a logical layering pattern
- **Sources** — Data sourced from raw data warehouses  
- **Tests** — Data quality and integrity tests
- **Seeds** — Static seed data files
- **Macros** — Reusable code generation and utility functions
- **Snapshots** — Capturing historical changes to dimensional data
- **Packages** — External dbt packages for enhanced functionality

## 🏗️ Project Structure

```
dbt_fundamentals/
├── README.md                 # This file
├── dbt_project.yml          # dbt configuration
├── packages.yml             # External package dependencies
├── package-lock.yml         # Locked package versions
├── models/                  # dbt models (transformations)
│   ├── staging/            # Staging layer (views)
│   └── marts/              # Mart layer (final tables)
├── tests/                   # dbt tests for data quality
├── seeds/                   # CSV seed data
├── snapshots/              # Historical snapshots
├── macros/                 # dbt macros and custom functions
├── analysis/               # Ad-hoc analyses
├── logs/                   # dbt logs (generated)
├── target/                 # Compiled dbt output (generated)
├── dbt_packages/           # External packages (generated)
│   ├── codegen/           # dbt-codegen for code generation
│   └── dbt_utils/         # dbt-utils for utility functions
└── .vscode/                # VS Code configuration
```

## 🚀 Quick Start

### Prerequisites

- **dbt Core** (version 1.0 or higher)
- **Python** 3.8+
- A **data warehouse** (Snowflake, BigQuery, Redshift, Postgres, etc.)

### Installation

You can clone the starter project repository from [dbt-learn-group-traing](https://github.com/dbt-labs/dbt-learn-group-training.git).


## 📦 Project Dependencies

This project uses two external dbt packages:

### 1. **dbt-codegen** v0.5.0
Code generation macros for automatically creating dbt models, YAML files, and tests.

- **Usage:** Generate source definitions, base models, YAML schemas
- **Learn more:** [dbt-codegen on dbt Hub](https://hub.getdbt.com/dbt-labs/codegen/latest/)

### 2. **dbt-utils** v0.1.0
A collection of generic tests, SQL generators, and utility macros.

- **Usage:** Data quality tests, SQL helpers (date_spine, deduplicate, etc.)
- **Learn more:** [dbt-utils on dbt Hub](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/)

## 🎯 Model Layers

The project follows a **medaillon architecture** (raw → staging → marts):

### Staging (`models/staging/`)
- Built as **views** for lightweight reference data
- Performs initial cleaning, renaming, and basic transformations
- Selects from raw data sources

### Marts (`models/marts/`)
- Built as **tables** for performance and final consumption
- Contains business logic and final aggregations
- Joins staging models for analytic purposes

## 🧪 Data Quality

Tests help ensure data reliability:

- **Freshness tests** — Verify source data is recent
- **Uniqueness tests** — Check for duplicate keys
- **Not null tests** — Ensure required fields are populated
- **Referential integrity** — Validate foreign key relationships

Run tests with:
```bash
dbt test
```

## 📖 Key Concepts

- **Models** — Reusable SQL queries that transform raw data
- **Sources** — References to external data tables (typically raw/staging schemas)
- **Refs** — Functions that reference other models safely
- **Macros** — Templated Jinja code for common patterns
- **Materialization** — How models are built (views or tables)

## 🛠️ Common dbt Commands

```bash
# Initialize a new dbt project
dbt init

# Parse and validate project
dbt parse

# Generate documentation
dbt docs generate

# Run models
dbt run

# Test data quality
dbt test

# Run specific models
dbt run --select model_name

# Seed data from CSV files
dbt seed

# Take snapshots for historical tracking
dbt snapshot

# Clean compiled artifacts
dbt clean
```

## 📚 Resources

- [dbt Documentation](https://docs.getdbt.com/)
- [dbt Community](https://community.getdbt.com/)
- [dbt Hub - Packages](https://hub.getdbt.com/)
- [dbt Jaffle Shop Tutorial](https://docs.getdbt.com/tutorial/build-your-first-project)

## 💡 Next Steps

1. **Explore the models** — Check `models/` directory to understand the transformation logic
2. **Review tests** — Look at `tests/` to see data quality checks in action
3. **Generate documentation** — Run `dbt docs generate && dbt docs serve` to browse the project
4. **Customize for your data** — Adapt sources and models to your warehouse schema
---

**Happy transforming! 🎉**
