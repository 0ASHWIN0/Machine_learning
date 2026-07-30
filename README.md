# California Housing Price Prediction

A regression-based housing price prediction project using the California housing dataset. The entire workflow is implemented in the Jupyter notebook `housing_prediction.ipynb`.

## Project Workflow

1. **Data Acquisition** — downloads and extracts the housing dataset from a remote repository.
2. **Data Loading** — reads the CSV into a pandas DataFrame.
3. **Exploratory Data Analysis** — inspects data types, missing values, summary statistics, distributions, and correlations.
4. **Data Preprocessing** — creates training and test sets using random split, deterministic CRC32-based split, and stratified sampling by median income.
5. **Data Visualization** — scatter plots of geographic data, correlation matrix, scatter matrix, and feature relationships.
6. **Feature Engineering** — creates combined attributes (rooms per household, bedrooms per room, population per household).
7. **Data Preparation Pipeline** — handles missing values (median imputation), categorical encoding (OrdinalEncoder, OneHotEncoder), custom transformers, and feature scaling (StandardScaler) via `ColumnTransformer`.
8. **Model Training & Evaluation** — trains a `LinearRegression` model and evaluates performance using RMSE.

## Files

| File | Description |
|------|-------------|
| `housing_prediction.ipynb` | Full ML workflow notebook |
| `main.py` | Entry point |
| `datasets/housing/housing.csv` | California housing dataset |
| `pyproject.toml` | Project metadata and dependencies |
| `README.md` | This file |

## Dependencies

- Python >= 3.14
- pandas, numpy, scikit-learn, matplotlib, jupyterlab

## Getting Started

```bash
python -m venv .venv && source .venv/bin/activate
pip install -e .
jupyter notebook housing_prediction.ipynb
```
