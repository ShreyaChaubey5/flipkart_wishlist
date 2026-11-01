import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# Load dataset
df = pd.read_csv("data/flipkart_wishlist_analysis_cleaned.csv")

#Display first 5 rows
print(df.head())
print("Dataset shape:", df.shape)
print("\nColumn names:")
print(df.columns.tolist())

print("\nDataset information:")
print(df.info())

# Missing values
print("Missing values:")
print(df.isnull().sum())

# Availability categories
print("\nAvailability distribution:")
print(df["Status"].value_counts())

df["Status_Clean"] = df["Status"].replace({
    "Available (Assured)": "Available",
    "Currently unavailable": "Unavailable"
})

df["Price"] = pd.to_numeric(
    df["Price"],
    errors="coerce"
)

df["Original Price"] = pd.to_numeric(
    df["Original Price"],
    errors="coerce"
)
total_products = len(df)

unavailable_products = (
    df["Status"] == "Currently unavailable"
).sum()

unavailability_rate = (
    unavailable_products / total_products
) * 100

print("Total products:", total_products)
print("Unavailable products:", unavailable_products)
print("Unavailability rate:", round(unavailability_rate, 2), "%")

valid_prices = (
    df["Price"].notna()
    & df["Original Price"].notna()
    & (df["Original Price"] > 0)
)

df["Discount_Percentage"] = np.nan

df.loc[valid_prices, "Discount_Percentage"] = (
    (df.loc[valid_prices, "Original Price"]
     - df.loc[valid_prices, "Price"])
    / df.loc[valid_prices, "Original Price"]
) * 100

# Overall product availability — Bar chart

availability = df["Status"].value_counts()

plt.figure(figsize=(7, 5))

plt.bar(
    availability.index,
    availability.values
)

plt.title("Wishlist Product Availability")
plt.xlabel("Availability Status")
plt.ylabel("Number of Products")

plt.tight_layout()
plt.savefig("availability.png", dpi=300, bbox_inches="tight")
plt.show()

# Category-wise unavailability — Bar chart
category_analysis = (
    df.groupby("Category")
    .agg(
        total_products=("Product_id", "count"),
        unavailable_products=(
            "Status",
            lambda x: (x=="Currently unavailable").sum()
        )
    )
)

category_analysis["unavailability_rate"] = (
    category_analysis["unavailable_products"]
    / category_analysis["total_products"]
) * 100

plt.figure(figsize=(9, 5))

plt.bar(
    category_analysis.index,
    category_analysis["unavailability_rate"]
)

plt.title("Category-wise Unavailability Rate")
plt.xlabel("Product Category")
plt.ylabel("Unavailability Rate (%)")
plt.xticks(rotation=45, ha="right")

plt.tight_layout()
plt.savefig("category_unavailability.png", dpi=300, bbox_inches="tight")
plt.show()

# Price comparison — Box plot
available_prices = df.loc[
    df["Status"] == "Available",
    "Price"
].dropna()

unavailable_prices = df.loc[
    df["Status"]=="Currently unavailable",
    "Price"
].dropna()

plt.figure(figsize=(7, 5))

plt.boxplot(
    [available_prices, unavailable_prices],
    tick_labels=["Available", "Unavailable"]
)

plt.title("Price Distribution by Availability")
plt.xlabel("Availability Status")
plt.ylabel("Displayed Price (INR)")

plt.tight_layout()
plt.savefig("price.png", dpi=300, bbox_inches="tight")
plt.show()

# Category-wise product count — Stacked bar chart
category_counts = pd.crosstab(
    df["Category"],
    df["Status"]
)

plt.figure(figsize=(9, 5))

bottom = np.zeros(len(category_counts))

for status in ["Available", "Currently unavailable"]:
    if status in category_counts.columns:
        plt.bar(
            category_counts.index,
            category_counts[status],
            bottom=bottom,
            label=status
        )
        bottom += category_counts[status].values

plt.title("Product Availability Across Categories")
plt.xlabel("Category")
plt.ylabel("Number of Products")
plt.xticks(rotation=45, ha="right")
plt.legend()

plt.tight_layout()
plt.savefig("count.png", dpi=300, bbox_inches="tight")
plt.show()

df.to_csv("data/flipkart_wishlist_analysis_cleaned.csv", index=False)
print("Cleaned data saved to data/flipkart_wishlist_analysis_cleaned.csv")