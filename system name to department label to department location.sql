SELECT MACHINE.NAME AS SYSTEM_NAME, MACHINE.BIOS_SERIAL_NUMBER,LABEL.NAME AS DEPARTMENT_LABEL,
MACHINEASSET.ID AS MACHINE_ID,
DEPASSET.ID AS DEPARTMENT_ASSET_ID,
DEPTOLOC.ASSOCIATED_ASSET_ID AS LOCATION_ASSET_ID,
LOCATIONASSET.NAME AS DEPARTMENT_LOCATION_NAME
FROM MACHINE  
LEFT JOIN MACHINE_LABEL_JT ON (MACHINE_LABEL_JT.MACHINE_ID = MACHINE.ID)  
LEFT JOIN LABEL ON (LABEL.ID = MACHINE_LABEL_JT.LABEL_ID  AND LABEL.TYPE <> 'hidden') 
LEFT JOIN LABEL_LABEL_JT ON (LABEL.ID = LABEL_LABEL_JT.CHILD_LABEL_ID AND LABEL_LABEL_JT.LABEL_ID = 258)
LEFT JOIN ASSET AS MACHINEASSET ON MACHINEASSET.MAPPED_ID = MACHINE.ID AND MACHINEASSET.ASSET_TYPE_ID=5 
LEFT JOIN ASSET_DATA_5 ON ASSET_DATA_5.ID = MACHINEASSET.ASSET_DATA_ID 
LEFT JOIN USER ON USER.ID = MACHINEASSET.OWNER_ID 
LEFT JOIN ASSET AS DEPASSET ON DEPASSET.NAME = LABEL.NAME
LEFT JOIN ASSET_ASSOCIATION AS DEPTOLOC ON DEPTOLOC.ASSET_ID = DEPASSET.ID
LEFT JOIN ASSET AS LOCATIONASSET ON LOCATIONASSET.ID  = DEPTOLOC.ASSOCIATED_ASSET_ID
WHERE LABEL_LABEL_JT.LABEL_ID = 258 
AND LABEL.NAME = "User Services"
GROUP BY MACHINE.ID
ORDER BY SYSTEM_NAME