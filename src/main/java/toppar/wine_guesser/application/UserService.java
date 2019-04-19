package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.UserRepository;

import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LobbyService lobbyService;
    @Autowired
    private UserResultsService userResultsService;

    public void createUser(String username, String password) throws UserException {
        if(userRepository.findUserByUsername(username) != null) {
            throw new UserException("Username already taken");
        }else{
            userRepository.save(new User(username, password, null));
            userResultsService.create(new UserResults(username, 0, 0, 0.00));
        }
    }

    public void setActiveGameForUser(String username, String activeGame){
        User user = userRepository.findUserByUsername(username);
        user.setActiveGame(activeGame);
        userRepository.save(user);
    }

    public void removeActiveGameFromUserWithUsername(String username){
        User user = userRepository.findUserByUsername(username);
        user.setActiveGame(null);
        userRepository.save(user);
    }

    public String getActiveGame(String username){
        User user = userRepository.findUserByUsername(username);
        String gameId = user.getActiveGame();
        if(gameId == null){
            return null;
        }
        return gameId;

    }

    public String getGameStatusByUsername(String username){
        User user = userRepository.findUserByUsername(username);
        if(user.getActiveGame() != null){
            String activeGame = user.getActiveGame();
            Lobby lobby = lobbyService.getLobbyByGameId(activeGame);
            return lobby.getGameStart();
        }
        return null;
    }

    public void cancelActiveGamesForAllUsersWithGameId(String gameId){
        List<User> users = userRepository.findAllByActiveGame(gameId);
        users.forEach(user -> {
            user.setActiveGame(null); userRepository.save(user);
        });
    }
}
