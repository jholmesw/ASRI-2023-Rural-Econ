import pandas as pd
from pandas import DataFrame


def main():
    # Reading in the data
    df = pd.read_csv("rural-econ.csv")

    # Selecting the ID columns to be rejoined to master dataframe
    features = ['FIPS', 'State', 'County']
    iddf = df[features]
    iddf = iddf.drop_duplicates()
    iddf = iddf.set_index('FIPS')
    # Checking this is correct
    # print(iddf.head())

    # Saving this as a file for future reference
    iddf.to_csv("FIPS_key.csv")
    # Checking names of columns
    # print(iddf.columns)

    # Pivoting the dataframe to spread out the attribute and value columns
    wide_df = df.pivot(index='FIPS', columns='Attribute', values='Value')
    # Checking that it is correct
    # print(wide_df.columns)

    # Joining the ID columns that were removed from the pivot
    union: DataFrame = pd.merge(iddf, wide_df, how='outer', on='FIPS')

    # Checking that this looks right
    # print(union.head())

    # Saving the final CSV file
    union.to_csv("rural-econ-edit.csv")


if __name__ == "__main__":
    main()