package toppar.wine_guesser.domain;


public class ChatMessage {
    private MessageType type;
    private String content;
    private String sender;
    private String gameId;

    public enum MessageType {
        SETUP,
        JOIN,
        READY,
        START,
        LEAVE,
        CLOSE,
        LEAVE_HARD,
        DONE
    }

    public MessageType getType() {
        return type;
    }

    public void setType(MessageType type) {
        this.type = type;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }
}