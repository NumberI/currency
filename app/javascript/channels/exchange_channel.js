import consumer from "./consumer"

consumer.subscriptions.create("ExchangeChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected! Yahoo!!!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Recieving:");
    console.log(data);
    let td = document.getElementById('val').firstChild;
    td.nodeValue = data.content.val;
    console.log(td);
  }
});
