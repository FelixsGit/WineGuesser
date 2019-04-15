'use strict';

var messageForm = document.querySelector('#messageForm');
var startGame = document.querySelector('#startGame');
var readyArea = document.querySelector('#ready-area');
var notReadyArea = document.querySelector('#not-ready-area');
var lobbyCloseForm = document.querySelector('#lobbyClose');
var lobbyLeaveForm = document.querySelector('#lobbyLeave');

var stompClientConn = null;
var stompClientReg = null;
var username = null;
var client = null;
var gameId = null;
var join = null;

function connect(event) {
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

function sendStartMessage(event){
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'START'
    };
    stompClientReg.send("/app/chat.regularComs/"+gameId, {}, JSON.stringify(chatMessage));
    event.preventDefault();
}

function sendLeaveHardMessage(event){
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'LEAVE_HARD'
    };
    stompClientReg.send("/app/chat.regularComs/"+gameId, {}, JSON.stringify(chatMessage));
    event.preventDefault();
}

function closeLobbyMessage(event){
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'CLOSE'
    };
    stompClientReg.send("/app/chat.regularComs/"+gameId, {}, JSON.stringify(chatMessage));
    event.preventDefault();
}

function onMessageReceived(payload) {


    var message = JSON.parse(payload.body);

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


    if(message.type === 'START'){
        window.location.replace("http://192.168.0.100:8080/gameBoard/"+gameId);
    }
    if(message.type === 'CLOSE'){
        window.location.replace('http://192.168.0.100:8080/lobby/' + gameId + '/command/quit');
    }
    if(message.type === 'LEAVE_HARD'){
        var elementToRemove = document.getElementById(message.sender);
        if(elementToRemove != null){
            elementToRemove.parentNode.removeChild(elementToRemove);
        }
    }

    var notReadyElement = document.createElement('li');
    var readyElement = document.createElement('li');

    if(message.type === 'JOIN' || message.type === 'READY' || message.type === 'LEAVE'){

        if(message.type === 'LEAVE'){
            var elementToRemove = document.getElementById(message.sender);
            if(elementToRemove != null){
                if(elementToRemove.parentNode.id === 'ready-area'){
                    elementToRemove.parentNode.removeChild(elementToRemove);
                    notReadyElement.id = message.sender;
                    var notReadyNameText = document.createTextNode(message.sender);
                    notReadyArea.appendChild(notReadyElement);
                    notReadyElement.appendChild(notReadyNameText);
                }
            }
        }
        //somebody entered lobby
        if(message.type === 'JOIN') {
            if(document.getElementById(message.sender) == null){
                notReadyElement.id = message.sender;
                var notReadyNameText = document.createTextNode(message.sender);
                notReadyArea.appendChild(notReadyElement);
                notReadyElement.appendChild(notReadyNameText);
                {document.getElementById("startGame").style.display="hidden";}
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
        if(message.content === 'ALLREADY'){
            {document.getElementById("startGame").style.display="block";}
        }
    }
}

messageForm.addEventListener('submit', sendMessage, true);
lobbyCloseForm.addEventListener('submit', closeLobbyMessage, true);
startGame.addEventListener('submit', sendStartMessage, true);
if(lobbyLeaveForm != null){
    lobbyLeaveForm.addEventListener('submit', sendLeaveHardMessage, true);
}
