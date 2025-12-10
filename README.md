# Atliq-promo-performance-analysis
# Project Background
AtliQ Mart is one of South India’s leading retail supermarket chains, operating over 50 stores across major cities and emerging urban locations.

During Diwali 2023 and Sankranti 2024, the company ran large-scale promotions across all 50 stores on its in-house branded products to capitalize on festive demand. With multiple promo types running across varied categories and locations, the Sales Director now needs clear insights into which promotions delivered meaningful lift—and which fell short—to guide future campaign decisions.This project thoroughly analyzes the promotion data—helping the sales leadership evaluate what worked, what didn’t, and how to optimize future campaigns.

The analysis provides deep insights and recommendations across the following key areas:

- **Store-Level Analysis:** Identifying top and low-performing stores and cities during festive campaigns.
- **Promotion Performance:** Measuring uplift in revenue and units sold across different promotion types.
- **Product & Category Insights:** Understanding which categories and products responded best to promotions.

An interactive PowerBI dashboard can be downloaded [here.](https://github.com/shruti-analytics/atliq-promo-performance-analysis/blob/main/AtliQ.pbix)

The SQL queries used for the analysis can be found [here.](https://github.com/shruti-analytics/atliq-promo-performance-analysis/blob/main/AtliQ.sql)


# Executive Summary

### Overview of Findings

The company's festive promotions generated substantial incremental revenue, but the impact varied sharply by promo type, product category, and city performance. BOGOF and Cashback emerged as the most powerful drivers of both sales uplift and unit movement,while certain discounts delivered minimal or even negative ROI.Category-level patterns highlighted that Grocery & Staples and Festive Combo Packs benefitted the most from promotional triggers, reflecting customers’ tendency to stock up on essentials and celebration-related items during festive periods. Geographically, metro cities such as Bengaluru and Chennai led overall growth, indicating higher responsiveness to promotions and stronger festive spending power in urban clusters.

### Store Level Analysis:


<img width="1035" height="291" alt="Screenshot 2025-12-09 211529" src="https://github.com/user-attachments/assets/53a7d4d4-090e-497f-bfe7-63da748a8ebe" />

* Bengaluru emerges as the strongest market in terms of store presence, with ten outlets driving high overall revenue. However, it also shows the steepest decline from baseline to promotional revenue, indicating that customer demand is highly dependent on discounts and that the market is strongly price-sensitive.In contrast,Chennai and Hyderabad demonstrate robust organic performance, with high baseline revenue (26M and 23M respectively) and healthy but not excessive promo uplift.
  
* Trivandrum, Vijayawada, and Mangalore show consistently weak performance, characterized by low baseline demand and minimal response to promotions. These patterns point toward deeper structural challenges such as an ineffective product mix, low store footfall, or misaligned promotional offerings.

* Coimbatore and Mysuru stand out as a highly efficient yet under-recognized market; despite having fewer stores, they deliver strong revenue growth and high promo responsiveness.

### Promotion Performance:



<img width="1029" height="500" alt="Screenshot 2025-12-09 214855" src="https://github.com/user-attachments/assets/f71e0d94-61e5-4515-8d52-feff281b42ee" />

* **The ₹500 Cashback offer generates the largest incremental revenue (₹122.6M) despite contributing only 40.8K incremental units.** This mismatch demonstrates that cashback disproportionately attracts premium-category shoppers, who add far more revenue per unit than any discount-based promotion. Cashback also shows stronger performance during Diwali (₹101.9M), implying that festivals motivate shoppers to invest more deeply in big-ticket items when rewarded with assured value.

* **With 157K incremental units — BOGOF clearly activates volume-seeking customers**, likely in everyday essentials or fast-moving SKUs. Yet the revenue uplift (₹69.3M) is almost half that of cashback, proving that BOGOF creates footfall and unit movement but does not maximize profitability. Its exceptional performance during Sankranti (132K units) suggests seasonal relevance: customers stock up on household staples around this festival.

* 33% OFF adds a moderate 27K units and ₹15.6M revenue, proving it works for mid-value categories where customers are discount-sensitive but not exclusively “deal chasers.”However, 50% OFF barely moves the needle—only 7K units and ₹0.71M revenue—indicating that deep discounting does not always lead to meaningful demand. This may reflect poor product assortment, low customer interest, or perception of these items as “clearance quality,” even at half price.

* **25% OFF performs negatively, showing active cannibalization instead of incremental gains.** The –₹1.17M revenue and –5.7K units reveal that this mild discount fails to motivate customers.The negative effect is stronger during Diwali (–₹1M), proving customers expect much stronger value during festivals and completely ignore underwhelming offers.

* Festival-specific behavior shows Diwali favors high-ticket incentives, while Sankranti drives bulk purchasing.

1. Diwali: Cashback dominates (₹101.9M), while deep discounts underperform → customers prefer assured monetary rewards on high-value items.
2. Sankranti: BOGOF dominates (132K units), indicating customers buy larger quantities of lower-value staples.
This clear behavioral split means promo planning must be festival-dependent, not uniform across seasons.

### Product & Category Insights:


<img width="1021" height="500" alt="Screenshot 2025-12-10 085843" src="https://github.com/user-attachments/assets/762879ae-ab8c-4f60-a9c6-11fb542224e1" />

* Combo1 shows the strongest promotional uplift, jumping from ₹67M to ₹190M in revenue and from ~22K to ~63K units sold, resulting in an exceptionally high IR% of ~183%. This category demonstrates that bundled SKUs respond extremely well to discount-based strategies, significantly increasing both basket value and volume

* **Grocery & Staples remains the anchor category with the highest post-promo volume**, increasing from ~120K to ~246K units and delivering a sizable revenue lift from ₹53M to ₹96M. Despite a moderate IR% (~80%), it records the highest ISU% (~94%), showing that customers aggressively stock up on staples during promotions, making this category the primary driver of footfall and bulk purchases.

* Home Appliances, despite having lower absolute numbers, shows one of the highest promotional efficiencies, rising from ₹9M to ₹35M in revenue with units increasing from ~15K to ~54K, resulting in a significant IR% (~265%).
  
* **Personal Care is largely inelastic to promotions.** Personal Care records only a small revenue and unit increase (low ISU%), indicating that discounts in this category produce limited behavioral change and offer poor incremental ROI.


### Recommendations:

* Focus promotional budgets on high-performing cities like Bengaluru, Mysuru, and Chennai, where promotions drive strong incremental revenue.

* Prioritize inventory, staffing, and premium promo execution for top-performing stores to maximize revenue upside, while conducting SKU audits and localized assortment adjustments in underperforming outlets. Consider store expansion in high-efficiency markets like Coimbatore, where fewer stores are generating disproportionately strong uplift.

* Increase investment in proven performers like Combo1 and Grocery, which drive the highest incremental revenue and units sold. At the same time, scale back promotions on Personal Care and low-elasticity categories, where discounting does not meaningfully boost sales.

* Promotion 25 % off is actively destroying value — it fails to generate incremental demand and instead cannibalize baseline sales. These promos should be removed from future campaigns or completely restructured with clearer value propositions.





  
