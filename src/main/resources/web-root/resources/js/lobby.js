'use strict';


var messageForm = null;
var startGame = null;
var readyArea = null;
var notReadyArea = null;
var lobbyCloseForm = null;
var lobbyLeaveForm = null;
var stompClientConn = null;
var stompClientReg = null;
var username = null;
var client = null;
var gameId = null;
var join = null;

function connect(event) {

    readyArea = document.getElementById('ready-area');
    notReadyArea = document.getElementById('not-ready-area');

    messageForm = document.getElementById('messageForm');
    if(messageForm != null){
        messageForm.addEventListener('submit', sendMessage, false);
    }


    lobbyCloseForm = document.getElementById('lobbyCloseForm');
    if(lobbyCloseForm != null){
        lobbyCloseForm.addEventListener('submit', closeLobbyMessage, false);
    }


    startGame = document.getElementById('startGame');
    if(startGame != null){
        startGame.addEventListener('submit', sendStartMessage, false);
    }

    lobbyLeaveForm = document.getElementById('lobbyLeaveForm');
    if(lobbyLeaveForm != null){
        lobbyLeaveForm.addEventListener('submit', sendLeaveHardMessage, false);
    }

    if(gameId == null){
        if(!username) {
            var socket = new SockJS('/wsLobbyCon');
            stompClientConn = Stomp.over(socket);
            stompClientConn.connect({}, onConnected, onError);
        }
    }else{
        var socket = new SockJS('/wsLobbyReg');
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
        client = stompClientReg.subscribe('/topic/'+gameId+'/lobby', onMessageReceived)
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
            stompClientReg.send("/app/chat.regularLobbyComs/"+gameId, {}, JSON.stringify(chatMessage));
        }else if(username){
            var chatMessage = {
                sender: username,
                content: 'specific socket communication',
                gameId: gameId,
                type: 'READY'
            };
            stompClientReg.send("/app/chat.regularLobbyComs/"+gameId, {}, JSON.stringify(chatMessage));
        }

    }
}

function sendStartMessage(event){
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'START'
    };
    stompClientReg.send("/app/chat.regularLobbyComs/"+gameId, {}, JSON.stringify(chatMessage));
}

function sendLeaveHardMessage(event){
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'LEAVE_HARD'
    };
    stompClientReg.send("/app/chat.regularLobbyComs/"+gameId, {}, JSON.stringify(chatMessage));
}

function closeLobbyMessage(event){
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'CLOSE'
    };
    stompClientReg.send("/app/chat.regularLobbyComs/"+gameId, {}, JSON.stringify(chatMessage));
}

function onMessageReceived(payload) {


    var message = JSON.parse(payload.body);

    if(message.type === 'SETUP'){
        username = message.content;
        gameId = message.gameId;
        window.location.href = "https://wineguesser.herokuapp.com/lobby/"+gameId +"?#";
        subscribeToSpecific(gameId);
    }

    var notReadyElement = document.createElement('li');
    var readyElement = document.createElement('li');

    if(message.type === 'START'){
        window.location.replace("https://wineguesser.herokuapp.com/gameBoard/"+gameId);
    }
    if(message.type === 'CLOSE'){
        if(message.sender === username){

        }else{
            window.location.replace('https://wineguesser.herokuapp.com/lobby/' + gameId + '/command/redirect');
        }
    }
    if(message.type === 'LEAVE_HARD'){
        var elementToRemove = document.getElementById(message.sender);
        if(elementToRemove != null){
            elementToRemove.parentNode.removeChild(elementToRemove);
        }
        if(!notReadyElement.hasChildNodes()){
            {document.getElementById("startGame").style.display="block";}
        }
    }


    if(message.type === 'JOIN' || message.type === 'READY' || message.type === 'LEAVE'){


        if(message.type === 'LEAVE' && message.sender !== username){
            var elementToRemove = document.getElementById(message.sender);
            if(elementToRemove != null){
                if(elementToRemove.parentNode.id === 'ready-area'){
                    elementToRemove.parentNode.removeChild(elementToRemove);
                    notReadyElement.id = message.sender;
                    var notReadyNameText = document.createTextNode(message.sender);
                    notReadyArea.appendChild(notReadyElement);
                    notReadyElement.appendChild(notReadyNameText);
                    {document.getElementById('startGame').style.display="none";}
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
            }
            {document.getElementById('startGame').style.display="none";}
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






