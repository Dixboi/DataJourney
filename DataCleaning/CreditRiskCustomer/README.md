# Imports for preprocessing

```
import pandas as pd
import numpy as np
```

# Imports for dealing with missing values

```
import missingno as msno
from sklearn.impute import SimpleImputer as SI
```

# Imports for visualization

```
import matplotlib.pyplot as plt
import seaborn as sb
```

# Reading Summary and Statistics

Reading the csv file

```
data = pd.read_csv('credit_risk_customer_data.csv')
```

Using `.describe`, `.info`, `.head`, `.tail` to have a glimpse of the dataset

```
data.describe().T
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

# Showing Columns with Missing Values

```
mask = data.isnull()
columns_wmiss = data.columns[mask.any()].tolist()
msno.matrix(data[columns_wmiss])
plt.figure(figsize=(3, 3))
plt.show()
```

Only the feature `fea_2` has missing values.

# Filling the Missing Values

```
features_wmiss = ['fea_2']
imp = SI(missing_values=np.nan, strategy='constant', fill_value=0)
data[features_wmiss] = imp.fit_transform(data[features_wmiss])
data[features_wmiss].info()
```

The `imp = SI(missing_values=np.nan, strategy='constant', fill_value=0)` was used because maybe the feature is not applicable on that particular id/user or he/she does not have any.

Now, the `fea_2` features doesn't have any missing values.

# Downloading Cleaned Dataset

```
data.to_csv('cleaned_credit_risk_customer_data.csv')
```



