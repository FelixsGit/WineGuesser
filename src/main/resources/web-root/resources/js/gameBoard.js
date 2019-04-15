'use strict';

var doneArea = null;
var messageForm = null;
var lockResult = null;
var stompClientConn = null;
var stompClientReg = null;
var username = null;
var client = null;
var gameId = null;
var join = null;

function connect(event) {
    messageForm = document.getElementById('messageForm');
    if(messageForm != null){
        messageForm.addEventListener('submit', sendMessage, false);
    }
    lockResult = document.getElementById('lockResult');
    if(lockResult != null){
        lockResult.addEventListener('submit', sendDoneMessage, false);
    }
    doneArea = document.getElementById('done-area')
    if(doneArea != null){
        doneArea.addEventListener('submit', sendMessage, false);
    }

    if(gameId == null){
        if(!username) {
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
        client = stompClientConn.subscribe('/topic/public', onMessageReceived);
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
    }
    event.preventDefault();
}

function sendDoneMessage(event) {
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'DONE'
    };
    stompClientReg.send("/app/chat.regularComs/"+gameId, {}, JSON.stringify(chatMessage));
}

function onMessageReceived(payload) {

    var doneElement = document.createElement('li');
    var message = JSON.parse(payload.body);

    if(message.type === 'SETUP'){
        username = message.content;
        gameId = message.gameId;
        subscribeToSpecific(gameId);
    }

    if(message.type === 'DONE'){
        var elementToRemove = document.getElementById(message.sender);
        if(elementToRemove != null){
            elementToRemove.parentNode.removeChild(elementToRemove);
            var doneNameText = document.createTextNode(message.sender);
            doneElement.id = message.sender;
            doneArea.appendChild(doneElement);
            doneElement.appendChild(doneNameText);
        }
    }
}
