SELECT MAC, COUNT(ID) as SYSTEMS, group_concat(NAME) as NAMES
FROM ORG1.MACHINE
GROUP BY MAC
HAVING SYSTEMS = 2
ORDER BY SYSTEMS DESC
