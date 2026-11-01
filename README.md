**Beyond the Wishlist: Flipkart Product Availability Analysis**

Project Overview
This project started with a personal problem.

I wanted to buy Practical Statistics for Data Scientists, but when I checked Flipkart, the book had been out of stock for more than a week. Since I needed it, I kept checking its availability.

This made me curious about something bigger: What happens when customers save products they genuinely want to buy, but those products become unavailable?

I decided to explore this question using my own Flipkart wishlist. I collected data on 37 products and analysed their availability, category-wise patterns, and displayed prices using Python, Pandas, Matplotlib, and SQL.

The goal was to turn a real customer experience into a data-driven product improvement hypothesis.

Tools & Technologies

Python

Pandas

NumPy

Matplotlib

Git and GitHub

Dataset

Source: Personal Flipkart wishlist

Records: 37 products

Columns: 7

Format: CSV

The dataset includes product identifiers, product names, displayed prices, original prices, discounts, availability status, and categories.

Key Findings

1. Overall Availability
<img width="938" height="287" alt="image" src="https://github.com/user-attachments/assets/67486f16-0285-4a20-a664-dbebb5313e24" />

2. Category-wise Unavailability
   <img width="947" height="502" alt="image" src="https://github.com/user-attachments/assets/1a12cfe8-39e8-49ad-9bf7-570d29c087f9" />
   Other categories in the dataset had no unavailable products.

3. Displayed Price Comparison
   <img width="937" height="355" alt="image" src="https://github.com/user-attachments/assets/94161856-155f-4a6f-b363-18799b8876e6" />
 Unavailable products had a higher average recorded displayed price in this sample. This is a descriptive comparison, not evidence that price causes unavailability.

4. Highest-priced Unavailable Products
   <img width="948" height="360" alt="image" src="https://github.com/user-attachments/assets/986a7553-74f5-46d8-9687-13544785f13b" />
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



