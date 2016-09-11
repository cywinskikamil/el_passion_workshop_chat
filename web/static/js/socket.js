import {Socket} from "phoenix"

let socket = new Socket("/socket", {})

socket.connect()

let roomId = $('#room-id').text()
let channel = socket.channel(`room:${roomId}`, {})
channel.join()

let chatInput = $('#chat-input')
let messagesContainer = $('#chat-box')
let user = $('#current-user').text()

chatInput.on("keypress", e => {
  if(e.keyCode == 13) {
    channel.push("new_msg", {body: chatInput.val(), user_email: user, room_id: roomId})
    chatInput.val("")
  }
})

channel.on("new_msg", payload => {
  messagesContainer.append(`<br>[${user}]: ${payload.body}`)
})

export default socket
