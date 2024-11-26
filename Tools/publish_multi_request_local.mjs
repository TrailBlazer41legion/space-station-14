import { exec, spawn } from 'node:child_process';
import * as path from 'node:path';
import { request } from 'node:https';
import { Buffer } from 'node:buffer';

const RobustCDNURLStr = 'https://ss14.smokeofanarchy.ru/cdn';
const ForkID = 'SMoA';

const ReleaseDir = 'release';

const PublishToken = process.env.PUBLISH_TOKEN;

const RobustCDNURL = new URL(RobustCDNURLStr);

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
};

const getVersion = () => {
    return new Promise( (res,rej) => {
        exec('git rev-parse HEAD', (err, stdout, stderr) => {
            if (err) {
                console.error(err);
                rej(err);
            };
            res(stdout);
        });
    });
};

const getFilesToPublish = () => {
    return new Promise( (res,rej) => {
        exec(`cd ${ReleaseDir} && ls`, (err, stdout, stderr) => {
            if (err) {
                console.error(err);
                rej(err);
            };
            res(stdout);
        });
    });
};

const repoSHA = await getVersion();
const engineVersion = await getEngineVersion();
const FilesToUpload = (await getFilesToPublish()).split('\n').filter( (file) => {return file});

const headers = {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${PublishToken}`,
}

const optionsStart = {
    hostname: RobustCDNURL.host.split(':')[0],
    port: RobustCDNURL.port,
    path: `${RobustCDNURL.pathname}/fork/${ForkID}/publish/start`,
    method: 'POST',
    headers,
};

const optionsFile = {
    hostname: RobustCDNURL.host.split(':')[0],
    port: RobustCDNURL.port,
    path: `${RobustCDNURL.pathname}/fork/${ForkID}/publish/file`,
    method: 'POST',
    headers,
};

const optionsFinish = {
    hostname: RobustCDNURL.host.split(':')[0],
    port: RobustCDNURL.port,
    path: `${RobustCDNURL.pathname}/fork/${ForkID}/publish/finish`,
    method: 'POST',
    headers,
};

const data = {
    "version": repoSHA.trim(),
    "engineVersion": engineVersion.trim()
}

const req = request(optionsStart, (res) => {
    console.log('statusCode:', res.statusCode);
    console.log('headers:', res.headers);
    res.on('data', (d) => {
        //d = JSON.parse(d.toString())
        console.log(d.toString());
    });
});
req.write(JSON.stringify(data));
req.on('error', (e) => {
    console.error(e);
});
req.end();

