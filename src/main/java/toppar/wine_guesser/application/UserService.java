package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.User;
import toppar.wine_guesser.domain.UserException;
import toppar.wine_guesser.repository.UserRepository;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void createUser(String username, String password) throws UserException {
        if(userRepository.findUserByUsername(username) != null) {
            throw new UserException("Användarnamn redan tagit");
        }else{
            userRepository.save(new User(username, password));
        }
    }

}
