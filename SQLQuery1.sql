SELECT * 
FROM portfolioproject2..CovidDeaths$
ORDER BY 3,4

-- Looking at Total Cases vs Total Deaths
-- Calculating Death Percentage
SELECT location, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage_from_infection
FROM portfolioproject2..CovidDeaths$
ORDER BY 1,2

-- Looking at Total Cases vs Population
-- Calculating Percentage of Population got Infected
SELECT location, population, MAX(total_cases) as peak_infection_count, MAX((total_cases/population))*100 as percentage_of_population_infected
FROM portfolioproject2..CovidDeaths$
GROUP BY location, population
ORDER BY percentage_of_population_infected DESC

-- Looking at Countries with Highest Death Count per Population
SELECT location, MAX(CAST(total_deaths as INT)) as total_death_count
FROM portfolioproject2..CovidDeaths$
WHERE continent is not null
GROUP BY location
ORDER BY total_death_count DESC

-- Looking at Continents with Highest Death Count per Population
SELECT continent, MAX(CAST(total_deaths as INT)) as total_death_count
FROM portfolioproject2..CovidDeaths$
WHERE continent is not null
GROUP BY continent
ORDER BY total_death_count DESC

-- Looking at the Infection Rate of the World's Superpowers
SELECT location, population, MAX(total_cases) as peak_infection_count, MAX((total_cases/population))*100 as percentage_of_population_infected
FROM portfolioproject2..CovidDeaths$
WHERE location = 'China' OR 
location = 'France' OR 
location = 'Germany' OR
location = 'Israel' OR 
location = 'Japan' OR
location = 'Russia' OR 
location = 'South Korea' OR 
location = 'United Arab Emirates' OR 
location = 'United Kingdom' OR 
location = 'United States'
GROUP BY location, population
ORDER BY percentage_of_population_infected DESC


