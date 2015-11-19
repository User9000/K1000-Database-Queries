SELECT M.NAME, M.IP, M.OS_NAME, M.LAST_SYNC,
ASSET_DATA_1.FIELD_40 AS LIAISON,
LABEL.NAME as LOCATION,
concat('https://kace.dickinson.edu/adminui/machine.php?ID=', M.ID) as LINK
FROM ORG1.MACHINE M
LEFT JOIN MACHINE_LABEL_JT ON (MACHINE_LABEL_JT.MACHINE_ID = M.ID)  
LEFT JOIN LABEL ON (LABEL.ID = MACHINE_LABEL_JT.LABEL_ID  AND LABEL.TYPE <> 'hidden') 
LEFT JOIN LABEL_LABEL_JT ON (LABEL.ID = LABEL_LABEL_JT.CHILD_LABEL_ID AND LABEL_LABEL_JT.LABEL_ID = 439)
JOIN ASSET on LABEL.NAME = ASSET.NAME
JOIN ASSET_DATA_1 ON ASSET_DATA_1.ID = ASSET.ASSET_DATA_ID

WHERE LAST_SYNC < DATE_SUB(NOW(), INTERVAL 30 DAY)
AND LABEL_LABEL_JT.LABEL_ID = 439

ORDER BY LIAISON, LOCATION, LAST_SYNC