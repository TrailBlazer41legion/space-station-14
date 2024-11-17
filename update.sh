#!/bin/bash
export EDITOR="/bin/nano";

function updateRobustToolbox() {
	echo "Updating RobustToolbox...";
	cd RobustToolbox;
	git pull origin master;
	git fetch --tags origin master;
	export LATEST_VERSION_RTB=$(git describe --tags --abbrev=0);
	echo $LATEST_VERSION_RTB;
	git checkout $LATEST_VERSION_RTB;
	cd ..;
};

function updateSS14() {
	updateRobustToolbox
	git add .;
	git commit -m "Автообновление RobustToolbox";
	git pull origin main;
	git pull fetch master;
	git commit -m "Автообновление SS14";
	git push origin main;
	git push --mirror ssh://git@github.com/MaxSMokeSkaarj/space-station-14
};

updateSS14