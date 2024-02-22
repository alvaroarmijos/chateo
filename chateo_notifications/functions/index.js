const admin = require("firebase-admin")
const functions = require('firebase-functions')

admin.initializeApp()

exports.pushNotifications = functions.database.ref('/chats/{chatId}/messages/{id}').onCreate((snap, context) => {
    console.log('Push notification event triggered')

    const valueObject = snap.val()

    const sentTo = valueObject.sentTo
    const sentBy = valueObject.sentBy

    const name = admin.database().ref(`/status/${sentBy}/name`).once('value')
    const token = admin.database().ref(`/status/${sentTo}/token`).once('value')

    Promise.all([name, token]).then(async (values) => {

        const token = values[1].val()

        if (token == null) return { error: "No token" }

        // Notification
        const payload = {
            token: token,
            notification: {
                title: values[0].val(),
                body: valueObject.message,
            }
        }

        try {
            const response = await admin.messaging().send(payload)

            console.log('Succesfully sent message', response)
            return { success: true }
        } catch (error) {
            console.log('error', error)
            return { error: error.code }
        }


    })
})
