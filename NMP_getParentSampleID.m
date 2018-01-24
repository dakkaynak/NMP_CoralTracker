function parentSampleID = NMP_getParentSampleID(parentCoralNum,sampleDirPointID)

global conn
parentSampleID = fetch(conn,['SELECT ID FROM Samples WHERE CoralID = ',num2str(parentCoralNum),' AND SamplePointDirID = ',num2str(sampleDirPointID)]);