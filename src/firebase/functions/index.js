// The Cloud Functions for Firebase SDK to create Cloud Functions and setup triggers.
const functions = require('firebase-functions');

// The Firebase Admin SDK to access the Firebase Realtime Database.
const admin = require('firebase-admin');
admin.initializeApp();

const db = admin.firestore();
const auth = admin.auth();
const fcm = admin.messaging();


exports.notificationToArea = functions.firestore.document('area/{areaID}').onCreate(async snapshot => {
    const area = snapshot.data();
    const payload = {
        notification: {
            title: `New violation in ${area.name}`,
            body: 'A new violation has been reported',
            clickAction: 'FLUTTER_NOTIFICATION_CLICK',
        }
    };

    return fcm.sendToTopic(`${area.name}`, payload);
});

// Take the text parameter passed to this HTTP endpoint and insert it into the
// Realtime Database under the path /messages/:pushId/original
exports.storeUserProfile = functions.https.onRequest(async (req, res) => {
    // Grab the text parameter.
    const { name, surname, email, password } = req.body;
    const isAuthority = email.includes('@pec.');

    const objUser = {
        displayName: `${name.toLowerCase()} ${surname.toLowerCase()}`,
        authority: isAuthority,
        email: email,
    };

    const userCreated = await auth.createUser({
        disabled: false,
        password: password,
        ...objUser
    });

    const userId = userCreated.uid;

    await db.collection('user').doc(userId).create(objUser);
    res.status(200).send(userId);
});

exports.getMyReport = functions.https.onRequest(async (req, res) => {
    const { uid } = req.body;
    let requestData = [];

    const query = await db.collection("report")
        .where("userID", "==", uid).get();

    for (let i = 0; i < query.size; ++i) {
        const data = query.docs[i].data();
        requestData.push({
            imageUrl: 'https://firebasestorage.googleapis.com/v0/b/safestreets-sweg19cams.appspot.com/o/violations%2F' + data.image.name + '?alt=media',
            violationType: data.violationType,
            latitude: data.location.position.latitude,
            longitude: data.location.position.longitude,
            licensePlate: data.licensePlate.code,
        });
    }


    res.status(200).send(JSON.stringify(requestData));
});

exports.getAreaViolation = functions.https.onRequest(async (req, res) => {
    const { areaID } = req.body;
    let requestData = [];

    const query = await db.collection("report").get();

    for (let i = 0; i < query.size; ++i) {
        const data = query.docs[i].data();
        if (areaID == 1 && data.location.position.latitude < 100) {
            requestData.push({
                imageUrl: 'https://firebasestorage.googleapis.com/v0/b/safestreets-sweg19cams.appspot.com/o/violations%2F' + data.image.name + '?alt=media',
                violationType: data.violationType,
                latitude: data.location.position.latitude,
                longitude: data.location.position.longitude,
                licensePlate: data.licensePlate.code,
            });
        } else if (areaID == 2 && data.location.position.latitude >= 100 && data.location.position.latitude < 150) {
            requestData.push({
                imageUrl: 'https://firebasestorage.googleapis.com/v0/b/safestreets-sweg19cams.appspot.com/o/violations%2F' + data.image.name + '?alt=media',
                violationType: data.violationType,
                latitude: data.location.position.latitude,
                longitude: data.location.position.longitude,
                licensePlate: data.licensePlate.code,
            });
        } else if (areaID == 3 && data.location.position.latitude >= 150) {
            requestData.push({
                imageUrl: 'https://firebasestorage.googleapis.com/v0/b/safestreets-sweg19cams.appspot.com/o/violations%2F' + data.image.name + '?alt=media',
                violationType: data.violationType,
                latitude: data.location.position.latitude,
                longitude: data.location.position.longitude,
                licensePlate: data.licensePlate.code,
            });
        }
    }


    res.status(200).send(JSON.stringify(requestData));
});

exports.getAreaSafety = functions.https.onRequest(async (req, res) => {
    const { areaID } = req.body;
    let total = 0;
    let safety = 4;

    const query = await db.collection("report").get();

    for (let i = 0; i < query.size; ++i) {
        const data = query.docs[i].data();
        if (data.location.position.latitude < 100 && areaID == 1) {
            ++total;
        } else if (data.location.position.latitude >= 100 && data.location.position.latitude < 150 && areaID == 2) {
            ++total;
        } else if (data.location.position.latitude >= 150 && areaID == 3) {
            ++total;
        }
    }

    if (total > 6) {
        safety = 0;
    } else if (total > 5) {
        safety = 1;
    } else if (total > 4) {
        safety = 2;
    } else if (total > 2) {
        safety = 3;
    }

    res.status(200).send(JSON.stringify({
        safety: safety,
        areaID: areaID,
        numberOfViolations: total
    }));
});

exports.getLicensePlate = functions.https.onRequest(async (req, res) => {
    const { code } = req.body;
    let requestData = [];

    const query = await db.collection("report").get();

    for (let i = 0; i < query.size; ++i) {
        const data = query.docs[i].data();
        if (data.licensePlate.code == code) {
            requestData.push({
                imageUrl: 'https://firebasestorage.googleapis.com/v0/b/safestreets-sweg19cams.appspot.com/o/violations%2F' + data.image.name + '?alt=media',
                violationType: data.violationType,
                latitude: data.location.position.latitude,
                longitude: data.location.position.longitude,
                licensePlate: data.licensePlate.code,
            });
        }
    }


    res.status(200).send(JSON.stringify(requestData));
});