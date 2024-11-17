import { exec, spawn } from 'node:child_process';
import http from 'node:http';
import { Buffer } from 'node:buffer';

const ROBUST_CDN_URL = "https://ss14.smokeofanarchy.ru/cdn/";
const FORK_ID = "SMoA";

const RELEASE_DIR = "release";

const PUBLISH_TOKEN = process.env.PUBLISH_TOKEN

const getEngineVersion = () => {
    return new Promise( (res,rej) => {
        exec('cd RobustToolbox && git describe --tags --abbrev=0', (err, stdout, stderr) => {
            if (err) {
                console.error(err);
                rej(err);
            }
            res(stdout);
        });
    });
}

const getVersion = () => {
    return new Promise( (res,rej) => {
        exec('git rev-parse HEAD', (err, stdout, stderr) => {
            if (err) {
                console.error(err);
                rej(err);
            }
            res(stdout);
        });
    });
};

const getFilesToPublish = () => {
    return new Promise( (res,rej) => {
        exec(`cd ${RELEASE_DIR} && ls`, (err, stdout, stderr) => {
            if (err) {
                console.error(err);
                rej(err);
            }
            res(stdout);
        });
    });
};

const VERSION = await getVersion();
const ENGINE_VERSION = await getEngineVersion();

console.log(await getFilesToPublish());


