SELECT USER, NAME, IP, LAST_SYNC, OS_NAME FROM ORG1.MACHINE
WHERE LAST_SYNC < DATE_SUB(NOW(), INTERVAL 7 DAY);