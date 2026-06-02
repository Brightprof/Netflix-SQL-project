# Netflix-SQL-project
A SQL-based data analysis project on Netflix content that explores movies and TV shows to uncover insights about genres, ratings, countries, actors, directors, and content trends using advanced SQL techniques such as CTEs, window functions, and string manipulation.
# 🎬 Netflix SQL Data Analysis Project

## 📌 Overview
This project is an end-to-end **SQL data analysis case study** on a Netflix dataset.  
It explores Netflix’s catalog of movies and TV shows to extract meaningful business insights such as content distribution, trends, ratings, genres, countries, actors, and directors.

The project demonstrates **real-world SQL skills** including data cleaning, ETL structure, exploratory analysis, aggregation, window functions, and string manipulation.

---

## 🎯 Objectives
- Build a structured SQL database using staging and production tables
- Perform data cleaning and transformation
- Analyze Netflix content using SQL queries
- Answer real-world business questions
- Generate actionable insights from data

---

## 🛠 Tools & Technologies
- SQL Server (T-SQL)
- Microsoft Excel (Dataset source)

---

## 📂 Project Structure
Netflix-SQL-Project/
│
├── dataset/
│ └── netflix_titles.csv
│
├── sql_queries/
│ ├── 01_data_cleaning.sql
│ ├── 02_table_creation.sql
│ ├── 03_business_analysis.sql
│
├── screenshots/
│ └── analysis_outputs.png
│
└── README.md


---

## 🧹 Data Cleaning Approach
The dataset was cleaned using SQL techniques such as:

- Handling missing values (replacing NULLs with 'Unknown')
- Removing extra spaces using `LTRIM()` and `RTRIM()`
- Splitting multi-value columns using `STRING_SPLIT()`
- Standardizing text values using `LOWER()` and trimming functions
- Validating categorical fields (type, rating, country)

A **staging table approach** was used to ensure raw data integrity before transformation.

---

## 🏗 Database Design (ETL Workflow)

1. **Staging Table**
   - Raw dataset is loaded into `Netflix_staging`
   - No transformation applied at this stage

2. **Production Table**
   - Cleaned data is moved to `Netflix_table`
   - Used for all analytical queries

This follows a simple **ETL (Extract, Transform, Load) pipeline structure**.

---

## 📊 Business Questions Answered

The following analytical questions were solved using SQL:

1. Count of Movies vs TV Shows  
2. Most common rating per content type  
3. Movies released in a specific year (2020)  
4. Top 5 countries with most Netflix content  
5. Longest movie on Netflix  
6. Content added in the last 5 years  
7. Content by specific directors  
8. TV shows with more than 5 seasons  
9. Content distribution across genres  
10. Yearly content trend in the United States  
11. List of Documentary content  
12. Content without director information  
13. Number of movies featuring Toyin Abraham (last 10 years)  
14. Top 10 actors in Nigeria movies  
15. Content classification based on keywords (Good vs Bad content)

---

## 💡 Key Insights

- Movies make up the majority of Netflix content compared to TV shows  
- The United States leads in total content production  
- Drama and Documentary are the most dominant genres  
- Netflix content has grown significantly in recent years  
- A small group of actors dominate movie appearances in India  
- Most Netflix content falls under the “Good” category based on description analysis  

---

## 🧠 Skills Demonstrated

This project demonstrates strong SQL capabilities:

- Data Cleaning & Transformation
- ETL Pipeline Design (Staging → Production)
- Aggregations & Grouping
- Window Functions (`RANK()`)
- CTE (Common Table Expressions)
- String manipulation (`STRING_SPLIT`, `LTRIM`, `RTRIM`)
- Conditional logic (`CASE WHEN`)
- Date functions (`DATEDIFF`, `GETDATE()`)

---

## 📈 Project Highlights

- Real-world dataset analysis (Netflix catalog)
- End-to-end SQL pipeline design
- Business-driven analytical approach
- Clean modular query structure
- Portfolio-ready documentation

---

## 🚀 How to Run This Project

1. Clone this repository:
   ```bash
   git clone https://github.com/Brightprof/netflix-sql-project.git

2. Open SQL Server Management Studio (SSMS)
3. Run scripts in this order:
- 01_data_cleaning.sql
- 02_table_creation.sql
- 03_business_analysis.sql
4. View query outputs and insights

## 👤 Author
TOPE ARONINUOLA
Data Analyst | SQL | Power BI | Excel
