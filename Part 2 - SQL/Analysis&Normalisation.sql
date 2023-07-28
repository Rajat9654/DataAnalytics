

select count(1) from Movies

select top(5) * from Movies

sp_rename 'Movies.column1', 'MovieID', 'COLUMN';

update Movies set MovieID = MovieID + 1 

ALTER TABLE Movies
ADD CONSTRAINT PK_MovieID PRIMARY KEY (MovieID);

update Movies set MovieStars  = replace(replace(MovieStars, '[', ''), ']', '') 

---Rounding Movie rating to 1 digit after decimal
update Movies set [Movie_Rating]  = ROUND([Movie_Rating],1)

--Multiple Director, removing key word Directors form list to have ease in converting to 1NF
select distinct Director from Movies
update Movies set Director  = replace(Director, 'Directors:', '') 

select top(5) * from Movies

--------------Genre: Droping (if exsist) , creating Genre table, Normalization to another table, dropping column from original table
drop table Genre

CREATE TABLE Genres (
    MovieID INT ,
    GenreName VARCHAR(50),
);

INSERT INTO Genre 
    SELECT DISTINCT MovieID, 
           LTRIM(RTRIM(SUBSTRING(genre, Number, 
                                 CHARINDEX(',', genre + ',', Number) - Number))) AS Value
    FROM Movies
    JOIN master..spt_values ON 
        Number <= LEN(genre) + 1 AND 
        SUBSTRING(',' + genre, Number, 1) = ','
	
select top (10) * from Genre

ALTER TABLE Movies
DROP COLUMN Genre



--------------Director: Droping (if exsist) , creating Genre table, Normalization to another table, dropping column from original table
drop table Director

CREATE TABLE Director (
    MovieID INT ,
    Director_name VARCHAR(50),
);


INSERT INTO Director
    SELECT DISTINCT MovieID, 
           LTRIM(RTRIM(SUBSTRING(Director, Number, 
                                 CHARINDEX(',', Director + ',', Number) - Number))) AS Value
    FROM Movies
    JOIN master..spt_values ON 
        Number <= LEN(Director) + 1 AND 
        SUBSTRING(',' + Director, Number, 1) = ','
	
select top (10) * from Director

ALTER TABLE Movies
DROP COLUMN Director


--------------MovieStars: Droping (if exsist) , creating Genre table, Normalization to another table, dropping column from original table
drop table MovieStars

CREATE TABLE MovieStars (
    MovieID INT ,
    MovieStars_name VARCHAR(50),
);


INSERT INTO MovieStars
    SELECT DISTINCT MovieID, 
           LTRIM(RTRIM(SUBSTRING(MovieStars, Number, 
                                 CHARINDEX(',', MovieStars + ',', Number) - Number))) AS Value
    FROM Movies
    JOIN master..spt_values ON 
        Number <= LEN(MovieStars) + 1 AND 
        SUBSTRING(',' + MovieStars, Number, 1) = ','

update MovieStars set MovieStars_name = replace(MovieStars_name,'''','')

	
select top (10) * from MovieStars


ALTER TABLE Movies
DROP COLUMN MovieStars

select top(5) * from Movies

---We observed Year of realase column have some extra values apart from year
---we will update to include only year
select distinct Year_of_Release 
from Movies where len(Year_of_Release ) <> 4
order by 1 desc

update Movies set Year_of_Release = RIGHT(Year_of_Release,4)
where len(Year_of_Release ) <> 4


-----Creating a new table to include bands which will help in our analysis later
select * , 
	case when Year_of_Release < 1970 then 'Before 1970' 
		 when Year_of_Release >= 1970 and Year_of_Release < 1980 then '1970 - 1980' 
		 when Year_of_Release >= 1980 and Year_of_Release < 1990 then '1980 - 1990'
		 when Year_of_Release >= 1990 and Year_of_Release < 2000 then '1990 - 2000'
		 when Year_of_Release >= 2000 and Year_of_Release < 2010 then '2000 - 2010'
		 when Year_of_Release >= 2010 and Year_of_Release < 2020 then '2010 - 2020'
		 when Year_of_Release >= 2020 then 'After 2020'
		 else 'Not available'
	end as 'Year_band',
		case when Watch_time < 60 then 'Less than 60 mins' 
		 when Watch_time >= 60 and Watch_time < 90 then '60 - 90 mins'
		 when Watch_time >= 90 and Watch_time < 120 then '90 - 120 mins'
		 when Watch_time >= 120 and Watch_time < 150 then '120 - 150 mins'
		 when Watch_time >= 150 and Watch_time < 180 then '150 - 180 mins'
		 when Watch_time >= 180 then 'Greater than 180 mins'
		 else 'Not available'
	end as 'Watch_Time_band'
into Movies_Final
from Movies
