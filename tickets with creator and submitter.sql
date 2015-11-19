SELECT T.ID, T.TITLE, T.CREATED, CREATOR.FULL_NAME as "Creator", SUBMITTER.FULL_NAME as "Submitter"
FROM ORG1.HD_TICKET T
JOIN HD_TICKET_CHANGE TC on T.ID = TC.HD_TICKET_ID and TC.ID = (select MIN(ID) FROM HD_TICKET_CHANGE WHERE HD_TICKET_ID = T.ID)
JOIN USER CREATOR ON TC.USER_ID = CREATOR.ID
JOIN USER SUBMITTER on T.SUBMITTER_ID = SUBMITTER.ID

