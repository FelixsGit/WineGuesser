'use strict';

var doneArea = null;
var messageForm = null;
var stompClientConn = null;
var stompClientReg = null;
var username = null;
var client = null;
var client2 = null;
var gameId = null;
var join = null;
var lobbyCloseForm = null;
var lobbyLeaveForm = null;

function connect(event) {
    messageForm = document.getElementById('messageForm');
    if(messageForm != null){
        messageForm.addEventListener('submit', sendMessage, false);
    }
    doneArea = document.getElementById('done-area')
    if(doneArea != null){
        doneArea.addEventListener('submit', sendMessage, false);
    }
    lobbyCloseForm = document.getElementById('lobbyCloseForm');
    if(lobbyCloseForm != null){
        lobbyCloseForm.addEventListener('submit', closeGameMessage, false);
    }
    lobbyLeaveForm = document.getElementById('lobbyLeaveForm');
    if(lobbyLeaveForm != null){
        lobbyLeaveForm.addEventListener('submit', leaveGameMessage, false);
    }

    if(gameId == null){
        if(!username) {
            var socket = new SockJS('/wsGameCon');
            stompClientConn = Stomp.over(socket);
            stompClientConn.connect({}, onConnected, onError);
        }
    }else{
        var socket = new SockJS('/wsGameReg');
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
        client = stompClientReg.subscribe('/topic/'+gameId+'/game', onMessageReceived)
        client2 = stompClientReg.subscribe('/topic/'+gameId+'/gameLock', onMessageReceived)
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
    if (stompClientReg) {
        if (username && join === 'joining') {
            var chatMessage = {
                sender: username,
                content: 'specific socket communication',
                gameId: gameId,
                type: 'JOIN'
            };
            join = 'joined';
        } else if (username) {
            var chatMessage = {
                sender: username,
                content: 'specific socket communication',
                gameId: gameId,
                type: 'READY'
            };
        }
        stompClientReg.send("/app/chat.regularGameComs/" + gameId, {}, JSON.stringify(chatMessage));
    }
}

function closeGameMessage(event) {
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'CLOSE'
    };
    stompClientReg.send("/app/chat.regularGameComs/" + gameId, {}, JSON.stringify(chatMessage));
}

function leaveGameMessage(event) {
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'LEAVE'
    };
    stompClientReg.send("/app/chat.regularGameComs/" + gameId, {}, JSON.stringify(chatMessage));
}


function sendDoneMessage(event) {
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'DONE'
    };
    stompClientReg.send("/app/chat.regularGameComs/" + gameId, {}, JSON.stringify(chatMessage));
}

function sendShowResultMessage(event) {
    var chatMessage = {
        sender: username,
        content: 'specific socket communication',
        gameId: gameId,
        type: 'SHOWRESULT'
    };
    window.location.replace("https://wineguesser.herokuapp.com/gameResults/"+gameId);
    client.unsubscribe();
    client = null;
    stompClientReg.send("/app/chat.regularGameComs/" + gameId, {}, JSON.stringify(chatMessage));
}


function onMessageReceived(payload) {

    var doneElement = document.createElement('li');
    var message = JSON.parse(payload.body);

    if(message.type === 'SETUP'){
        username = message.content;
        gameId = message.gameId;
        subscribeToSpecific(gameId);
        var test = document.getElementById('myGuess');
        var test2 = document.getElementById('not-done-area');
        if(test != null && test2 == null){
            timeFunction();
        }
    }
    if(message.type === 'SHOWRESULT'){
        timeFunctionEnd();
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
        if(message.content === 'ALLDONE' && message.sender !== username){
            timeFunction();
        }
    }

    if(message.type === 'CLOSE'){
        if(message.sender === username){
        }else{
            window.location.replace('https://wineguesser.herokuapp.com/gameBoard/' + gameId + '/command/redirect');
        }
    }

}

function timeFunctionEnd() {
    setTimeout(function(){
        window.location.replace("https://wineguesser.herokuapp.com/gameResults/"+gameId);
        client.unsubscribe();
        client = null;
    }, 1000);
}


function timeFunction() {
    setTimeout(function(){
        var form = document.getElementById('viewResult');
        var button = document.createElement('button');
        button.setAttribute('id','showResult');
        button.setAttribute('type', 'submit');
        var buttonNameText = document.createTextNode('Visa Resultat');
        button.appendChild(buttonNameText);
        form.appendChild(button);
        {document.getElementById("showResult").style.display="block";}

        //adding event listner
        var resultButtonForm = document.getElementById('viewResult');
        if(resultButtonForm != null){
            resultButtonForm.addEventListener('submit', sendShowResultMessage, false);
        }
    }, 1000);
}
