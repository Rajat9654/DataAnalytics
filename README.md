# Data Analysis on Top 1000 Movies on IMDb
## by Rajat Gupta

## Problem Statement:
The objective of this data analysis project is to explore and gain insights from the top 1000 movies on IMDb. The dataset includes information about the movies' ratings, genres, directors, actors, release years, and gross earnings. The primary goal is to uncover trends, patterns, and interesting correlations among these variables, providing valuable information for movie enthusiasts, filmmakers, and stakeholders in the film industry.

## Data Source
IMDB website: https://www.imdb.com/search/title/?groups=top_1000&sort=user_rating,desc&count=100&start

## Dataset Description:
The dataset contains the following key attributes for each movie:
* Movie Name: The title of the movie.
* Director: The director(s) responsible for the movie.
* Year of Release: The year when the movie was released.
* Movie Rating: The viewer rating of the movie on IMDb.
* Meatscore of movie: Scores assigned to movie's reviews of large group of the world's most respected critics, and weighted average are applied to summarize their opinions range.
* Votes: Number of votes for movie rating
* Gross: The worldwide box office gross earnings of the movie.
* Movie Star: Lead actors or actresses in the movie.
* Description: A summrised storyline of the movie.
* Genre: The genre(s) of the movie, which can be one or more.

## Objectives:
* Investigate the relationship between IMDb ratings and gross earnings to determine if higher ratings lead to higher earnings.
* Analyze the distribution of IMDb ratings to identify the most popular movies.
* Explore the distribution of genres and identify the most common genres among the top 1000 movies.
* Identify the top directors and movie stars based on the number of movies they have contributed to.
* Analyze trends in movie releases over the years and identify the most productive years for the film industry.
* Visualize the data to present key findings and insights effectively.

## Limitations:
* Data Availability: The dataset is limited to the top 1000 movies on IMDb and may not represent the entire film industry's diversity.
* Currency: The dataset might not include the most recent movies, as IMDb ratings and earnings constantly change over time.
* Missing Data: There might be missing information for certain movies, which could affect the analysis results.
* Missing Gross Earnings: There were 192 entries having NULL gross earning, which could affect actual analysis.
* IMDb Rating Bias: The IMDb ratings are based on user reviews, which might not always accurately reflect the movie's quality or popularity.
* Genre Classification: Some movies might belong to multiple genres, and the classification might be subjective or challenging.
* Gross Earnings Currency: The gross earnings are not adjusted for inflation, which could impact the comparison of movie earnings over different time periods.
* Data Preprocessing: The data may require cleaning and preprocessing to handle duplicates, outliers, or inconsistencies.
Approach:

## Process Flow:
### Part 1: Web Scraping Using Python
* Identify the target website: The IMDb website containing the top 1000 movies.
* Use Python libraries: Utilize Python libraries like BeautifulSoup and requests for web scraping.
* Send HTTP request: Send an HTTP request to the IMDb website and retrieve the HTML content.
* Parse HTML: Parse the HTML content to extract relevant information about the top 1000 movies.
* Store data: Store the scraped data in a structured format, such as a CSV file or a database.

Link of code: https://github.com/Rajat9654/DataAnalytics/tree/main/Part%201%20-%20Python

### Part 2: Data Cleansing, Exploration, and Normalization in SQL
* Data Import: Import the web scraped data into a SQL database or create tables in the database.
* Data Cleaning: Identify and handle missing values, duplicate records, and any data inconsistencies.
* Data Exploration: Use SQL queries to explore the dataset and understand the distribution of key variables.
* Data Normalization: Normalize the data to reduce redundancy and improve data integrity.
* Create Derived Tables: Create additional tables or views to represent relationships and calculations. Director Name, Genre and Movie star names have been split into differnet tables.
* Perform Aggregations: Aggregate data to calculate summary statistics and identify patterns. Year bands and Watch Time bands are created 

Link of code: https://github.com/Rajat9654/DataAnalytics/tree/main/Part%202%20-%20SQL

