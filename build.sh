#!/bin/bash
export EDITOR="/bin/micro";
function updateCorvaxRepo() {
	echo "Updating Corvax translations...";
	cd Corvax-SS14/;
	git pull origin master;
	cd ..;
};

function updateMr0MaksRepo() {
	echo "Updating Mr0maks translations...";
	cd Mr0maks-SS14/;
	git pull origin master;
	cd ..;
};

function updateRobustToolbox() {
	echo "Updating RobustToolbox...";
	cd RobustToolbox;
	git pull origin master;
	cd ..;
};

function updateSS14() {
	updateRobustToolbox
	git commit -m "Автообновление RobustToolbox";

	echo "Updating Server...";
	git pull origin main;
	git pull fetch master;
	git commit -m "Автообновление SS14";
	#updateCorvaxRepo;
	#cp Corvax-SS14/Resources/Locale/ru-RU Resources/Locale -r;
	#cp Corvax-SS14/Resources/ServerInfo/Guidebook Resources/ServerInfo -r;
	#git add .;
	#git commit -m "Автообновление перевода от Corvax";
	git push origin main;
};

function buildServer() {
	dotnet build Content.Packaging --configuration Release;
	dotnet run --project Content.Packaging server --hybrid-acz --platform linux-x64;
	
};

eval $1
