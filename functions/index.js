const functions = require('firebase-functions');
const admin = require("firebase-admin");
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
admin.initializeApp();
exports.myFunction = functions.firestore.document("chats/{message}").onCreate((change, context) => { 
    console.log(change.data());
    return admin.messaging().sendToTopic("chats", {
        notification: {
            title: change.data().userName,
            body: change.data().text,
            clickAction: "FLUTTER_NOTIFICATION_CLICK",
        }
    });

});