package toppar.wine_guesser.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.repository.UserRepository;
import java.util.ArrayList;
import java.util.List;

/**
 * This class is responsible for the login. The username and password will be matched
 * and given an authority based on the role of the newly logged in user.
 */

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    /**
     * Method used to load the user with the given @param from the database
     * and then grant the user authority based on the role the user have.
     * @param username for the user trying to login
     * @return a user object handled by spring
     * @throws UsernameNotFoundException if the username is not in the database
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        toppar.wine_guesser.domain.User user = userRepository.findUserByUsername(username);
        if (user == null) {
            System.out.println("user not found in db");
            throw new UsernameNotFoundException("User " + username + " was not found in the database");
        }
        List<GrantedAuthority> grantList = new ArrayList<>();
        GrantedAuthority authority = new SimpleGrantedAuthority(user.getUsername());
        grantList.add(authority);
        return new User(user.getUsername(), user.getPassword(), grantList);
    }

}