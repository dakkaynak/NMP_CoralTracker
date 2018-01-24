function updateSamplesTable2(coralNum,area,XCenter,YCenter,sampleID)

global conn
updateQuery = ['UPDATE Samples Set CoralID = ',num2str(coralNum),',Area = ',num2str(area),...
    ',XCenter = ',num2str(XCenter),',YCenter = ',num2str(YCenter),'  WHERE ID = ',num2str(sampleID)];
exec(conn,updateQuery);