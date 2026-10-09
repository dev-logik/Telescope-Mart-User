const {onDocumentCreated} = require("firebase-functions/v2/firestore");
const {initializeApp} = require("firebase-admin/app");
const {setGlobalOptions} = require("firebase-functions/v2");
const {getMessaging} = require("firebase-admin/messaging");
const {logger} = require("firebase-functions");

initializeApp();
const msg = getMessaging();
setGlobalOptions({maxInstances: 10});

exports.sendOrderNotification = onDocumentCreated("Orders/{}", (event) => {
  const id = event.params.id;
  const payload = {
    notification: {
      title: "New Order",
      body: "You have a new Order!",
    },
    data: {
      key: "neworder",
      value: id,
    },
    topic: "Order",
  };
  msg.send(payload).then((response) => {
    logger.log("Order message sent");
  }).catch((error) => {
    logger.log("Error occurred");
  });
});
