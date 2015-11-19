SELECT DISTINCT(MACHINE.NAME), MACHINE.OS_NAME, MACHINE.CS_MODEL, MACHINE.CS_MANUFACTURER,
CASE 
    WHEN MACHINE.CS_MANUFACTURER like 'Apple%' THEN MACHINE_CUSTOM_INVENTORY.DATE_FIELD_VALUE
    WHEN MACHINE.CS_MANUFACTURER like 'Dell%' THEN DA.SHIP_DATE
END AS PURCHASE_DATE
FROM MACHINE
LEFT JOIN DELL_ASSET DA on MACHINE.BIOS_SERIAL_NUMBER = DA.SERVICE_TAG
LEFT JOIN MACHINE_CUSTOM_INVENTORY on MACHINE.ID = MACHINE_CUSTOM_INVENTORY.ID and SOFTWARE_ID = 25152
WHERE (MACHINE.CS_MANUFACTURER like 'Apple%' or MACHINE.CS_MANUFACTURER like 'Dell%')
AND MACHINE.NAME not like '%BC'
ORDER BY PURCHASE_DATE, MACHINE.NAME