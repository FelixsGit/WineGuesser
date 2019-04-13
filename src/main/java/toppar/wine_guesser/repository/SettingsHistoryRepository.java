package toppar.wine_guesser.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.SettingsHistory;

@Repository
@Transactional(propagation = Propagation.MANDATORY)
public interface SettingsHistoryRepository extends JpaRepository<SettingsHistory, String> {

    @Override
    SettingsHistory save(SettingsHistory settingsHistory);

}