function validYears = NMP_getValidYears(chosenSite)

global imageList

diveSites = unique({imageList.name});
chosenSite = diveSites(chosenSite);
chosenSiteInd = find(ismember({imageList.name},chosenSite));
validYears = {imageList(chosenSiteInd).year};

