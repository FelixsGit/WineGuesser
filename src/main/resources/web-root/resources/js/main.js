'use strict';

//var usernamePage = document.querySelector('#username-page');
var chatPage = document.querySelector('#chat-page');
//var usernameForm = document.querySelector('#usernameForm');
var messageForm = document.querySelector('#messageForm');
//var messageInput = document.querySelector('#message');
//var messageArea = document.querySelector('#messageArea');
var readyArea = document.querySelector('#ready-area');
var notReadyArea = document.querySelector('#not-ready-area');
//var connectingElement = document.querySelector('.connecting');

var stompClientConn = null;
var stompClientReg = null;
var username = null;
var client = null;
var gameId = null;
var join = null;

function connect(event) {

    if(gameId == null){
        //username = document.querySelector('#name').value.trim();

        if(!username) {
            //usernamePage.classList.add('hidden');

            var socket = new SockJS('/wsCon');
            stompClientConn = Stomp.over(socket);

            stompClientConn.connect({}, onConnected, onError);
        }
        event.preventDefault();
    }else{
        var socket = new SockJS('/wsReg');
        stompClientReg = Stomp.over(socket);
        stompClientReg.connect({}, onConnected, onError);
    }

}


function onConnected() {
    if(gameId == null){
        // Subscribe to the Public Topic
        client = stompClientConn.subscribe('/topic/public', onMessageReceived);

        // Tell your username to the server
        stompClientConn.send("/app/chat.determineSocketId",
            {},
            JSON.stringify({sender: username, content: '', gameId: '', type: 'JOIN'})
        )
    }else{
        client = stompClientReg.subscribe('/topic/'+gameId, onMessageReceived)
        join = "joining";
        sendMessage(event);
    }
}



function subscribeToSpecific(gameId){
    client.unsubscribe();
    client = null;
    connect(event);
}


function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}


function sendMessage(event) {
    //var messageContent = messageInput.value.trim();
    if(stompClientReg) {
        if(username && join === 'joining') {
            var chatMessage = {
                sender: username,
                content: 'specific socket communication',
                gameId: gameId,
                type: 'JOIN'
            };
            join = 'joined';
        }else if(username){
            var chatMessage = {
                sender: username,
                content: 'specific socket communication',
                gameId: gameId,
                type: 'READY'
            };
        }
        stompClientReg.send("/app/chat.regularComs/"+gameId, {}, JSON.stringify(chatMessage));
        //messageInput.value = '';
    }
    event.preventDefault();
}


function onMessageReceived(payload) {

    var message = JSON.parse(payload.body);

    /*
    alert("User received Message\n" +
        ""+message.sender+"\n" +
        ""+message.content+"\n" +
        ""+message.gameId+"\n" +
        ""+message.type);
    */

    if(message.type === 'SETUP'){
        var button = document.createElement("button");
        var buttonText= document.createTextNode('Redo');
        button.id = message.content+'button';
        button.style.display=
        button.type = 'submit';
        button.class = 'primary';
        button.appendChild(buttonText);
        var span = document.getElementById('messageForm');
        span.appendChild(button);
        username = message.content;
        gameId = message.gameId;
        subscribeToSpecific(gameId);
    }

    var notReadyElement = document.createElement('li');
    var readyElement = document.createElement('li');

    if(message.type === 'JOIN' || message.type === 'READY' || message.type === 'LEAVE'){

        if(message.type === 'LEAVE'){
            var elementToRemove = document.getElementById(message.sender);
            elementToRemove.parentNode.removeChild(elementToRemove);
        }

        //somebody entered lobby
        if(message.type === 'JOIN') {

            if(document.getElementById(message.sender) == null){
                notReadyElement.id = message.sender;
                var notReadyNameText = document.createTextNode(message.sender);
                notReadyArea.appendChild(notReadyElement);
                notReadyElement.appendChild(notReadyNameText);
            }

        //somebody pressed the ready button
        } else if (message.type === 'READY') {

            var elementToRemove = document.getElementById(message.sender+'button');
            if(elementToRemove != null){
                elementToRemove.parentNode.removeChild(elementToRemove);
            }
            var elementToRemove = document.getElementById(message.sender);
            elementToRemove.parentNode.removeChild(elementToRemove);

            var readyNameText = document.createTextNode(message.sender);
            readyElement.id = message.sender;
            readyArea.appendChild(readyElement);
            readyElement.appendChild(readyNameText);



        }
        //messageElement.classList.add('chat-message');

        //var avatarElement = document.createElement('i');
        //var avatarText = document.createTextNode(message.sender[0]);
        //avatarElement.appendChild(avatarText);
        //avatarElement.style['background-color'] = getAvatarColor(message.sender);
        //messageElement.appendChild(avatarElement);

    }
}

/*
function getAvatarColor(messageSender) {
    var hash = 0;
    for (var i = 0; i < messageSender.length; i++) {
        hash = 31 * hash + messageSender.charCodeAt(i);
    }
    var index = Math.abs(hash % colors.length);
    return colors[index];
}
 */

//usernameForm.addEventListener('submit', connect, true)
messageForm.addEventListener('submit', sendMessage, true)