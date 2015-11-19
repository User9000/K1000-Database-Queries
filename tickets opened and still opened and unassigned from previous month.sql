SELECT 
COUNT(HD_TICKET.ID) as "Tickets Opened", 
SUM(CASE WHEN TIME_CLOSED = '0000-00-00 00:00:00' THEN 1 ELSE 0 END) as "Still Open",
SUM(CASE WHEN HD_CATEGORY.NAME = 'Unknown' THEN 1 ELSE 0 END) as "Unassigned Category",
SUM(CASE WHEN HD_TICKET.OWNER_ID = 0 THEN 1 ELSE 0 END) as "Unassigned Worker"

FROM HD_TICKET  
JOIN HD_CATEGORY ON (HD_CATEGORY.ID = HD_TICKET.HD_CATEGORY_ID) 
LEFT JOIN USER O ON (O.ID = HD_TICKET.OWNER_ID) 
WHERE (HD_TICKET.HD_QUEUE_ID = 2) 
AND MONTH(HD_TICKET.CREATED) = MONTH(DATE_SUB(NOW(),INTERVAL 1 MONTH))
AND YEAR(HD_TICKET.CREATED) = YEAR(DATE_SUB(NOW(),INTERVAL 1 MONTH))
