

-- ============================================================
-- PROJECT: Flipkart Wishlist Availability Analysis
-- DATASET: 37 personal wishlist products
-- TOOL: SQLite
-- ============================================================


-- ============================================================
-- BUSINESS QUESTION 1:
-- What percentage of wishlist products are unavailable?
-- ============================================================

SELECT
    COUNT(*) AS total_products,

    SUM(
        CASE
            WHEN Status IN ('Currently unavailable', 'Not Available')
            THEN 1
            ELSE 0
        END
    ) AS unavailable_products,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN Status IN ('Currently unavailable', 'Not Available')
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS unavailability_percentage

FROM wishlist;


-- ANSWER:
-- Total products: 37
-- Unavailable products: 10
-- Unavailability rate: 27.03%
--
-- BUSINESS INTERPRETATION:
-- 10 out of 37 products (27.03%) in my personal
-- wishlist were unavailable.
-- This is an exploratory finding from one customer's
-- wishlist, not Flipkart's overall stockout rate.


-- ============================================================
-- BUSINESS QUESTION 2:
-- Which product categories have the highest
-- unavailability rate?
-- ============================================================

SELECT
    Category,

    COUNT(*) AS total_products,

    SUM(
        CASE
            WHEN Status IN ('Currently unavailable', 'Not Available')
            THEN 1
            ELSE 0
        END
    ) AS unavailable_products,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN Status IN ('Currently unavailable', 'Not Available')
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS unavailability_rate

FROM wishlist

GROUP BY Category

ORDER BY
    unavailability_rate DESC,
    total_products DESC;


-- ANSWER:
-- Blazers: 100% (1 out of 1)
-- Books: 100% (1 out of 1)
-- Dresses: 50% (2 out of 4)
-- Ethnic Wear: 50% (1 out of 2)
-- Jeans: 33.33% (2 out of 6)
-- Jewellery: 33.33% (1 out of 3)
-- Footwear: 20% (1 out of 5)
-- Western Wear: 10% (1 out of 10)
-- Electronics, Sunglasses and Trousers: 0%
--
-- BUSINESS INTERPRETATION:
-- Dresses had two unavailable products out of four.
-- Blazers and Books each had a 100% unavailability
-- rate, but each category contained only one product.
-- Small category sample sizes can make percentages
-- misleading.


-- ============================================================
-- BUSINESS QUESTION 3:
-- How do displayed prices differ between available
-- and unavailable products?
-- ============================================================

SELECT
    CASE
        WHEN Status IN ('Currently unavailable', 'Not Available')
        THEN 'Unavailable'
        ELSE 'Available'
    END AS availability_group,

    COUNT(*) AS total_products,

    COUNT(Price) AS products_with_price,

    ROUND(AVG(Price), 2) AS average_price,

    MIN(Price) AS minimum_price,

    MAX(Price) AS maximum_price

FROM wishlist

GROUP BY availability_group;


-- ANSWER:
-- Available:
-- Total products: 27
-- Products with recorded prices: 26
-- Average price: ₹439.46
-- Minimum price: ₹66
-- Maximum price: ₹1,099
--
-- Unavailable:
-- Total products: 10
-- Products with recorded prices: 5
-- Average price: ₹572.60
-- Minimum price: ₹184
-- Maximum price: ₹1,398
--
-- BUSINESS INTERPRETATION:
-- Unavailable products had a higher average recorded
-- displayed price than available products.
-- Missing prices are excluded from price calculations.
-- This comparison does not establish that price causes
-- product unavailability.


-- ============================================================
-- BUSINESS QUESTION 4:
-- Which unavailable products have the highest
-- displayed prices?
-- ============================================================

SELECT
    Product_id,
    "Product Name",
    Category,
    Price,
    "Original Price"

FROM wishlist

WHERE Status IN ('Currently unavailable', 'Not Available')

ORDER BY
    Price IS NULL ASC,
    Price DESC;


-- ANSWER:
-- Practical Statistics for Data Scientists: ₹1,398
-- AAYU Women Fit and Flare Blue Maxi Dress: ₹598
-- Women Two Piece Dress Brown Maxi: ₹419
-- KOTTY Casual Printed Women Multicolor Top: ₹264
-- Casual Women Blazer: ₹184
--
-- Five other unavailable products have missing prices
-- and cannot be ranked by displayed price.
--
-- BUSINESS INTERPRETATION:
-- This query identifies unavailable wishlist products
-- with comparatively higher displayed prices.
-- Displayed price alone does not establish customer
-- demand, lost revenue, or business priority.


-- ============================================================
-- END OF ANALYSIS
-- ============================================================
