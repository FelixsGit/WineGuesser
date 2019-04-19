package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.Lobby;
import toppar.wine_guesser.domain.LobbyData;
import toppar.wine_guesser.domain.LobbyDataDTO;
import toppar.wine_guesser.repository.LobbyDataRepository;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class LobbyDataService {

    @Autowired
    private LobbyDataRepository lobbyDataRepository;
    @Autowired
    private LobbyService lobbyService;
    @Autowired
    private LobbyHistoryService lobbyHistoryService;


    public void openNewLobby(String gameHost, String gameId){
        lobbyService.createGameLobby(gameId);
        Lobby lobby = lobbyService.getLobbyByGameId(gameId);
        lobbyDataRepository.save(new LobbyData(lobby.getLobbyId(), gameHost, gameId, gameHost, 0, 0, 0));
    }

    public void addParticipant(String participant, String gameId){
        Lobby lobby = lobbyService.getLobbyByGameId(gameId);
        lobbyDataRepository.save(new LobbyData(lobby.getLobbyId(), null, gameId, participant, 0, 0, 0));
    }

    public boolean isGameHost(String username, String gameId){
         List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
         for(int i = 0; i < lobbyDataList.size(); i++){
             if(lobbyDataList.get(i).getGameHost() != null){
                 if(lobbyDataList.get(i).getGameHost().equals(username)){
                     return true;
                 }
             }
         }
         return false;
    }

    public void removeAllParticipantsFromLobbyWithGameId(String gameId){
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        lobbyHistoryService.saveLobbyData(lobbyDataList);
        lobbyDataRepository.removeAllByGameId(gameId);
    }

    public void removeParticipantFromLobby(String participant){
        lobbyHistoryService.saveLobbyData(Collections.singletonList(lobbyDataRepository.findByParticipants(participant)));
        lobbyDataRepository.removeByParticipants(participant);
    }

    public List<LobbyDataDTO> getUsersNotReadyByGameId(String gameId){
        List<LobbyDataDTO> participantsNotReadyLobbyDataList = new ArrayList<>();
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        for (LobbyData lobbyData : lobbyDataList) {
            if (lobbyData.getReady() == 0) {
                participantsNotReadyLobbyDataList.add(lobbyData);
            }
        }
        return participantsNotReadyLobbyDataList;
    }

    public List<LobbyDataDTO> getUsersReadyByGameId(String gameId){
        List<LobbyDataDTO> participantsReadyLobbyDataList = new ArrayList<>();
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        for (LobbyData lobbyData : lobbyDataList) {
            if (lobbyData.getReady() == 1) {
                participantsReadyLobbyDataList.add(lobbyData);
            }
        }
        return participantsReadyLobbyDataList;
    }

    public void setReadyForParticipant(String participant){
        LobbyData lobbyData = lobbyDataRepository.findByParticipants(participant);
        lobbyData.setReady(1);
        lobbyDataRepository.save(lobbyData);
    }

    public void setNotReadyForParticipant(String participant){
        LobbyData lobbyData = lobbyDataRepository.findByParticipants(participant);
        lobbyData.setReady(0);
        lobbyDataRepository.save(lobbyData);
    }


    public boolean checkIfAllParticipantsAreReady(String gameId){
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        for (LobbyData lobbyData : lobbyDataList) {
            if (lobbyData.getReady() != 1) {
                return false;
            }
        }
        return true;
    }

    public void setDoneTrueForParticipant(String participant){
        LobbyData lobbyData = lobbyDataRepository.findByParticipants(participant);
        lobbyData.setDone(1);
        lobbyDataRepository.save(lobbyData);
    }

    public boolean checkIfParticipantIsDone(String participant){
        LobbyData lobbyData = lobbyDataRepository.findByParticipants(participant);
        if(lobbyData.getDone() == 1){
            return true;
        }
        return false;
    }

    public boolean checkIfAllParticipantsAreDone(String gameId){
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        for (LobbyData lobbyData : lobbyDataList) {
            if (lobbyData.getDone() != 1) {
                return false;
            }
        }
        return true;
    }

    public List<LobbyDataDTO> getUsersNotDoneByGameId(String gameId){
        List<LobbyDataDTO> participantsNotDoneLobbyDataList = new ArrayList<>();
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        for (LobbyData lobbyData : lobbyDataList) {
            if (lobbyData.getDone() == 0) {
                participantsNotDoneLobbyDataList.add(lobbyData);
            }
        }
        return participantsNotDoneLobbyDataList;
    }

    public List<LobbyDataDTO> getUsersDoneByGameId(String gameId){
        List<LobbyDataDTO> participantsDoneLobbyDataList = new ArrayList<>();
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        for (LobbyData lobbyData : lobbyDataList) {
            if (lobbyData.getDone() == 1) {
                participantsDoneLobbyDataList.add(lobbyData);
            }
        }
        return participantsDoneLobbyDataList;
    }

    public List<String> getParticipantsByGameId(String gameId){
        List<LobbyData> lobbyDataList = lobbyDataRepository.findAllByGameId(gameId);
        List<String> participants = new ArrayList<>();
        lobbyDataList.forEach(lobbyData -> participants.add(lobbyData.getParticipants()));
        return participants;
    }

    public void setNotDoneForParticipant(String participant) {
        LobbyData byParticipants = lobbyDataRepository.findByParticipants(participant);
        byParticipants.setDone(0);
        lobbyDataRepository.save(byParticipants);
    }

}