### Part 3: Dashboard and Analysis in Power BI
* Data Connection: Connect Power BI to the SQL database to access the cleaned and normalized data.
* Data Modeling: Define relationships between tables and create calculated columns or measures as needed.

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/83405b5f-3ef1-4708-9384-501ef2d7285e)
  
* Data Visualization: Design interactive and meaningful visualizations using Power BI's drag-and-drop interface.
* Data Cleaning: 192 missing values of Gross were made 0. Create measures for further analysis
* Create Dashboards: Organize visualizations into a coherent dashboard layout to present key findings effectively.
* Data Analysis: Use Power BI's functionalities to perform data analysis, such as sorting, filtering, and drill-down.
* Insights and Storytelling: Formulate insights and build a narrative around the analysis results.
* Report Sharing: Publish the interactive dashboard to Power BI Service for easy sharing with stakeholders.
* Interactivity: Set up slicers, filters, and cross-highlighting to enable users to explore the data dynamically.

Link of dashboard, Images: https://github.com/Rajat9654/DataAnalytics/tree/main/Part%203%20-%20PowerBI

## Conclusion:

### Ratings vs Earnings
* It is evident from plot that average earnings increase with ratings exception being highest rated single movie 'Shawshank Redeption (1994)' and second highest rated single movie 'The Godfather (1972)'. These could be due to several reason one being inflation not adjusted over years other being some extrenal factors like strike, economic downfall, advertisment not done during movie release date etc.

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/8e1a54da-9ebf-4335-91b0-0f494e95aa40)

* However, the top 10 highest grossing individual movies are not the highest rated movies exception 'The Dark Knight (9.0)' . This shows even low rated movies could have good earnings. 

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/e208ad31-1209-48a9-8436-c7e26c7dc0d0)

### Watch Time
* The highest earning movies watch time ~75% ranges between 1.5hr to 2.5 hrs (90min - 150mins) 

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/0557f447-95c1-40db-a5d9-7d39f6b10acb)

* The Watch time band trend of 120 -150 mins and 90 - 120 mins have recently rose since last decade 2010 in terms of Gross. While other bands have declined.

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/430e10eb-922f-4cb2-9b53-7a8b25ae36f5)

### Genre
* Drama genre is top in terms of gross earnings and number of movies. Comedy, Action, Adventure, Sci-fi others being in both earning and number of movies in top 5 list.

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/774cba40-3236-454c-b508-d5c54669dc59)
![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/22d1cc0a-c815-4eb5-95e8-39496377cdbf)

* Action, Adventure genre has really picked good in earnings after 1990's. There is decline for Drame after same period and Sci-fi not producing any commercial hit movie after 2010.

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/e8ebb235-243b-4330-b9bc-e157ffe1003d)

### Movie Starts
* 'Chris Evans','Robert Downey Jr.','Tom Hanks','Mark Ruffalo','Leonardo Di Capro' are top 5 movie stars are part of both highest rated and gross earning movies.

![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/5721e391-263e-458a-ab07-a61cd861ba17)
![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/3b9a4cf2-19c7-455e-9c57-1071c2ee2282)

### Director
* 'Steven Spielsberg','Martin Scoreses', 'Alfred Hitchcock', 'Hayo Miyazaki', 'Akira Kurosawa' are top 5 directors part of both highest rated and gross earning movies. However, Steven Spielsberg movies gross earning is more than 3 times of next 4 directors combined.

  ![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/98d04e1d-513d-43e0-b762-e13951211f78)
![image](https://github.com/Rajat9654/DataAnalytics/assets/14285722/9a41dee4-3d2e-4a9a-bf66-b8870282ba27)

## Summary
By performing a comprehensive analysis of the top 1000 movies on IMDb, this project aims to provide valuable insights into the film industry's trends and characteristics. It will uncover patterns that could help filmmakers, producers, and movie enthusiasts make informed decisions and gain a better understanding of what makes a successful movie in terms of ratings and earnings. However, it is crucial to keep in mind the limitations of the dataset and the potential biases in IMDb ratings while interpreting the results.
