# Amazon Solid State Drives Analysis

<p align="center">
  <img src="https://png.pngtree.com/png-vector/20221027/ourmid/pngtree-ssd-storage-computer-pc-black-png-image_6387334.png" alt="ssd" width="400">
</p>

1. [Overview](#overview)
2. [Methodology](#methodology)
3. [Exploratory Data Analysis](#exploratory-data-analysis)
4. [Results and Conclusion](#results-and-conclusion)
5. [Recommendations](#recommendations)
6. [Dashboards](#dashboards)

## Overview<a name="overview"></a>
This analysis dives into Amazon's diverse array of Solid State Drives (SSDs), aiming to offer insights that benefit prospective buyers in their decision-making process. By examining crucial factors like interface, capacity, performance metrics, and customer feedback across various SSD models, our objective is to provide actionable insights. This analysis seeks to empower buyers with clear and digestible information, enabling them to make informed choices amidst the vast SSD market on Amazon. Through data-driven observations, our aim is to streamline the purchasing journey, equipping buyers with the knowledge necessary to select SSDs that align with their needs and preferences, thereby maximizing their satisfaction and utility from Amazon's SSD offerings.

## Methodology<a name="methodology"></a>

### Data Source
The data used for this analysis is from a popular public [google spreadsheet](https://docs.google.com/spreadsheets/d/1B27_j9NDPU3cNlj2HKcrfpJKHkOf-Oi1DbuuQva2gT4/edit#gid=0) which serves as a "tier list of SSD's" for PC enthusiasts. It is modified and customized by removing some things and adding new features to further align the analysis with the main purchasing platform in mind which is Amazon.

### Data Dictionary
1. **Brand**: The brand or manufacturer of the SSD.
2. **Model**: The model name or designation of the SSD.
3. **Interface**: The interface technology used by the SSD.
4. **Form Factor**: The physical size and shape of the SS.
5. **Capacities**: The range of storage capacities available for the SSD.
6. **Lowest Storage Capacity**: The lowest storage capacity available for the SSD model.
7. **Highest Storage Capacity**: The highest storage capacity available for the SSD model.
8. **Controller**: The controller chip used in the SSD, responsible for managing data.
9. **Configuration**: The configuration details of the controller.
10. **DRAM**: Indicates if the SSD uses DRAM (Dynamic Random-Access Memory).
11. **HMB**: Indicates if the SSD uses Host Memory Buffer technology.
12. **NAND Brand**: The brand of NAND flash memory used in the SSD.
13. **NAND Type**: The type of NAND flash memory us.
14. **Layers**: The number of storage layers in the NAND flash memory.
15. **Read (MB/s)**: Read speed of the SSD in Megabytes per second (MB/s).
16. **Write (MB/s)**: Write speed of the SSD in Megabytes per second (MB/s).
17. **Categories**: Categorization of SSD based on performance or usage.
18. **Lowest Price**: The lowest price at which the SSD is available.
19. **Highest Price**: The highest price at which the SSD is available.
20. **Number of Ratings**: The count of ratings or reviews given by users for the SSD.
21. **Rating**: The average rating score of the SSD based on user reviews.
22. **Disk Rating**: A calculated rating or performance metric assigned to the SSD (*higher = better*).
23. **Amazon's Choice**: Indicates if the SSD is labeled as "Amazon's Choice".
24. **Product Link**: The URL link to the SSD's product page on Amazon.

*Side note:* Disk Rating is based on test data or hard drive benchmarks gathered from [PassMark](https://www.harddrivebenchmark.net/hdd_list.php). Everything else is from the google spreadsheet or is data based on Amazon.

### Data Cleaning and Preprocessing
After obtaining the data, the process of data cleaning is performed in which values are filled with data from Amazon. A problem was encountered when it comes to products availability since some products are not listed or is simply not available it was decided to leave those fields blank or labeled as "Unavailable" for convinience.


## Exploratory Data Analysis<a name="exploratory-data-analysis"></a>
The final dataset consisted of 412 unique SSD's and 24 columns based on the data dictionary. A MySQL database was developed to store these data.

### Key Insights from EDA

#### 1. **Distribution of brands**
Team or Teamgroup has the most number of SSD's listed with 38 counts followed by ADATA with 34 counts and Mushkin with 19 counts.

#### 2. **Distribution of Interfaces**
For the interface, x4 PCIe 3.0/NVMe is the generational interface with the highest distribution of all the entries with 34% share. This is followed by x4 PCIe 4.0/NVMe with a value of 33.3%. Althought the SATA/HCI can be considered the oldest it still holds out well with the bunch with a value of 24.8%. While the remaining x2 PCIe 2.0/NVMe, x2 PCIe 3.0/NVMe, x4 PCIe 5.0/NVMe contribute to the rest of the share with 0.2%, 3.4% and 4.4% respectively.

#### 3. **Distribution by Form Factor**
The most popular form factor for SSD's is the M.2 with a value of 76.2% followed up by 2.5 inch with 18.4%. The surgence of NVMe has shifted the form factor into something more smaller but powerful size being able to compress the computing power and adopting to a more modern one compared to the 2.5 inch drive size that the SATA/AHCI uses.

#### 4. **Distribution by Form Factor**
1TB- 2TB has the most number of capacities recorded with a valuation of 45 counts. This is followed by 1TB-4TB with 35 counts, 512GB-2TB with 32 counts and 256GB-1TB with 31 counts respectively.

#### 5. **Controller and Configuration Distributions**
Phison E12S and Phison E18 ties as the most used controllers for SSD's. This is also followed by fellow Phison controllers Phison E16 with 31 counts and Phison E13T with 20 counts. It can be considered that Phison is the most widely used controller for the SSD's in the current market.

Dual R5 + CoX, 8-ch, 4-CE/ch is the most popular configuration being used with a value of 66 counts. Single-core, 4-ch, 8-CE/ch and Triple R5 + CoX, 8-ch, 4-CE/ch follows this up with 45 and 36 counts respectively.

#### 6. **Distribution According to DRAM**
The resulting distribution presents that 59.2% of SSD's has DRAM meanwhile 40.8% does not have DRAM.

#### 7. **Distribution According to HMB**
For the HBM distribution, 41% of HMB is not available or possibly unkwown and as for the SSD's with HMB it consitutes to 27.2% of the share in the entire distribution on the other hand 31.8% does not have HMB.

#### 8. **Distribution According to NAND Brand**
Micron constitutes half of the NAND Brand with a value of 213. This is followed by Kioxia which consitute to a quarter of the NAND Brand with a value of 112.

#### 9. **Distribution According to NAND Type**
The most popular NAND Type being used for SSD's nowadays is TLC with a value of 88.1%. This is followed by QLC which has a value of 9.7% respectively.

#### 10. **Distribution According to Layers**
64 Layers is the most widely used Layer configuration with a count of 138 and is followed by 96 Layers and 176 Layers with values of 115 and 63.

#### 11. **Read and Write Speeds**
High-End NVMe's were observed having the highest read and write speeds and is followed by its Mid-Range to Entry-Level NVMe. As for SATA they posses lower read and write speeds since they are considered to be more of a old generation and NVMe are new generation.

#### 12. **Price Range Based on Model**
It can be observed in the price range there are values with 0.0. They are initially blank or they are considered to not be listed in Amazon that time hence the valuation of 0.0. More expensive SSD's tend to have characteristics of having high capacity and high read/write speeds.

#### 13. **Average Price for Each Category**
For the breakdown of Average price per category it can be seen that High-End NVMe's have the highest average price and is followed by High-End SATA and Mid-Range NVMe.

#### 14. **Number of Ratings Analysis**
The nummber of ratings are not affected by any of the mentioned factors such as read/write speeds, price, rating and disk rating. There is no cohesive correlation between these factors that can affect a SSD's popularity prompting people to make reviews/ratings on it.

#### 15. **Distribution According to Amazon's Choice**
Only a small portion of the SSD's listed are considered to be Amazon's Choice in the SSD category contributing only to 11.9% of them to be recognized as such. Meanwhile 61.9% and 26.2% are not considered to be Amazon's Choice in the SSD or is unavailable or there is no available listing.

#### 16. **Price to Performance Analysis**
To obtain the price to performance of a SSD the Disk Rating must be divided to the price accordingly.

Average Price to Performance: For the Average Price to Performance Gigabyte's Gen4 Aorus 500E emerged as the best value for the money with a value of 1064.41.

Lowest Price to Performance: Teamgroup's MP44 1504.37 is shown to be the best value for money for the lowest price with a value of 1504.37.

Highest Price to Performance: MSI's M450 appears to be the best value for money for highest price to performance with a value of 563.05.

#### 17. **Average Number of Ratings for Amazon's Choice SSD vs. Non-Amazon's Choice SSD**
SSD's considered as Amazon's choice products on average receive more ratings than those SSD's who are not labeled as such.

#### 18. **Amazon's Choice SSD Average Rating vs. Non-Amazon's Choice SSD Average Rating**
If the SSD is considered to be a Amazon's Choice it has a high average rating value of 4.68 and has a slight edge compared to the SSD's that are not considered to be Amazon's Choice with a average rating of 4.33.

## Results and Conclusion<a name="results-and-conclusion"></a>
Distribution of Brands: Team or Teamgroup emerges as the brand with the most listed SSDs (38 counts), followed by ADATA (34 counts) and Mushkin (19 counts).

Interfaces and Form Factors: x4 PCIe 3.0/NVMe and x4 PCIe 4.0/NVMe dominate with 34% and 33.3% shares respectively. M.2 form factor leads with 76.2% compared to the 18.4% share held by 2.5-inch SSDs.

Capacities and Configurations: SSDs within the 1TB-2TB range are most prevalent (45 counts), with Phison E12S and Phison E18 being the frequently used controllers. Dual R5 + CoX, 8-ch, 4-CE/ch configuration holds a majority share (66 counts).

DRAM and HMB Distribution: 59.2% of SSDs have DRAM, while 27.2% incorporate HMB technology.

NAND Brand and Type: Micron dominates NAND brand usage (213 counts), with TLC NAND type leading at 88.1%.

Layers and Speeds: SSDs with 64 layers are most common (138 counts), with High-End NVMe exhibiting superior read/write speeds.

Price and Ratings Analysis: Higher-priced SSDs tend to possess higher capacities and speeds. The number of ratings lacks a definitive correlation with other factors like speed, price, and rating.

Amazon's Choice and Price-to-Performance: Only 11.9% are Amazon's Choice products, with Gigabyte's Gen4 Aorus 500E exhibiting the best average price-to-performance ratio.

Conclusion:

The analysis revealed valuable insights into the diverse landscape of SSDs on Amazon. Brand distribution, technological shifts towards NVMe, and the preference for certain capacities and configurations underscore consumer trends. Micron and TLC NAND emerge as dominant choices, while High-End NVMe SSDs exhibit superior performance.

Factors like read/write speeds, pricing, and ratings lack a strong correlation, indicating consumer preferences are multifaceted. The presence of Amazon's Choice insignia correlates with higher ratings and popularity, emphasizing its influence on consumer trust.

In conclusion, this analysis serves as a guide for consumers navigating the SSD market, shedding light on trends, preferences, and performance benchmarks. It provides valuable insights to aid informed decision-making, allowing consumers to align their needs with the diverse SSD offerings available on Amazon.

## Recommendations<a name="recommendations"></a>
1. Prioritize Performance and Compatibility:
- Opt for SSDs with x4 PCIe 3.0/NVMe or x4 PCIe 4.0/NVMe interfaces in M.2 form factors for high performance and compatibility with modern systems.

2. Choose Capacity Based on Needs:
- Consider SSDs within the 1TB-2TB range, offering ample storage, and explore configurations suited to personal usage requirements.

3. Balance Speed and Affordability:
- Balance read/write speeds according to usage needs; High-End NVMe for high-speed tasks and Entry-Level SATA for budget-friendly options.


4. Check for 'Amazon's Choice' Products:
- Explore SSDs labeled as 'Amazon's Choice' for trusted products with higher ratings and possibly better customer satisfaction.

5. Assess Price-to-Performance Ratio:
- Explore SSDs offering good price-to-performance ratios like Gigabyte's Gen4 Aorus 500E or Teamgroup's MP44 for value-oriented purchases.

6. Consider Customer Reviews and Ratings:
- Read through customer reviews to gauge real-world experiences and consider SSDs with positive feedback for reliability.

7. Understand Technology and Features:
- Familiarize with NAND types like TLC for better endurance and performance, and evaluate layers for efficient data storage.

## Dashboards<a name="dashboards"></a>
<p align="center">
  <img src="Resources\Main.png" alt="main" width="650">
</p>

<p align="center">
  <img src="Resources\P1.png" alt="P1" width="650">
</p>

<p align="center">
  <img src="Resources\P2.png" alt="P2" width="650">
</p>