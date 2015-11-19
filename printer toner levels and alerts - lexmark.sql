SELECT NODE_SNMP_SYSTEM.ID, NODE.IP,
SUBSTRING(FULL_WALK, LOCATE("SNMPv2-MIB::sysName.0", FULL_WALK)+24, LOCATE("<br>", FULL_WALK, LOCATE("SNMPv2-MIB::sysName.0", FULL_WALK)) - LOCATE("SNMPv2-MIB::sysName.0", FULL_WALK)-24) as "HIG Number",

CASE
    WHEN FULL_WALK REGEXP "SNMPv2-SMI::mib-2.43.16.5.1.2.1.1" THEN 
        SUBSTRING(FULL_WALK, LOCATE("SNMPv2-SMI::mib-2.43.16.5.1.2.1.1", FULL_WALK)+37, LOCATE("<br>", FULL_WALK, LOCATE("SNMPv2-SMI::mib-2.43.16.5.1.2.1.1", FULL_WALK)) - LOCATE("SNMPv2-SMI::mib-2.43.16.5.1.2.1.1", FULL_WALK)-38)
END as "State"

 


FROM ORG1.NODE_SNMP_SYSTEM

JOIN NODE on NODE_SNMP_SYSTEM.ID = NODE.ID
WHERE SUBSTRING(FULL_WALK, LOCATE("SNMPv2-MIB::sysDescr.0", FULL_WALK)+25, 20) like "Lexmark%"
GROUP BY NODE_SNMP_SYSTEM.ID