# Missing values
```
print('NUMBER OF MISSING VALUES FOR EACH FEATURE:')
print(data.isna().sum())
```
# Duplicates
```
print(f'Duplicates in the dataset: {data.duplicated().sum()}')
print(f'Percentage of duplicates: {data.duplicated().sum()/len(data)}%')
```
# Cardinality and Data Types
```
data.nunique()
data.dtypes
```
# Label Encoding Automatically
```
encoder = LabelEncoder()
data[feature] = encoder.fit_transform(data[feature])
```
# Train Test Split
```
target = feature
y = baseline_data[target]
X = baseline_data.drop([target], axis=1)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.33, random_state = 0)
```
# Target Distribution - Pie Plot
```
plt.figure(figsize=(8,8))
data[feature].value_counts().plot.pie(autopct='%1.1f%%', textprops={'fontsize':12}).set_title(title)
```
# Counting unique values
```
data[feature].value_counts()
```
# Balancing distribution
```
def sampling_k_elements(feature, k=num):
    if len(feature) < k:
        return feature
    return feature.sample(k)

data = data.groupby(feature).apply(sampling_k_elements).reset_index(drop=True)
```
