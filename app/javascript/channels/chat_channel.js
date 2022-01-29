import consumer from "channels/consumer"

document.addEventListener('turbo:load', ()=>{
  const room_element = document.getElementById('chat-id');
  consumer.subscriptions.subscriptions.forEach((subscription)=>{
    consumer.subscriptions.remove(subscription);
  })
  if(room_element){
    const chat_id = room_element.getAttribute('data-chat-id')
    console.log(chat_id)
    consumer.subscriptions.create({channel: "ChatChannel", chat_id: chat_id},{
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
      const messageContainer = document.getElementById('messages')
      messageContainer.innerHTML = messageContainer.innerHTML + data.html
    }
  });
  }
})
