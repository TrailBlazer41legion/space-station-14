#!/bin/bash
export EDITOR="/bin/micro";

function updateCorvaxRepo() {
	echo "Updating Corvax translations...";
	cd Corvax-SS14/;
	git pull origin master;
	git submodule update --init --recursive;
	cd ..;
};

function updateMr0MaksRepo() {
	echo "Updating Mr0maks translations...";
	cd Mr0maks-SS14/;
	git pull origin master;
	git submodule update --init --recursive;
	cd ..;
};

function updateRobustToolbox() {
	echo "Updating RobustToolbox...";
	cd RobustToolbox;
	git pull origin master;
	export LATEST_VERSION_RTB=$(git describe --tags --abbrev=0);
	echo $LATEST_VERSION_RTB;
	git checkout $LATEST_VERSION_RTB;
	cd ..;
};

function updateSS14() {
	updateRobustToolbox
	git add .;
	git commit -m "Автообновление RobustToolbox";
	echo "Updating Server...";
	git pull origin main;
	git pull fetch master;
	git commit -m "Автообновление SS14";
	updateCorvaxRepo;
	cp Corvax-SS14/Resources/Locale/ru-RU Resources/Locale -r;
	cp Corvax-SS14/Resources/ServerInfo/Guidebook Resources/ServerInfo -r;
	git add .;
	git commit -m "Автообновление перевода от Corvax";
	git push origin main;
	git push --mirror ssh://git@github.com/MaxSMokeSkaarj/space-station-14
};

function buildServer() {
	git fetch --depth 1
	dotnet restore
	dotnet build Content.Packaging --configuration Release --no-restore /m;
	dotnet run --project Content.Packaging server --platform win-x64 --platform linux-x64 --platform osx-x64 --platform linux-arm64;
	dotnet run --project Content.Packaging content --no-wipe-release
	
};

eval $1
