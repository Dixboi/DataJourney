# Importing Libraries

```
import pandas as pd
import numpy as np

import missingno as msno

from sklearn.impute import SimpleImputer as SI

import matplotlib.pyplot as plt
import seaborn as sb

from scipy.stats import skew
```

# Read data and summary statistics

Using `.describe`, `.info`, `.head`, `.tail` to have a glimpse of the dataset

```
data = pd.read_csv('house_prices.csv')
```

```
data.describe()
```

```
data.info()
```

```
data.head()
```

```
data.tail()
```

# Missing Values
## Show which features has missing values

```
mask = data.isnull()
total = mask.sum()

missing_data = pd.concat([total], axis=1,join='outer',
                         keys=['count_missing'])
missing_data.sort_values(by='count_missing', ascending=False, inplace=True)
missing_datamask = data.isnull()
missing_data
```

## Displaying visually the missing values of the uncleaned data

```
nullable_columns = data.columns[mask.any()].tolist()
msno.matrix(data[nullable_columns])
plt.show()
```

# Filling Missing Values
## Cleaning features with text as values

```
object_features = ["PoolQC", "MiscFeature", "Alley", "Fence", "FireplaceQu", "GarageCond", "GarageType", "GarageQual", "GarageFinish", "BsmtExposure", "BsmtQual", "BsmtCond", "BsmtFinType2", "BsmtFinType1", "MasVnrType", "Electrical"]
imp = SI(missing_values=np.nan, strategy='constant', fill_value='NA')
data[object_features] = imp.fit_transform(data[object_features])
data[object_features].info()
```

## Cleaning features with numerical values

**Thoughts:** `strategy='constant', fill_value=0` is used because the feature does not exist on the house, hence 0.
```
float_to_zero_features = ["LotFrontage", "MasVnrArea"]
imp = SI(missing_values=np.nan, strategy='constant', fill_value = 0)
data[float_to_zero_features] = imp.fit_transform(data[float_to_zero_features])
data[float_to_zero_features].info()
```

## Displaying visually the missing values of the cleaned data

```
nullable_columns = data.columns[mask.any()].tolist()
msno.matrix(data[nullable_columns])
plt.show()
```

**GarageYrBlt** is untouched because I don't know how to clean missing years.

# Saving Cleaned Dataset

```
data.to_csv('cleaned_house_prices.csv')
```

# Data Skewness and Kurtosis

```
data.skew()
```

```
data.skew().sort_values()
```

## Skewness of SalePrice

```
plt.figure(figsize=(5, 3.5))
sb.distplot(data["SalePrice"])
plt.show()
```

## Skewness of features that are cleaned with numerical values including SalePrice

```
for k in data[float_to_zero_features]:
  print(k)
  print(skew(data[float_to_zero_features][k]))

  plt.figure(figsize=(5, 3.5))
  sb.distplot(data[float_to_zero_features][k])
  plt.show()
```

## Pair plot

```
to_pair_plot = ["LotFrontage", "MasVnrArea", "SalePrice"]

sb.pairplot(data[to_pair_plot].dropna(), kind ='scatter', diag_kind='kde')
plt.show()
```

# Balancing the Distribution of Values

## Visualizing all categories of the feature(SaleCondition)

```
plt.figure(figsize=(5, 3.5))

data.SaleCondition.value_counts().plot(kind='bar')

plt.ylabel('Number of data points')
plt.xlabel('SaleCondition')
plt.show()
```

## Counting each category of the feature(SaleCondition)

```
count_category = data.SaleCondition.value_counts(dropna=False,)
count_category
```

## Removing `Family`, `Alloca`, and `AdjLand` because not required from the requirements

```
data['SaleCondition'].replace(to_replace=['Family','Alloca','AdjLand'], value=np.NAN, inplace=True)
```
## Recounting each category

```
new_count_category = data.SaleCondition.value_counts(dropna=False,)
new_count_category
```

## Balancing all categories

**101** is chosen since `Abnorml` category has 101

```
def sampling_k_elements(SaleCondition, k=101):
    if len(SaleCondition) < k:
        return SaleCondition
    return SaleCondition.sample(k)

balanced = data.groupby('SaleCondition').apply(sampling_k_elements).reset_index(drop=True)
```

## Recounting the balanced categories

```
count_balanced = balanced.SaleCondition.value_counts(dropna=False,)
count_balanced
```

## Visualizing the balanced categories

```
plt.figure(figsize=(5, 3.5))

plt.bar(count_balanced.index, count_balanced)

plt.ylabel('Number of data points')
plt.xlabel('SaleCondition')
plt.show()
```

# Saving Cleaned and Balanced Dataset

```
data.to_csv('balanced_house_prices.csv')
```
