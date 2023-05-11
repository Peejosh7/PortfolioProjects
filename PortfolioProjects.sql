-- Select *
--From PortfolioProject..['covid_vaccinations']
--Order by 3,4

Select *
From PortfolioProject..['covid_deaths']
where continent iS NOT NULL
Order by 3,4


--Let's select the data that we are going to use

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..['covid_deaths'] 
where continent iS NOT NULL
Order by 1,2


-- Total cases vs Total deaths as %
-- Shows the likelihood of dying upon contracting covid in your country

Select Location, date, total_cases, total_deaths, (cast(total_deaths as numeric) / convert (numeric, total_cases))*100 AS DeathPercentage
From PortfolioProject..['covid_deaths']
where continent iS NOT NULL
 --AND location like 'Nigeria'
Order by 1,2
 

-- Total cases vs Population as %
-- Shows % of Population has contracted COVID

Select Location, date, population, total_cases, (cast(total_cases as numeric) / population)*100 AS PopulationPercentage
From PortfolioProject..['covid_deaths']
where continent iS NOT NULL
--where location like 'Nigeria'
Order by 1,2

Select Location, Population, MAX(cast (total_cases as numeric)) AS HighestInfectionCount
From PortfolioProject..['covid_deaths']
Where continent is NOT NULL
Group by Location, population
Order by HighestInfectionCount desc

-- Looking at Countries with highest Infection rate compared to Population

Select location, population, MAX(cast(total_cases as numeric)) AS HighestInfectionCount, MAX(cast(total_cases as numeric) / population)*100 AS PopulationPercentInfected
From PortfolioProject..['covid_deaths']
where continent iS NOT NULL
 -- AND location = 'Nigeria'
Group by Location, population
Order by PopulationPercentInfected desc

-- Showing Countries with Highest DeathCount vs Population

Select location, population, MAX(cast(total_deaths as numeric)) AS HighestDeathCount
From PortfolioProject..['covid_deaths']
where continent iS NOT NULL
 -- AND location = 'Nigeria'
Group by Location, population
Order by HighestDeathCount desc

-- BREAKING DOWN BY CONTINENTS

Select continent, MAX(cast(total_deaths as numeric)) AS MaxDeathCount
From PortfolioProject..['covid_deaths']
where continent is NOT NULL
 -- AND location = 'Nigeria'
Group by continent
Order by MaxDeathCount desc

Select location, MAX(cast(total_deaths as numeric)) AS MaxDeathCount
From PortfolioProject..['covid_deaths']
where continent is NULL
 -- AND location = 'Nigeria'
Group by location
Order by MaxDeathCount desc






 

