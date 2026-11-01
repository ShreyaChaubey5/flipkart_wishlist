Beyond the Wishlist: Flipkart Product Availability Analysis

Project Overview

This project explores product availability patterns in a personal Flipkart wishlist using Python, Pandas, Matplotlib, and SQL.

The idea originated from a customer experience observation: several products saved in my wishlist were unavailable when I checked them.

I conducted an exploratory analysis of 37 wishlist products to understand availability patterns, category-level unavailability, and displayed price differences.

Business Questions

What percentage of wishlist products are unavailable?

Which product categories have the highest unavailability rate?

How do displayed prices differ between available and unavailable products?

Which unavailable products have the highest displayed prices?

Tools & Technologies

Python

Pandas

NumPy

Matplotlib

SQL (SQLite)

Jupyter Notebook

Git and GitHub

Dataset

Source: Personal Flipkart wishlist

Records: 37 products

Columns: 7

Format: CSV

The dataset includes product identifiers, product names, displayed prices, original prices, discounts, availability status, and categories.

Key Findings

1. Overall Availability

Metric

Result

Total products

37

Available products

27

Unavailable products

10

Unavailability rate

27.03%

2. Category-wise Unavailability

Category

Total

Unavailable

Rate

Blazers

1

1

100%

Books

1

1

100%

Dresses

4

2

50%

Ethnic Wear

2

1

50%

Jeans

6

2

33.33%

Jewellery

3

1

33.33%

Footwear

5

1

20%

Western Wear

10

1

10%

Other categories in the dataset had no unavailable products.

3. Displayed Price Comparison

Metric

Available

Unavailable

Products

27

10

Products with recorded prices

26

5

Average price

₹439.46

₹572.60

Minimum price

₹66

₹184

Maximum price

₹1,099

₹1,398

Unavailable products had a higher average recorded displayed price in this sample. This is a descriptive comparison, not evidence that price causes unavailability.

4. Highest-priced Unavailable Products

Product

Displayed Price

Practical Statistics for Data Scientists

₹1,398

AAYU Women Fit and Flare Blue Maxi Dress

₹598

Women Two Piece Dress Brown Maxi

₹419

KOTTY Casual Printed Women Multicolor Top

₹264

Casual Women Blazer

₹184

Five other unavailable products had missing displayed prices.

Product Improvement Opportunity

The analysis inspired a conceptual feature idea: Smart Wishlist Availability Tracking.

Potential features include:

Monitoring availability of saved products.

Optional restock notifications.

Recommendations for similar available products.

Better visibility into products that are temporarily unavailable.

A further hypothesis is that repeated views of unavailable wishlist products may indicate stronger purchase interest. This would need to be tested using anonymised browsing, wishlist, inventory, and purchase data.

Limitations

The dataset contains only 37 products from one customer's wishlist.

It does not represent Flipkart's overall customer base.

Browsing history and purchase outcomes were unavailable.

Historical inventory data was unavailable.

Some product prices were missing.

The analysis cannot establish lost revenue, platform-wide stockout rates, or customer demand.

The findings are exploratory observations, not platform-wide conclusions.
