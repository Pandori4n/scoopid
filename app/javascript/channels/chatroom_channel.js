import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    const divContainer = document.querySelector(".message-container")
    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        divContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initChatroomCable };
