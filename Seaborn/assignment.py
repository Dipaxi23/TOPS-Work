import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
bank_df=pd.read_csv('bank.csv')
sns.countplot(data=bank_df,x='housing',hue='deposit')
plt.xlabel('Housing Loan')
plt.ylabel('Customer Count')
plt.savefig('task5_2.png')
plt.show()