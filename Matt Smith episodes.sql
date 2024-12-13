-- Create a stored procedure to list Dr Who episodes featuring Matt Smith
CREATE PROC spMattSmithEpisodes
AS

SELECT

	ep.SeriesNumber AS Series,
	ep.EpisodeNumber AS Episode,
	ep.Title,
	ep.EpisodeDate AS 'Date of episode',
	d.DoctorName AS Doctor

FROM
	tblEpisode AS ep
	INNER JOIN tblDoctor AS d ON ep.DoctorId = d.DoctorId

WHERE
	d.DoctorName = 'Matt Smith'

ORDER BY
	ep.EpisodeDate


USE [DoctorWho]
GO

ALTER PROC [dbo].[spRussell]
AS

-- show episodes written by Mr. Moffat
SELECT
	e.Title
	--a.AuthorName,
	--e.EpisodeDate
FROM	
	tblAuthor AS a
	INNER JOIN tblEpisode AS e ON a.AuthorId = e.AuthorId
WHERE
	a.AuthorName like 'Russell%'
ORDER BY
	e.EpisodeDate DESC




alter PROC spSummariseEpisodes
AS

-- show number of episodes for each companion
SELECT TOP 3
	c.CompanionName,
	COUNT(*) AS Episodes
FROM
	tblCompanion AS c
	INNER JOIN tblEpisodeCompanion AS ec on c.CompanionId = ec.CompanionId
GROUP BY
	c.CompanionName
ORDER BY
	Episodes DESC
	
-- show number of episodes for each enemy
SELECT TOP 3
	e.EnemyName,
	COUNT(*) AS Episodes
FROM
	tblEnemy AS e
	INNER JOIN tblEpisodeEnemy AS ee on e.EnemyId = ee.EnemyId
GROUP BY
	e.EnemyName
ORDER BY
	Episodes DESC