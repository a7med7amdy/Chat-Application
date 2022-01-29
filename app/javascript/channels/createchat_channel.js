// import consumer from "channels/consumer"

// consumer.subscriptions.create("CreatechatChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });


import consumer from "channels/consumer"

document.addEventListener('turbo:load', ()=>{
  const app_element = document.getElementById('app-id');
  consumer.subscriptions.subscriptions.forEach((subscription)=>{
    consumer.subscriptions.remove(subscription);
  })
  if(app_element){
    const app_id = app_element.getAttribute('data-app-id')
    console.log(app_id)
    consumer.subscriptions.create({channel: "CreatechatChannel", app_id: app_id},{
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("connected....")
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)
      const messageContainer = document.getElementById('chats')
      messageContainer.innerHTML = messageContainer.innerHTML + data.html
    }
  });
  }
})
