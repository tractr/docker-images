const fetch = require('cross-fetch');

const {
    BASE_DIRECTUS_URL,
    BASE_ACCESS_TOKEN,
    TARGET_DIRECTUS_URL,
    TARGET_ACCESS_TOKEN
} = process.env;

if (!BASE_DIRECTUS_URL) {
    throw new Error('Missing BASE_DIRECTUS_URL env var');
}
if (!BASE_ACCESS_TOKEN) {
    throw new Error('Missing BASE_ACCESS_TOKEN env var');
}
if (!TARGET_DIRECTUS_URL) {
    throw new Error('Missing TARGET_DIRECTUS_URL env var');
}
if (!TARGET_ACCESS_TOKEN) {
    throw new Error('Missing TARGET_ACCESS_TOKEN env var');
}

async function main() {
    const snapshot = await getSnapshot();
    const diff = await getDiff(snapshot);
    await applyDiff(diff);
}

async function getSnapshot() {
    const URL = `${BASE_DIRECTUS_URL}/schema/snapshot?access_token=${BASE_ACCESS_TOKEN}`;
    const {data} = await fetch(URL).then((r) => r.json());
    console.log(`Got snapshot from ${BASE_DIRECTUS_URL}`);
    return data;
}

async function getDiff(snapshot) {
    const URL = `${TARGET_DIRECTUS_URL}/schema/diff?access_token=${TARGET_ACCESS_TOKEN}`;

    const {data} = await fetch(URL, {
        method: 'POST',
        body: JSON.stringify(snapshot),
        headers: {
            'Content-Type': 'application/json',
        },
    }).then((r) => r.json());

    console.log(`Got diff from ${TARGET_DIRECTUS_URL}`);

    return data;
}

async function applyDiff(diff) {
    const URL = `${TARGET_DIRECTUS_URL}/schema/apply?access_token=${TARGET_ACCESS_TOKEN}`;

    await fetch(URL, {
        method: 'POST',
        body: JSON.stringify(diff),
        headers: {
            'Content-Type': 'application/json',
        },
    });

    console.log(`Applied diff to ${TARGET_DIRECTUS_URL}`);
}

main()
    .then(() => console.log('Migration completed'))
    .catch((err) => console.error(err));