# My Cleaning Process

#### Importing the external libraries

The codes `import pandas as pd` and `import numpy as np` are my first set of codes for the cleaning. This imports can give me insights about the dataset.

#### Read the file

For this example, the file is in `.csv` format.

```
data = pd.read_csv(file)
```

#### Getting insight

These are my *go-tos* code for getting insights about the dataset.

1. `data.info()` - To know if there are any columns with missing values. This can be done if the `Non-Null Count` is lesser than the entries. Additionally, this is used to know the datatypes of each column.
2. `data.head()` and `data.tail()` - To have a peak on the values of the dataset. If there are any `object` value, check if they are categorical or unique.
3. `data.describe()` - To know the values that can be used for imputing numerical values on columns with numerical datatype.
