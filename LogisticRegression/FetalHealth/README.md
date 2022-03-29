
# Imports

### Fundamental imports

```
import pandas as pd
import numpy as np
```

### Visualization

```
import matplotlib.pyplot as plt
```

### Separating training data and testing data

```
from sklearn.model_selection import train_test_split
```

### Modeling

```
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
```

### Installing `eli5` because not available on Colab. Will use for deciding on which features have an effect on the target.

```
!pip install eli5
```

###  To know which features are important

```
import eli5
from eli5.sklearn import PermutationImportance
```

# Reading details about the file

```
data = pd.read_csv('FetalHealth.csv')
data.T
```

```
data.describe().T
```

```
data.info()
```

No missing values according to `data.info()`

---

```
data.head()
```

```
data.tail()
```

# Making the first model

This first model will be used for the `eli5` to know which features are **important** and which are **not**. By only including the **important** features, the model may get a **higher accuracy** on predicting the **target**.

### Separating the columns into features and target

```
target = 'fetal_health'
y = data[target]
X = data.drop([target], axis = 1)
```

#### Features

```
X
```

#### Target

```
y
```

#### Spliting training set and testing set. Also finding the accuracy of the model

```
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.33, random_state = 0)
pipe = make_pipeline(StandardScaler(), LogisticRegression())
pipe.fit(X_train, y_train)
old_model_accuracy = pipe.score(X_test, y_test)
old_model_accuracy
```

# Finding Important Features

Use Permutation Importance and eli5

```
perm = PermutationImportance(pipe, random_state=0).fit(X_test, y_test)
eli5.show_weights(perm, feature_names = X.columns.tolist())
```

#### Usable features

```
usable_features = ['histogram_mean', 'accelerations', 'abnormal_short_term_variability', 
                     'histogram_median', 'prolongued_decelerations', 'histogram_variance', 
                     'percentage_of_time_with_abnormal_long_term_variability',
                     'baseline value', 'uterine_contractions', 'histogram_mode', 'histogram_number_of_peaks',
                     'histogram_max', 'mean_value_of_short_term_variability', 'histogram_min',
                     'fetal_movement', 'histogram_number_of_zeroes', 'histogram_width', 'mean_value_of_short_term_variability', 
                   'fetal_health']
```

```
data = data[usable_features]
data.T
```

#### Making new variables for features and target

```
new_X = data.drop([target], axis=1)
new_y = data[target]
```

#### Training the new variables and finding accuracy of the model

```
new_X_train, new_X_test, new_y_train, new_y_test = train_test_split(new_X, new_y, test_size = 0.33, random_state = 0)
pipe = make_pipeline(StandardScaler(), LogisticRegression())
pipe.fit(new_X_train, new_y_train)
new_model_accuracy = pipe.score(new_X_test, new_y_test)
new_model_accuracy
```

#### Comparison of old and new models

```
print('score of old:', old_model_accuracy)
print('score of new:', new_model_accuracy)
```

# Downloading the new dataset

```
data.to_csv('reduced_FetalHealth.csv')
```
