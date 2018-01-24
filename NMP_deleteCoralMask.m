function NMP_deleteCoralMask(sampleID,imageName,coralNum)

global maskFolder conn
% Delete the coral mask
delete(fullfile(maskFolder,[imageName(1:end-4),'_coralNum_',num2str(coralNum),'_data.mat']))

% And delete the sample from the DB

updateQuery = ['DELETE FROM Samples WHERE ID = ',num2str(sampleID)];
exec(conn,updateQuery);


