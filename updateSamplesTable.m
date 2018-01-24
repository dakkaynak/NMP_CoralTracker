function updateSamplesTable(coralNum,area,XCenter,YCenter,isPartial,sampleID)

global conn
updateQuery = ['UPDATE Samples Set CoralID = ',num2str(coralNum),',Area = ',num2str(area),...
    ',XCenter = ',num2str(XCenter),',YCenter = ',num2str(YCenter),...
    ',isPartial = ',num2str(isPartial),'  WHERE ID = ',num2str(sampleID)];
exec(conn,updateQuery);